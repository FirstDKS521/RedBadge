//
//  UIView+DKSBadge.m
//  TestProject
//
//  Created by aDu on 16/9/15.
//  Copyright © 2016年 DuKaiShun. All rights reserved.
//

#import "UIView+DKSBadge.h"
#import <objc/runtime.h>

static NSString * const badgeViewKey;
static NSInteger const pointWidth = 6; //小红点的宽高
static NSInteger const rightRange = 5; //距离控件右边的距离
@implementation UIView (DKSBadge)

- (void)showBadge
{
    self.badge = [[UIView alloc] init];
    self.badge.frame = CGRectMake(self.frame.size.width + rightRange, -pointWidth / 2, pointWidth, pointWidth);
    self.badge.backgroundColor = [UIColor redColor];
    //圆角为宽度的一半
    self.badge.layer.cornerRadius = pointWidth / 2;
    //确保可以有圆角
    self.badge.layer.masksToBounds = YES;
    [self addSubview:self.badge];
    [self bringSubviewToFront:self.badge];
}

- (void)hidenBadge
{
    //从父视图上面移除
    [self.badge removeFromSuperview];
}

#pragma mark - GetterAndSetter

- (UIView *)badge
{
    //通过runtime创建一个UILabel的属性
    return objc_getAssociatedObject(self, &badgeViewKey);
}

- (void)setBadge:(UIView *)view
{
    objc_setAssociatedObject(self, &badgeViewKey, view, OBJC_ASSOCIATION_RETAIN);
}

@end
