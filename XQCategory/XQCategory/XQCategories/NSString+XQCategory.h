//
//  NSString+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (XQCategory)

- (BOOL)isEmptyString;

// 是否是纯数字的字符串
- (BOOL)isPureInt;
// 大于零的整数
- (BOOL)isNoZeorIntValue;
// 是否包含表情
- (BOOL)isContainEmoji;

// 是否是包含中文
- (BOOL)isContainChinese;

- (BOOL)isValidateEmail;

// 获取字符串长度 单行
- (CGFloat)calculateSingleStringSizeWithFont:(UIFont *)font;

// 获取字符串高度 多行
- (CGSize)calculateStringSizeWithFont:(UIFont *)font andSize:(CGSize)size lineSpace:(int)lineSpace;

//是否包含string
- (BOOL)containsString:(NSString *)string;

+ (NSString *)stringWithUUID;

//四舍五入
+ (float)roundFloat:(float)number;

#pragma mark - Base64 Encode/Decode
- (NSString *)transform_Base64Encode;
- (NSString *)transform_Base64Decode;

#pragma mark - URL Encode/Decode
- (NSString *)transform_URLEncode;
- (NSString *)transform_URLDecode;

#pragma mark - MD5
- (NSString *)transform_MD5;

#pragma mark - AES Encrypt/Decrypt
- (NSString *)transform_AES128EncryptWithKey:(NSString *)key;
- (NSString *)transform_AES128DecryptWithKey:(NSString *)key;

@end
