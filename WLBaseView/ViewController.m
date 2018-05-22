//
//  ViewController.m
//  WLBaseView
//
//  Created by 刘光强 on 2018/5/10.
//  Copyright © 2018年 quangqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"导航Title";
    self.view.backgroundColor = [UIColor redColor];
    
//    [self setNavigationItemLeftBarButtonItem:@selector(xx) withTitle:@"adad" withTitleColor:[UIColor redColor]];
//    [self setNavigationItemRightBarButtonItem:@selector(dda) withTitle:@"提交" withTitleColor:[UIColor purpleColor]];
    [self setNavigationItemRightBarButtonItem:@selector(opopd) withImage:@"icon_back"];
}

@end
