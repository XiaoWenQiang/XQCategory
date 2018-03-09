//
//  UILabel+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XQCategory)

+ (UILabel *)xq_normalLabel;

+ (UILabel *)xq_normalLabelWithPropertyText:(NSString *)text frame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font;

+ (UILabel *)xq_linesLabelWithAttributeText:(NSString *)text frame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font lineSpace:(int)lineSpace sizeForLabel:(CGSize)sizeForLabel;

- (NSMutableAttributedString *)attributedStringWithType:(NSAttributedStringKey)name value:(id)value range:(NSRange)range;

@end
