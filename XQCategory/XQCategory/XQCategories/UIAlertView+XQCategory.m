//
//  UIAlertView+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/9/18.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UIAlertView+XQCategory.h"
#import <objc/runtime.h>

@implementation UIAlertView (XQCategory)


const static char kUIAlertViewCallbackKey;

- (void)showWithCallbackBlock:(UIAlertViewCallback)callback {
    objc_setAssociatedObject(self, &kUIAlertViewCallbackKey, callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.delegate = (id)self;
    [self show];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIAlertViewCallback callback = objc_getAssociatedObject(self, &kUIAlertViewCallbackKey);
    if (callback) {
        callback(buttonIndex);
    }
}


@end
