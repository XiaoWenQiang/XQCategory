//
//  UIImageView+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UIImageView+XQCategory.h"

@implementation UIImageView (XQCategory)

- (UIImage *)screenShotClear {
   return [self screenShotClear:self.bounds.size];
}

- (UIImage *)screenShotNotClear {
   return [self screenShotNotClear:self.bounds.size];
}

- (UIImage *)screenShotClear:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)screenShotNotClear:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)combine:(UIImage *)topImage bottomImage:(UIImage *)bottomImage {
    CGFloat width = topImage.size.width;
    CGFloat height = topImage.size.height + bottomImage.size.height;
    CGSize offScreenSize = CGSizeMake(width, height);
    UIGraphicsBeginImageContext(offScreenSize);
    
    CGRect rect = CGRectMake(0, 0, width, topImage.size.height);
    [topImage drawInRect:rect];
    
    rect = CGRectMake(0, topImage.size.height, width, bottomImage.size.height);
    [bottomImage drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
