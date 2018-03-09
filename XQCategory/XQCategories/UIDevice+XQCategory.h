//
//  UIDevice+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (XQCategory)

//设备唯一标识
@property (nullable, nonatomic, readonly) NSString *deviceUUID;

//是否为ipad或者ipad mini
@property (nonatomic, readonly) BOOL isPad;

// 是否为模拟器
@property (nonatomic, readonly) BOOL isSimulator;

// 是否越狱
@property (nonatomic, readonly) BOOL isJailbroken;

//是否有电话卡
@property (nonatomic, readonly) BOOL canMakePhoneCalls;

/// 设备model  e.g. "iPhone6,1" "iPad4,6"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString *machineModel;

///设备名称. e.g. "iPhone 5s" "iPad mini 2"
/// @see http://theiphonewiki.com/wiki/Models
@property (nullable, nonatomic, readonly) NSString *machineModelName;

/// 手机的wif ip. e.g. @"192.168.1.111"
@property (nullable, nonatomic, readonly) NSString *ipAddressWIFI;

/// 手机的网络ip . e.g. @"10.2.2.222"
@property (nullable, nonatomic, readonly) NSString *ipAddressCell;

+ (double)systemVersion;

#ifndef kSystemVersion
#define kSystemVersion [UIDevice systemVersion]
#endif

#ifndef kiOS7Later
#define kiOS7Later (kSystemVersion >= 7)
#endif

#ifndef kiOS8Later
#define kiOS8Later (kSystemVersion >= 8)
#endif

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

#ifndef kiOS10Later
#define kiOS10Later (kSystemVersion >= 10)
#endif

#ifndef kiOS11Later
#define kiOS11Later (kSystemVersion >= 11)
#endif

#pragma mark - Disk Space

// 内存空间 byte.
@property (nonatomic, readonly) int64_t diskSpace;

//剩余内存空间 byte
@property (nonatomic, readonly) int64_t diskSpaceFree;

// 使用内存空间 byte
@property (nonatomic, readonly) int64_t diskSpaceUsed;

#pragma mark - Memory Information
//运行内存空间
@property (nonatomic, readonly) int64_t memoryTotal;

//运行内存空间使用量
@property (nonatomic, readonly) int64_t memoryUsed;

//运行内存空间空闲量
@property (nonatomic, readonly) int64_t memoryFree;


@end
