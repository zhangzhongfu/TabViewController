//
//  ViewController.m
//  TabViewController
//
//  Created by zzf on 06/02/2018.
//  Copyright © 2018 zzf. All rights reserved.
//

#import "ViewController.h"
#import "TabViewController.h"

@interface ViewController () <TabViewControllerDelegate>

@property (nonatomic, strong) TabViewController *tabViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"TabViewController";

    [self addChildViewController:self.tabViewController];
    [self.view addSubview:self.tabViewController.view];
    [self configViewController];
}

- (void)configViewController {
    NSArray *titleArray = @[@"未使用",@"已使用",@"已过期"];
    NSMutableArray *vcArray = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = obj;
        vc.view.backgroundColor = RandomColor;
        [vcArray addObject:vc];
    }];

    self.tabViewController.viewControllers = vcArray;
}

- (TabViewController *)tabViewController {
    if (!_tabViewController) {
        _tabViewController = [[TabViewController alloc] init];
        _tabViewController.view.frame = CGRectMake(0.0f, kBdbsNavigationBarAndStatusBarHeight, self.view.frame.size.width, self.view.frame.size.height - kBdbsNavigationBarAndStatusBarHeight - BDBS_VIRTUAL_HOME_AREA_HEIGHT);
        _tabViewController.delegate = self;
    }
    return _tabViewController;
}



@end
