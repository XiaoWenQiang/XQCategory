//
//  UINavigationController+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UINavigationController+XQCategory.h"
#import "NSString+XQCategory.h"
#import "UIFont+XQCategory.h"

@implementation UINavigationController (XQCategory)

+ (UIBarButtonItem *)xqBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = 40;
    CGFloat height = 40;
    btn.frame = CGRectMake(0, 0, width, height);
    btn.contentEdgeInsets = UIEdgeInsetsMake((height - image.size.height) / 2, 0, (height - image.size.height) / 2, (width - image.size.width));
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)xqBarButtonWithTarget:(id)target action:(SEL)action title:(NSString *)title font:(NSString *)font titleColor:(UIColor *)color {
    CGFloat width = [title calculateSingleStringSizeWithFont:[UIFont normalFont:font.integerValue]];
    UIButton *btn = [[UIButton alloc] init];
    btn.titleLabel.font = [UIFont normalFont:font.integerValue];
    btn.frame = CGRectMake(0, 0, width, width);
    btn.titleEdgeInsets = UIEdgeInsetsMake(1, 0, 0, -10);
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:title forState:UIControlStateNormal];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
