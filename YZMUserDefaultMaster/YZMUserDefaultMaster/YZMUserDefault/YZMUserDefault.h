//
//  YZMUserDefault.h
//  YZMUserDefaultMaster
//
//  Created by yangzhenmin on 2019/3/3.
//  Copyright © 2019年 yangzhenmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZMUserDefault : NSObject<NSCopying,NSMutableCopying>

//test1 222 333/test2//test2  66
//test2 777


//111111111111


+ (instancetype)shareInstance;

- (void)yzmUserDefault_setObject:(id)obj forKey:(NSString *)key;

- (id)yzmUserDefault_objectForKey:(NSString *)key;

- (BOOL)yzmUserDefault_synchronize;

- (NSDictionary *)getAllEntities;

@end
