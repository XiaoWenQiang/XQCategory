//
//  UIImageView+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (XQCategory)

//截屏
- (UIImage *)screenShotClear;
- (UIImage *)screenShotNotClear;
- (UIImage *)screenShotClear:(CGSize)size;
- (UIImage *)screenShotNotClear:(CGSize)size;

//拼接图片  上下拼接
- (UIImage *)combine:(UIImage *)topImage bottomImage:(UIImage *)bottomImage;

@end
