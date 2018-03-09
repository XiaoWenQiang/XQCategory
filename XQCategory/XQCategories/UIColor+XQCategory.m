//
//  UIColor+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UIColor+XQCategory.h"

int convertToInt(char c)
{
    if (c >= '0' && c <= '9') {
        return c - '0';
    } else if (c >= 'a' && c <= 'f') {
        return c - 'a' + 10;
    } else if (c >= 'A' && c <= 'F') {
        return c - 'A' + 10;
    } else {
        return printf("字符非法!");
    }
}

@implementation UIColor (XQCategory)

+ (UIColor *)colorWithString:(NSString *)name {
    if (name.length == 0) {
        return nil;
    }
    if (name.length < 7) {
        return nil;
    }
    NSString *firstStr = [name substringToIndex:1];
    if (![firstStr isEqualToString:@"#"]) {
        return nil;
    }
    
    const char *str = [[name substringWithRange:NSMakeRange(1, 6)] UTF8String];
    NSString *alphaString = [name substringFromIndex:7];
    CGFloat red = (convertToInt(str[0])*16 + convertToInt(str[1])) / 255.0f;
    CGFloat green = (convertToInt(str[2])*16 + convertToInt(str[3])) / 255.0f;
    CGFloat blue = (convertToInt(str[4])*16 + convertToInt(str[5])) / 255.0f;
    CGFloat alpha = [alphaString isEqualToString:@""] ? 1 : alphaString.floatValue/255;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:1];
}

+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue {
    return [UIColor colorWithRed:((rgbaValue & 0xFF000000) >> 24) / 255.0f
                           green:((rgbaValue & 0xFF0000) >> 16) / 255.0f
                            blue:((rgbaValue & 0xFF00) >> 8) / 255.0f
                           alpha:(rgbaValue & 0xFF) / 255.0f];
}

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:alpha];
}

- (UIImage *)imageWithSize:(CGSize)size {
    UIImage *img = nil;
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.CGColor);
    CGContextFillRect(context, rect);
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
