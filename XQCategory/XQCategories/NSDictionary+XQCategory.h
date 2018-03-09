//
//  NSDictionary+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (XQCategory)

+ (BOOL)isDictionaryEmpty:(NSDictionary *)dictionary;

- (NSDictionary *)dictionarySort;

- (NSDictionary *)dictionaryByLowercaseSort;

- (BOOL)isContainsObjectForKey:(id)key;

- (NSArray *)allKeysSort;
- (NSArray *)allValuesSortedByKeys;

- (NSString *)jsonStringEncoded;

@end
