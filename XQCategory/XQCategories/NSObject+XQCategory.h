//
//  NSObject+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XQCategory)

+ (NSString *)className;

- (NSString *)className;

- (void)setAssociateValue:(id)value withKey:(void *)key;

- (void)setAssociateWeakValue:(id)value withKey:(void *)key;

- (void)removeAssociatedValues;

- (id)getAssociatedValueForKey:(void *)key;

@end
