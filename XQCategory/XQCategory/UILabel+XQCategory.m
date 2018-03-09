//
//  UILabel+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UILabel+XQCategory.h"
#import "NSString+XQCategory.h"
#import "UIView+XQCategory.h"

@implementation UILabel (XQCategory)

+ (UILabel *)xq_normalLabel {
    return [UILabel xq_normalLabelWithPropertyText:nil frame:CGRectZero textColor:nil font:nil];
}

+ (UILabel *)xq_normalLabelWithPropertyText:(NSString *)text frame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.text = text;
    label.frame = frame;
    label.textColor = textColor;
    return label;
}

+ (UILabel *)xq_linesLabelWithAttributeText:(NSString *)text frame:(CGRect)frame textColor:(UIColor *)textColor font:(UIFont *)font lineSpace:(int)lineSpace sizeForLabel:(CGSize)sizeForLabel {
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.text = text;
    label.frame = frame;
    label.textColor = textColor;
    label.numberOfLines = 0;
    
    CGSize sizeForText = [text calculateStringSizeWithFont:font andSize:sizeForLabel lineSpace:lineSpace];
    label.height = sizeForText.height;
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    [label setAttributedText:attributedString];
    [label sizeToFit];
    
    return label;
}

- (NSMutableAttributedString *)attributedStringWithType:(NSAttributedStringKey)name value:(id)value range:(NSRange)range {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.text];
    [attributedString addAttribute:name value:value range:range];
    return attributedString;
}



@end
