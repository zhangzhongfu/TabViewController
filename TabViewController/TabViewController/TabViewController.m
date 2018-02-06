//
//  TabViewController.m
//  WoZaiJia
//

#import "TabViewController.h"
#import "VisitSegment.h"

@interface TabViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) VisitSegment *sliderChoiceView;
@property (nonatomic, strong) UIScrollView *mainScrollView;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) NSMutableArray *controllerArray;

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.sliderChoiceView];
    [self.view addSubview:self.mainScrollView];
}

- (void)setViewControllers:(NSArray<UIViewController *> *)viewControllers {
    _viewControllers = viewControllers;

    if (!viewControllers.count) {
        // remove the subview
        for (UIView *view in self.mainScrollView.subviews) {
            [view removeFromSuperview];
        }
        [self.controllerArray removeAllObjects];
        return;
    }

    NSMutableArray *titleArray = [NSMutableArray array];
    [viewControllers enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger i, BOOL * _Nonnull stop) {
        if (i == self.currentIndex) {
            vc.view.bdbs_x = self.view.bdbs_width * self.currentIndex;
            [_mainScrollView addSubview:vc.view];
            [vc willMoveToParentViewController:self];
            [self addChildViewController:vc];
            [vc didMoveToParentViewController:self];
            [self.controllerArray addObject:vc];
        }
        else {
            [self.controllerArray addObject:[NSNull null]];
        }
        [titleArray addObject:vc.title];
    }];

    self.sliderChoiceView.titles = titleArray;
    self.mainScrollView.contentSize = CGSizeMake(self.view.bdbs_width * viewControllers.count, 0.0f);
}

- (void)setContentOffset:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(tabViewController:endScollIndex:)]) {
        [self.delegate tabViewController:self endScollIndex:index];
    }
    
    [self.mainScrollView setContentOffset:CGPointMake(index * self.view.bdbs_width, 0) animated:NO];
    if ([self.controllerArray[index] isKindOfClass:[NSNull class]]) {
        UIViewController *baseVc = self.viewControllers[index];
        baseVc.view.bdbs_x = ScreenWidth * index;
        [self.mainScrollView addSubview:baseVc.view];
        [baseVc willMoveToParentViewController:self];
        [self addChildViewController:baseVc];
        [baseVc didMoveToParentViewController:self];
        [self.controllerArray replaceObjectAtIndex:index withObject:baseVc];
    }
}

- (void)endScorll {
    NSInteger index = (self.mainScrollView.contentOffset.x + ScreenWidth / 2) / ScreenWidth;
    self.sliderChoiceView.selectedIndex = index;
    if ([self.controllerArray[index] isKindOfClass:[NSNull class]]) {
        UIViewController *baseVc = self.viewControllers[index];
        baseVc.view.bdbs_x = ScreenWidth * index;
        [self.mainScrollView addSubview:baseVc.view];
        [baseVc willMoveToParentViewController:self];
        [self addChildViewController:baseVc];
        [baseVc didMoveToParentViewController:self];
        [self.controllerArray replaceObjectAtIndex:index withObject:baseVc];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.sliderChoiceView.contentOffsetX = scrollView.contentOffset.x;
}

#pragma mark - 代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self endScorll];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self endScorll];
}

#pragma mark - Lazy load
- (VisitSegment *)sliderChoiceView {
    if (!_sliderChoiceView) {
        CGRect frame = CGRectMake(0.0f, 0.0f, self.view.bdbs_width, 44.0f);
        _sliderChoiceView = [[VisitSegment alloc] initWithFrame:frame titles:nil];
        _sliderChoiceView.selectedIndex = 0;
        ZZWeakifySelf;
        _sliderChoiceView.operation = ^ (NSInteger index){
            ZZStrongifySelf;
            [self setContentOffset:index];
        };
    }
    return _sliderChoiceView;
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        CGRect frame = CGRectMake(0.0f, self.sliderChoiceView.bdbs_bottom, ScreenWidth, self.view.bdbs_height - self.sliderChoiceView.bdbs_bottom);
        _mainScrollView = [[UIScrollView alloc] initWithFrame:frame];
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.delegate = self;
        _mainScrollView.showsHorizontalScrollIndicator = NO;
    }
    return _mainScrollView;
}

- (NSMutableArray *)controllerArray {
    if (!_controllerArray) {
        _controllerArray = [NSMutableArray array];
    }
    return _controllerArray;
}

@end
