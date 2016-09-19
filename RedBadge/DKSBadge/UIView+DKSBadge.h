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
 *  通过创建label，创建小红点；
 *  我是想以后如果小红点里面需要显示个数的时候，好扩展；
 */
@property (nonatomic, strong) UILabel *badge;

/**
 *  显示小红点
 */
- (void)showBadge;

/**
 *  隐藏小红点
 */
- (void)hidenBadge;

@end
