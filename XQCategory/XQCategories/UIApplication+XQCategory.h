//
//  UIApplication+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (XQCategory)

@property (nullable, nonatomic, readonly) NSString *appBundleName;
@property (nullable, nonatomic, readonly) NSString *appBundleID;
@property (nullable, nonatomic, readonly) NSString *appVersion;
@property (nullable, nonatomic, readonly) NSString *appBuildVersion;

@property (nonatomic, readonly) int64_t memoryUsage;
@property (nonatomic, readonly) float cpuUsage;

@end
