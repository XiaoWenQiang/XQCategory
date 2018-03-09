//
//  UIImage+XQCategory.h
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,E_ImageWaterDirect) {
    kE_ImageWaterDirectTopLeft = 10,//左上
    kE_ImageWaterDirectTopRight = 11,//右上
    kE_ImageWaterDirectBottomLeft = 12,//左下
    kE_ImageWaterDirectBottomRight = 13,//右下
    kE_ImageWaterDirectCenter = 14//正中
};

@interface UIImage (XQCategory)

/**
 *  修正图片方向
 *
 *  @return 修改后的图片
 */
- (UIImage *)fixOrientation;

@property (nonatomic, strong, readonly) UIImage *roundImage;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

#pragma mark - 模糊
// 对图片进行模糊处理
+ (UIImage *)gaussianBlurImage:(UIImage *)image andInputRadius:(CGFloat)radius;
// 由颜色生成模糊图片
+ (UIImage *)gaussianBlurImageWithColor:(UIColor *)color andSize:(CGSize)size andInputRadius:(CGFloat)radius;

#pragma mark - 缩放
//UIImage自定长宽缩放
+(UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
//UIImage等比例缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(CGFloat)scaleSize;

#pragma mark - 截屏
// 直接截屏
+ (UIImage *)cutScreen;
//从给定UIView中截图：UIView转UIImage
+ (UIImage *)cutFromView:(UIView *)view;
//从给定UIImage和指定Frame截图：
- (UIImage *)cutWithFrame:(CGRect)frame;


#pragma mark - 水印
/**
 *  文字水印
 *
 *  @param text      文字
 *  @param direction 文字方向
 *  @param fontColor 文字颜色
 *  @param fontPoint 字体
 *  @param marginXY   对齐点
 */
- (UIImage *)waterWithText:(NSString *)text direction:(E_ImageWaterDirect)direction fontColor:(UIColor *)fontColor fontPoint:(CGFloat)fontPoint marginXY:(CGPoint)marginXY;

/**
 *  绘制图片水印
 *
 *  @param waterImage 图片水印
 *  @param direction  方向
 *  @param waterSize  水印大小
 *  @param marginXY   对齐点
 */
- (UIImage *)waterWithWaterImage:(UIImage *)waterImage direction:(E_ImageWaterDirect)direction waterSize:(CGSize)waterSize marginXY:(CGPoint)marginXY;


#pragma mark - 其他
/**
 *  转成黑白图像
 *  @param sourceImage 原图
 */
+ (UIImage*)covertToGrayImageFromImage:(UIImage*)sourceImage;

/**
 *  获取图片指定位置的颜色
 *
 *  @param point 位置
 */
- (UIColor *)colorAtPoint:(CGPoint)point;

/**
 *  旋转图片
 *
 *  @param isHorizontal 方向
 *
 *  @return 结果图片
 */
- (UIImage *)flip:(BOOL)isHorizontal;

@end
