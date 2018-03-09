//
//  UIFont+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UIFont+XQCategory.h"

@implementation UIFont (XQCategory)

+ (UIFont *)normalFont:(CGFloat)size {
    return [self systemFontOfSize:size];
}

+ (UIFont *)boldFont:(CGFloat)size {
    return [self boldSystemFontOfSize:size];
}

+ (UIFont *)italicFont:(CGFloat)size {
    return [self italicSystemFontOfSize:size];
}


@end
