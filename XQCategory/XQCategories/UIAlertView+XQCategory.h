//
//  UIAlertView+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2018/3/9.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewCallback)(NSInteger buttonIndex);


@interface UIAlertView (XQCategory)

- (void)showWithCallbackBlock:(UIAlertViewCallback)callback;

@end
