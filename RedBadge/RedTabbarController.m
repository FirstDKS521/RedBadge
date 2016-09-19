//
//  RedTabbarController.m
//  RedBadge
//
//  Created by aDu on 16/9/18.
//  Copyright © 2016年 DuKaiShun. All rights reserved.
//

#import "RedTabbarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "UITabBar+DKSTabBar.h"

@interface RedTabbarController ()

@end

@implementation RedTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    firstVC.tabBarItem.image = [UIImage imageNamed:@"massage_bar"];
    firstVC.title = @"首页";
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    secondVC.tabBarItem.image = [UIImage imageNamed:@"massage_bar"];
    secondVC.title = @"消息";
    
    self.viewControllers = @[firstNav, secondNav];
    
    [self.tabBar showBadgeIndex:0];
    [self.tabBar showBadgeIndex:1];
}

@end
