//
//  XQKeyChainTool.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XQKeyChainTool : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;


@end
