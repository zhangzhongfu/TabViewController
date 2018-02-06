//
//  TabViewController.h
//  WoZaiJia
//

#import <UIKit/UIKit.h>

@class TabViewController;

@protocol TabViewControllerDelegate <NSObject>

@optional
- (void)tabViewController:(TabViewController *)tabVC endScollIndex:(NSInteger)index;

@end

@interface TabViewController : UIViewController

/**
 class string
 */
@property (nonatomic, strong) NSArray<UIViewController *> *viewControllers;

@property (nonatomic, weak) id<TabViewControllerDelegate> delegate;

@end
