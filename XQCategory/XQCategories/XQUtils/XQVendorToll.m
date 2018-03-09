//
//  XQVendorToll.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "XQVendorToll.h"
#import "XQKeyChainTool.h"
#import <UIKit/UIKit.h>

@implementation XQVendorToll

+ (NSString *)getIDFV {
    NSString *IDFV = (NSString *)[XQKeyChainTool load:@"IDFV"];
    
    if ([IDFV isEqualToString:@""] || !IDFV) {
        
        IDFV = [UIDevice currentDevice].identifierForVendor.UUIDString;
        [XQKeyChainTool save:@"IDFV" data:IDFV];
    }
    
    return IDFV;
}


@end

