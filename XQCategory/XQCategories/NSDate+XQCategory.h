//
//  NSDate+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,E_DateFormatter) {
    kE_DateFormatterAllFormat1       =       100,        // yyyy年MM月dd日 HH时mm分
    kE_DateFormatterAllFormat2       =       101,        // yyyy.MM.dd HH:mm
    kE_DateFormatterAllFormat3       =       103,        // yyyy-MM-dd HH:mm:ss
    kE_DateFormatterFormat1          =       200,        // HH:mm
    kE_DateFormatterFormat2          =       201,        // M月d日
    kE_DateFormatterFormat3          =       202,        // HH:mm:ss
    kE_DateFormatterDate             =       300,        // yyyy-MM-dd
    kE_DateFormatterDate2            =       301,        // yyyy年MM月dd日
    kE_DateFormatterDate3            =       302,        // yyyyMMdd
    kE_DateFormatterDate4            =       304,        // yyyyMM
    kE_DateFormatterDate5            =       305,        // M月yyyy年
    kE_DateFormatterDate6            =       306,        // yyyyMMddHHmm
    kE_DateFormatterDate7            =       307,        // yyyy.M.d HH:mm
    kE_DateFormatterDate8            =       308,        // yyyy.MM.dd
    kE_DateFormatterDate9            =       309,        // yyyy年M月d日
    kE_DateFormatterDate10           =       310,        // yyyy年M月
    kE_DateFormatterDate11           =       311,        // yyyy年MM月dd日 HH:mm:ss
    kE_DateFormatterDate12           =       312,        // MM.dd
    kE_DateFormatterDate13           =       313,        // yyyy.MM
    kE_DateFormatterDate14           =       314,        // yyyy年
};

@interface NSDate (XQCategory)


+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;

//这周的第几天
- (NSInteger)weekdayIndex;

//更加 0 到 6转换成 大写的 一 到 日
+ (NSString *)weekdayStringWithWeek:(NSInteger)week;

//毫秒转成 NSDate
+ (NSDate *)dateFromMilliSecond:(long long)milliSecond;

//秒转成 NSDate
+ (NSDate *)dateFromSecond:(long long)second;

//根据枚举转换成对应的时间格式
- (NSString *)dateStringWithFormatter:(E_DateFormatter)formatter;
- (NSString *)dateStringWithFormatterString:(NSString *)string;

//根据枚举转换成对应的时间格式
+ (NSDate *)dateFromString:(NSString *)string formatter:(E_DateFormatter)formatter;
+ (NSDate *)dateFromString:(NSString *)string formatterString:(NSString *)formatterString;


@end
