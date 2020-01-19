//
//  WLBaseViewController.m
//  WLBaseView_Example
//
//  Created by 刘光强 on 2018/3/15.
//  Copyright © 2018年 guangqiang-liu. All rights reserved.
//

#import "WLBaseViewController.h"

@interface WLBaseViewController ()

@property (nonatomic, strong, readwrite) WLBaseViewModel *wlViewModel;
@end

@implementation WLBaseViewController

#pragma mark - Init Methods
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    WLBaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController renderViews];
        [viewController bindViewModel];
        [viewController loadData];
    }];
    return viewController;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithViewModel:(WLBaseViewModel *)viewModel {
    if (self = [super init]) {
        _wlViewModel = viewModel;
    }
    return self;
}

#pragma mark - LiftCycle Methods
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

#pragma mark 初始化基类配置
- (void)initialize {
    self.titleColor = kNavTitleColor;
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)renderViews {}

- (void)bindViewModel {}

- (void)loadData {}

- (void)setStatusBarStyle:(StatusBarStyle)statusBarStyle {
    _statusBarStyle = statusBarStyle;
    if (statusBarStyle == StatusBarStyleWhite) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    }
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:titleColor, NSFontAttributeName: [UIFont boldSystemFontOfSize:17]};
}

- (void)setTitleTextAttributes:(NSDictionary<NSAttributedStringKey, id> *)titleTextAttributes {
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"=============== dealloc %@ ===============", NSStringFromClass([self class]));
}
@end
