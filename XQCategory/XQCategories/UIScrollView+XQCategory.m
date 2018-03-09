//
//  UIScrollView+XQCategory.m
//  XQCategory
//
//  Created by xiao qiang on 2016/7/8.
//  Copyright © 2018年 xiao qiang. All rights reserved.
//

#import "UIScrollView+XQCategory.h"

@implementation UIScrollView (XQCategory)

- (void)scrollToTop {
    [self scrollToTopAnimated:YES];
}

- (void)scrollToBottom {
    [self scrollToBottomAnimated:YES];
}

- (void)scrollToLeft {
    [self scrollToLeftAnimated:YES];
}

- (void)scrollToRight {
    [self scrollToRightAnimated:YES];
}

- (void)scrollToTopAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = 0 - self.contentInset.top;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToBottomAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.y = self.contentSize.height - self.bounds.size.height + self.contentInset.bottom;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToLeftAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = 0 - self.contentInset.left;
    [self setContentOffset:off animated:animated];
}

- (void)scrollToRightAnimated:(BOOL)animated {
    CGPoint off = self.contentOffset;
    off.x = self.contentSize.width - self.bounds.size.width + self.contentInset.right;
    [self setContentOffset:off animated:animated];
}

- (void)printScrollViewAttentionProperty {
    NSString *str1 = [NSString stringWithFormat:@"class:%@", NSStringFromClass([self class])];
    NSString *str2 = [NSString stringWithFormat:@"frame:%@", NSStringFromCGRect(self.frame)];
    
    NSString *str3 = [NSString stringWithFormat:@"contentSize:%@", NSStringFromCGSize(self.contentSize)];
    NSString *str4 = [NSString stringWithFormat:@"cotentOffset:%@", NSStringFromCGPoint(self.contentOffset)];
    NSString *str5 = [NSString stringWithFormat:@"contentInset:%@", NSStringFromUIEdgeInsets(self.contentInset)];
    
    NSArray *ary = @[str1, str2, str3, str4, str5];
    
    NSString *str = [ary componentsJoinedByString:@"\n"];
    
    NSLog(@"\n%@", str);
}

@end
