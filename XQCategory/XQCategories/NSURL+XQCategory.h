//
//  NSURL+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (XQCategory)

@property (nonatomic, readonly) NSDictionary *params;

+ (NSURL *)URLWithString:(NSString *)string;

@end
