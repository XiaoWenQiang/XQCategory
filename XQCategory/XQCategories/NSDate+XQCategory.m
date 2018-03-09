//
//  NSDate+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "NSDate+XQCategory.h"

#define NSCalendarUnitsKeys111 @{ @(NSCalendarUnitEra): @"era", @(NSCalendarUnitYear): @"year", @(NSCalendarUnitMonth): @"month", @(NSCalendarUnitDay): @"day", @(NSCalendarUnitHour): @"hour", @(NSCalendarUnitMinute): @"minute", @(NSCalendarUnitSecond): @"second", @(NSCalendarUnitWeekday): @"weekday", @(NSCalendarUnitWeekdayOrdinal): @"weekdayOrdinal", @(NSCalendarUnitQuarter): @"quarter", @(NSCalendarUnitWeekOfMonth): @"weekOfMonth", @(NSCalendarUnitWeekOfYear): @"weekOfYear", @(NSCalendarUnitYearForWeekOfYear): @"yearForWeekOfYear" }

@implementation NSDate (XQCategory)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second {
    NSDateComponents *comp = [[NSDateComponents alloc]init];
    [comp setYear:year];
    [comp setMonth:month];
    [comp setDay:day];
    [comp setHour:hour];
    [comp setMinute:minute];
    [comp setSecond:second];
    
    NSCalendar *myCal = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [myCal dateFromComponents:comp];
    return date;
}

- (NSInteger)weekdayIndex {
    NSCalendarUnit calendarUnits = 0;
    for (NSNumber *calendarUnit in NSCalendarUnitsKeys111.allKeys)
    {
        calendarUnits |= [calendarUnit unsignedIntegerValue];
    }
    NSInteger weekday = [[[NSCalendar.autoupdatingCurrentCalendar components:calendarUnits fromDate:self] valueForKey:NSCalendarUnitsKeys111[@(NSCalendarUnitWeekday)]] integerValue];
    
    NSInteger result = weekday - 2;
    if (result < 0) {
        return 6;
    } else {
        return result;
    }
}

+ (NSString *)weekdayStringWithWeek:(NSInteger)week {
    NSString *result = @"";
    switch (week) {
        case 0:
            result = @"一";
            break;
        case 1:
            result = @"二";
            break;
        case 2:
            result = @"三";
            break;
        case 3:
            result = @"四";
            break;
        case 4:
            result = @"五";
            break;
        case 5:
            result = @"六";
            break;
        case 6:
        default:
            result = @"日";
            break;
    }
    return result;
}

+ (NSDate *)dateFromMilliSecond:(long long)milliSecond {
    return [self dateFromSecond:milliSecond / 1000];
}
+ (NSDate *)dateFromSecond:(long long)second {
    return [NSDate dateWithTimeIntervalSince1970:second];
}


#pragma mark - NSDate & NSString

+ (NSDictionary *)DateFormatterDictionary {
    static NSDictionary *result = nil;
    if (result == nil) {
        result = @{    @(kE_DateFormatterAllFormat1):@"yyyy年MM月dd日 HH时mm分",
                       @(kE_DateFormatterAllFormat2):@"yyyy.MM.dd HH:mm",
                       @(kE_DateFormatterAllFormat3):@"yyyy-MM-dd HH:mm:ss",
                       @(kE_DateFormatterFormat1):@"HH:mm",
                       @(kE_DateFormatterFormat2):@"M月d日",
                       @(kE_DateFormatterFormat3):@"HH:mm:ss",
                       @(kE_DateFormatterDate):@"yyyy-MM-dd",
                       @(kE_DateFormatterDate2):@"yyyy年MM月dd日",
                       @(kE_DateFormatterDate3):@"yyyyMMdd",
                       @(kE_DateFormatterDate4):@"yyyyMM",
                       @(kE_DateFormatterDate5):@"M月yyyy年",
                       @(kE_DateFormatterDate6):@"yyyyMMddHHmm",
                       @(kE_DateFormatterDate7):@"yyyy.M.d HH:mm",
                       @(kE_DateFormatterDate8):@"yyyy.MM.dd",
                       @(kE_DateFormatterDate9):@"yyyy年M月d日",
                       @(kE_DateFormatterDate10):@"yyyy年M月",
                       @(kE_DateFormatterDate11):@"yyyy年MM月dd日 HH:mm:ss",
                       @(kE_DateFormatterDate12):@"MM.dd",
                       @(kE_DateFormatterDate13):@"yyyy.MM",
                       @(kE_DateFormatterDate14):@"yyyy年"};
    }
    return result;
    
}

- (NSString *)dateStringWithFormatter:(E_DateFormatter)formatter {
    NSString *formatterStr = [NSDate DateFormatterDictionary][@(formatter)];
    return [self dateStringWithFormatterString:formatterStr];
}
- (NSString *)dateStringWithFormatterString:(NSString *)string {
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setDateFormat:string];
    NSString *result = [formatter stringFromDate:self];
    return result;
}
+ (NSDate *)dateFromString:(NSString *)string formatter:(E_DateFormatter)formatter {
    NSString *formatterStr = [NSDate DateFormatterDictionary][@(formatter)];
    return [self dateFromString:string formatterString:formatterStr];
}
+ (NSDate *)dateFromString:(NSString *)string formatterString:(NSString *)formatterString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatterString];
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

#pragma clang diagnostic pop


@end
