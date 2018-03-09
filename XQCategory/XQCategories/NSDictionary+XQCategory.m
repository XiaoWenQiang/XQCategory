//
//  NSDictionary+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "NSDictionary+XQCategory.h"

@implementation NSDictionary (XQCategory)

+ (BOOL)isDictionaryEmpty:(NSDictionary *)dictionary {
    BOOL isEmpty = YES;
    if (dictionary == nil || [dictionary isKindOfClass:[NSString class]]|| [dictionary isKindOfClass:[NSNull class]] || dictionary.allKeys == 0) {
        isEmpty = YES;
    } else {
        isEmpty = NO;
    }
    return isEmpty;
}

- (NSArray *)allKeysSort {
    return [[self allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

- (NSArray *)allValuesSortedByKeys {
    NSArray *sortedKeys = [self allKeysSort];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (id key in sortedKeys) {
        [arr addObject:self[key]];
    }
    return [arr copy];
}

- (NSDictionary *)dictionarySort {
    NSMutableDictionary *sortDictionary = [NSMutableDictionary dictionary];
    for (NSString *key in [self allKeysSort]) {
        NSString *value = [self objectForKey:key];
        [sortDictionary setObject:value forKey:key];
    }
    return [sortDictionary mutableCopy];
}

- (NSDictionary *)dictionaryByLowercaseSort {
    NSMutableDictionary *sortDictionary = [NSMutableDictionary dictionary];
    
    NSArray *afterSortKeyArray = [[self allKeys] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        /*
         NSComparisonResult resuest = [obj2 compare:obj1]; //倒序
         */
        obj1 = [obj1 lowercaseString];
        obj2 = [obj2 lowercaseString];
        NSComparisonResult resuest = [obj1 compare:obj2];
        return resuest;
    }];
    
    for (NSString *key in afterSortKeyArray) {
        NSString *value = [self objectForKey:key];
        [sortDictionary setObject:value forKey:key];
    }
    
    return [sortDictionary mutableCopy];
}

- (BOOL)isContainsObjectForKey:(id)key {
    if (!key) return NO;
    return self[key] != nil;
}

- (NSString *)jsonStringEncoded {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        if (!error) return json;
    }
    return nil;
}

@end
