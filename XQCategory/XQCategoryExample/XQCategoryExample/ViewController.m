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
    
    UIAlertView *alertVeiw = [[UIAlertView alloc] initWithTitle:@"例子" message:@"发放的发顺丰的" delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alertVeiw showWithCallbackBlock:^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            NSLog(@"1");
        }
    }];
}


@end
