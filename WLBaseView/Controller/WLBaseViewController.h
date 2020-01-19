//
//  WLBaseViewController.h
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLBaseViewControllerProtocol.h"

typedef NS_ENUM(NSUInteger, StatusBarStyle) {
    StatusBarStyleBlack,
    StatusBarStyleWhite
};


@interface WLBaseViewController : UIViewController<WLBaseViewControllerProtocol>


/**
 *  状态栏样式
 */
@property (nonatomic, assign) StatusBarStyle statusBarStyle;


/**
 *  title颜色
 */
@property (nonatomic, strong) UIColor *titleColor;


/**
 *  富文本title，如果设置了则title，titlecolor失效
 */
@property (nonatomic, copy) NSDictionary<NSAttributedStringKey, id> *titleTextAttributes;

@end
