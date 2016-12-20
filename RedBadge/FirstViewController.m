//
//  FirstViewController.m
//  RedBadge
//
//  Created by aDu on 16/9/18.
//  Copyright © 2016年 DuKaiShun. All rights reserved.
//

#import "FirstViewController.h"
#import "UIView+DKSBadge.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *aView;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.label showBadgeWithCount:83];
    [self.button showBadge];
    [self.aView showBadge];
}

- (IBAction)click:(id)sender
{
    [self.label hidenBadge];
    [self.aView hidenBadge];
}

@end
