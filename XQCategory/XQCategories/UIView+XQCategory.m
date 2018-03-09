//
//  UIView+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UIView+XQCategory.h"
#import <objc/runtime.h>

@implementation UIView (XQCategory)

#pragma mark - Property
- (UITapGestureRecognizer *)tapGestureRecognizer {
    return objc_getAssociatedObject(self, @"xq_tapGestureRecognizer");
}

- (void)setTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer {
    objc_setAssociatedObject(self, @"xq_tapGestureRecognizer", tapGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat) height {
    return self.frame.size.height;
}

- (CGFloat) width {
    return self.frame.size.width;
}

- (CGFloat) left {
    return self.frame.origin.x;
}

- (CGFloat) top {
    return self.frame.origin.y;
}

- (CGFloat) right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat) bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)centerY {
    return self.center.y;
}
- (CGFloat)centerX {
    return self.center.x;
}

- (CGSize)size {
    return self.frame.size;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = CGRectMake(self.left, self.top, self.width, height);
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = CGRectMake(self.left, self.top, width, self.height);
    self.frame = frame;
}

- (void)setLeft:(CGFloat)left {
    CGRect frame = CGRectMake(left, self.top, self.width, self.height);
    self.frame = frame;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = CGRectMake(self.left + self.width, self.top, self.width, self.height);
    self.frame = frame;
}

- (void)setTop:(CGFloat)top {
    CGRect frame = CGRectMake(self.left, top, self.width, self.height);
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = CGRectMake(self.left, bottom - self.height, self.width, bottom);
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)makeRound {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.width / 2.0f;
}

- (void)removeAllSubviews {
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

- (UIViewController *)viewController {
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)addGestureRecognizerWithTarget:(id)target action:(SEL)action {
    if (self.tapGestureRecognizer != nil) {
        [self removeGestureRecognizer:self.tapGestureRecognizer];
    }
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tgr.numberOfTapsRequired = 1;
    self.tapGestureRecognizer = tgr;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:self.tapGestureRecognizer];
}

- (void)removeGestureRecognizer {
    if (self.tapGestureRecognizer != nil) {
        [self removeGestureRecognizer:self.tapGestureRecognizer];
    }
}

@end
