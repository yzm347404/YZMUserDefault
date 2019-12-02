//
//  YZMUserDefault.h
//  YZMUserDefaultMaster
//
//  Created by yangzhenmin on 2019/3/3.
//  Copyright © 2019年 yangzhenmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZMUserDefault : NSObject<NSCopying,NSMutableCopying>

//test2

+ (instancetype)shareInstance;

- (void)yzmUserDefault_setObject:(id)obj forKey:(NSString *)key;

- (id)yzmUserDefault_objectForKey:(NSString *)key;

- (BOOL)yzmUserDefault_synchronize;

- (NSDictionary *)getAllEntities;

@end
