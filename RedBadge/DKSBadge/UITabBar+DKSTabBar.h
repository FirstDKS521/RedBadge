//
//  UITabBar+DKSTabBar.h
//  RedBadge
//
//  Created by aDu on 16/9/18.
//  Copyright © 2016年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (DKSTabBar)

/**
 *  显示小红点
 *
 *  @param index 传入需要现实的位置
 */
- (void)showBadgeIndex:(NSInteger)index;

/**
 *  隐藏小红点
 *
 *  @param index 传入需要隐藏的位置
 */
- (void)hideBadgeIndex:(NSInteger)index;

@end
