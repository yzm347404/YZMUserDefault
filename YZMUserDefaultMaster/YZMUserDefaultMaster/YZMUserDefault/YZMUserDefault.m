//
//  YZMUserDefault.m
//  YZMUserDefaultMaster
//
//  Created by yangzhenmin on 2019/3/3.
//  Copyright © 2019年 yangzhenmin. All rights reserved.
//

#import "YZMUserDefault.h"

static YZMUserDefault *userDefault = nil;

static NSString *userDefaultPlistPath = nil;

static dispatch_semaphore_t semaphore = nil;

static NSMutableDictionary *newCache = nil;

static NSMutableDictionary *oldCache = nil;

@implementation YZMUserDefault

+ (void)initialize
{
    NSString *documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    userDefaultPlistPath = [documentPath stringByAppendingPathComponent:@"YZMUserDefault.plist"];
    semaphore =  dispatch_semaphore_create(1);
    oldCache = [[NSMutableDictionary alloc] initWithContentsOfFile:userDefaultPlistPath];
    newCache = [NSMutableDictionary dictionary];
}

+ (instancetype)shareInstance
{
    userDefault = [[[self class] alloc] init];
    return userDefault;
}

- (id)copyWithZone:(NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userDefault = [[[self class] alloc] init];
    });
    return userDefault;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userDefault = [[[self class] alloc] init];
    });
    return userDefault;
}

- (void)yzmUserDefault_setObject:(id)obj forKey:(NSString *)key
{
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [newCache setObject:obj forKey:key];
    dispatch_semaphore_signal(semaphore);
}

- (id)yzmUserDefault_objectForKey:(NSString *)key
{
    NSMutableDictionary *cache = nil;
    if (![newCache.allKeys containsObject:key]) {
        cache = oldCache;
    }else
    {
        cache = newCache;
    }
    id obj = [cache objectForKey:key];
    return obj;
}

- (BOOL)yzmUserDefault_synchronize
{
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    [oldCache addEntriesFromDictionary:newCache];
    BOOL flag =  [oldCache writeToFile:userDefaultPlistPath atomically:YES];
    if (flag) {
        [newCache removeAllObjects];
    }else
    {
        [oldCache removeObjectsForKeys:newCache.allKeys];
    }
    dispatch_semaphore_signal(semaphore);
    return flag;
}

- (NSDictionary *)getAllEntities
{
    [self yzmUserDefault_synchronize];
    return oldCache;
}

@end
