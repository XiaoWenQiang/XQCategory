//
//  ViewController.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "ViewController.h"
#import "XQCategoriesHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.width - 200) / 2, 100, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.layer.masksToBounds = YES;
    UIImage *image = [UIImage imageNamed:@"howToEndOrder"];//[UIImage gaussianBlurImage:[UIImage imageNamed:@"howToEndOrder"] andInputRadius:2];
    image = [image waterWithText:@"小强" direction:kE_ImageWaterDirectCenter fontColor:[UIColor colorWithRGB:0xB22222] fontPoint:60.0F marginXY:CGPointMake(0,0)];
//    imageView.image = [UIImage gaussianBlurImageWithColor:[UIColor colorWithRGB:0xB22222] andSize:CGSizeMake(20, 20) andInputRadius:5];
    
    image = [image waterWithWaterImage:[UIImage imageNamed:@"test"] direction:kE_ImageWaterDirectTopLeft waterSize:CGSizeMake(100, 100) marginXY:CGPointMake(10, 10)];
    
    image = [image flip:YES];
    
    imageView.image = image;
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
