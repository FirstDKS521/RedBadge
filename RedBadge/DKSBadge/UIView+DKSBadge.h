//
//  UIView+DKSBadge.h
//  TestProject
//
//  Created by aDu on 16/9/15.
//  Copyright © 2016年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DKSBadge)

/**
 *  通过创建label，显示小红点；
 */
@property (nonatomic, strong) UILabel *badge;

/**
 *  显示小红点
 */
- (void)showBadge;

/**
 * 显示几个小红点儿
 * parameter redCount 小红点儿个数
 */
- (void)showBadgeWithCount:(NSInteger)redCount;

/**
 *  隐藏小红点
 */
- (void)hidenBadge;

@end
