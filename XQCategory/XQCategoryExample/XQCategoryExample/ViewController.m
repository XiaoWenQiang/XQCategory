//
//  ViewController.m
//  XQCategoryExample
//
//  Created by xiao qiang on 2018/3/9.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "ViewController.h"
#import "XQCategoriesHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView.image = [UIImage imageWithColor:[UIColor colorWithRGB:0xf5f5f5]];
    [self.view addSubview:imageView];    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
