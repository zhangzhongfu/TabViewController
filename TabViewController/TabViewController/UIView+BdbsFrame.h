//
//  UIView+BdbsFrame.h
//  iOSApp
//

#import <UIKit/UIKit.h>

@interface UIView (BdbsFrame)

@property (nonatomic, assign) CGPoint bdbs_origin;
@property (nonatomic, assign) CGSize bdbs_size;
@property (nonatomic, assign) CGFloat bdbs_x;
@property (nonatomic, assign) CGFloat bdbs_y;
@property (nonatomic, assign) CGFloat bdbs_width;
@property (nonatomic, assign) CGFloat bdbs_height;

@property (nonatomic, assign) CGFloat bdbs_centerX;
@property (nonatomic, assign) CGFloat bdbs_centerY;

@property (nonatomic, assign) CGFloat bdbs_maxX;
@property (nonatomic, assign) CGFloat bdbs_maxY;

@property (nonatomic, assign) CGFloat bdbs_left;
@property (nonatomic, assign) CGFloat bdbs_top;
@property (nonatomic, assign) CGFloat bdbs_right;
@property (nonatomic, assign) CGFloat bdbs_bottom;

@property (nonatomic, assign) CGFloat bdbs_halfWidth;
@property (nonatomic, assign) CGFloat bdbs_halfHeight;

/**< 水平填充父视图 */
- (void)bdbs_layoutFillSuperviewHorizontal;
/**< 水平填充父视图，左边距为leftMargin */
- (void)bdbs_layoutFillSuperviewHorizontalWithLeftMargin:(CGFloat)leftMargin;
/**< 水平填充父视图，右边距为rightMargin */
- (void)bdbs_layoutFillSuperviewHorizontalWithRightMargin:(CGFloat)rightMargin;
/**< 水平填充父视图，左边距为leftMargin，右边距为rightMargin */
- (void)bdbs_layoutFillSuperviewHorizontalWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;

/**< 竖直填充父视图 */
- (void)bdbs_layoutFillSuperviewVertical;
/**< 竖直填充父视图，顶部边距为topMargin */
- (void)bdbs_layoutFillSuperviewVerticalWithTopMargin:(CGFloat)topMargin;
/**< 竖直填充父视图，底部边距为bottomMargin */
- (void)bdbs_layoutFillSuperviewVerticalWithBottomMargin:(CGFloat)bottomMargin;
/**< 竖直填充父视图，顶部边距为topMargin，底部边距为bottomMargin */
- (void)bdbs_layoutFillSuperviewVerticalWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin;

/**< 设置布局 |(left)->(right)| */
- (void)bdbs_layoutLeft:(CGFloat)left right:(CGFloat)right;
/**< 设置布局 |(left)->(left + width)| */
- (void)bdbs_layoutLeft:(CGFloat)left width:(CGFloat)width;
/**< 设置布局 |(right - width)->(right)| */
- (void)bdbs_layoutRight:(CGFloat)right width:(CGFloat)width;
/**< 设置布局 |(top)->(bottom)| */
- (void)bdbs_layoutTop:(CGFloat)top bottom:(CGFloat)bottom;
/**< 设置布局 |(top)->(top + height)| */
- (void)bdbs_layoutTop:(CGFloat)top height:(CGFloat)height;
/**< 设置布局 |(bottom - height)->(bottom)| */
- (void)bdbs_layoutBottom:(CGFloat)bottom height:(CGFloat)height;

@end
