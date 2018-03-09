//
//  UIColor+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIColor (XQCategory)

//e.g.  @"#f5f5f5"
+ (UIColor *)colorWithString:(NSString *)name;

//e.g.  0xf5f5f5
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;
//e.g.  0xf5f5f5ff
+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;
//e.g.  0xf5f5f5 alpha = 0,1
+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

- (UIImage *)imageWithSize:(CGSize)size;

@end
