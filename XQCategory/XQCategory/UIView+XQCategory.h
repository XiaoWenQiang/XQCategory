//
//  UIView+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XQCategory)

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;


- (void)makeRound;

- (void)removeAllSubviews;

- (UIViewController *)viewController;

- (void)addGestureRecognizerWithTarget:(id)target action:(SEL)action;
- (void)removeGestureRecognizer;

@end
