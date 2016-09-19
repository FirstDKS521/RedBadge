//
//  SecondViewController.m
//  RedBadge
//
//  Created by aDu on 16/9/18.
//  Copyright © 2016年 DuKaiShun. All rights reserved.
//

#import "SecondViewController.h"
#import "RedTabbarController.h"
#import "UITabBar+DKSTabBar.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    RedTabbarController *redVC = (RedTabbarController *)self.view.window.rootViewController;
    [redVC.tabBar hideBadgeIndex:0];
}

@end
