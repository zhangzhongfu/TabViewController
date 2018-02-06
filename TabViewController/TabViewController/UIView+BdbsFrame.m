//
//  UIView+BdbsFrame.m
//  iOSApp
//

#import "UIView+BdbsFrame.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


//机型适配
#define KViewwidth(a)  ((a) * WIDTH / 320)
#define KViewheight(a) ((a) * HEIGHT / 568)

#define KCGRectMake(a,b,c,d) CGRectMake(KViewwidth(a),KViewheight(b),KViewwidth(c),KViewheight(d))

@implementation UIView (BdbsFrame)

#pragma mark - Public Method

- (void)bdbs_layoutFillSuperviewHorizontal {
    [self bdbs_layoutFillSuperviewHorizontalWithLeftMargin:0.0f
                                               rightMargin:0.0f];
}

- (void)bdbs_layoutFillSuperviewHorizontalWithLeftMargin:(CGFloat)leftMargin {
    [self bdbs_layoutFillSuperviewHorizontalWithLeftMargin:leftMargin
                                               rightMargin:0.0f];
}

- (void)bdbs_layoutFillSuperviewHorizontalWithRightMargin:(CGFloat)rightMargin {
    [self bdbs_layoutFillSuperviewHorizontalWithLeftMargin:0.0f
                                               rightMargin:rightMargin];
}

- (void)bdbs_layoutFillSuperviewHorizontalWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    self.bdbs_left = leftMargin;
    self.bdbs_width = self.superview.bdbs_width - (leftMargin + rightMargin);
}

- (void)bdbs_layoutFillSuperviewVertical {
    [self bdbs_layoutFillSuperviewVerticalWithTopMargin:0.0f
                                           bottomMargin:0.0f];
}

- (void)bdbs_layoutFillSuperviewVerticalWithTopMargin:(CGFloat)topMargin {
    [self bdbs_layoutFillSuperviewVerticalWithTopMargin:topMargin
                                           bottomMargin:0.0f];
}

- (void)bdbs_layoutFillSuperviewVerticalWithBottomMargin:(CGFloat)bottomMargin {
    [self bdbs_layoutFillSuperviewVerticalWithTopMargin:0.0f
                                           bottomMargin:bottomMargin];
}

- (void)bdbs_layoutFillSuperviewVerticalWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin {
    self.bdbs_top = topMargin;
    self.bdbs_height = self.superview.bdbs_height - (topMargin + bottomMargin);
}

- (void)bdbs_layoutLeft:(CGFloat)left right:(CGFloat)right {
    self.bdbs_left = left;
    self.bdbs_width = right - left;
}

- (void)bdbs_layoutLeft:(CGFloat)left width:(CGFloat)width {
    self.bdbs_left = left;
    self.bdbs_width = width;
}

- (void)bdbs_layoutRight:(CGFloat)right width:(CGFloat)width {
    self.bdbs_left = right - width;
    self.bdbs_width = width;
}

- (void)bdbs_layoutTop:(CGFloat)top bottom:(CGFloat)bottom {
    self.bdbs_top = top;
    self.bdbs_height = bottom - top;
}

- (void)bdbs_layoutTop:(CGFloat)top height:(CGFloat)height {
    self.bdbs_top = top;
    self.bdbs_height = height;
}

- (void)bdbs_layoutBottom:(CGFloat)bottom height:(CGFloat)height {
    self.bdbs_top = bottom - height;
    self.bdbs_height = height;
}

#pragma mark - Setter Getter

- (void)setBdbs_origin:(CGPoint)bdbs_origin {
    CGRect frame = self.frame;
    frame.origin = bdbs_origin;
    self.frame = frame;
}

- (CGPoint)bdbs_origin {
    return self.frame.origin;
}

- (void)setBdbs_size:(CGSize)bdbs_size {
    CGRect frame = self.frame;
    frame.size = bdbs_size;
    self.frame = frame;
}

- (CGSize)bdbs_size {
    return self.frame.size;
}

- (void)setBdbs_x:(CGFloat)bdbs_x {
    CGRect frame = self.frame;
    frame.origin.x = bdbs_x;
    self.frame = frame;
}

- (CGFloat)bdbs_x {
    return CGRectGetMinX(self.frame);
}

- (void)setBdbs_y:(CGFloat)bdbs_y {
    CGRect frame = self.frame;
    frame.origin.y = bdbs_y;
    self.frame = frame;
}

- (CGFloat)bdbs_y {
    return CGRectGetMinY(self.frame);
}

- (void)setBdbs_width:(CGFloat)bdbs_width {
    CGRect frame = self.frame;
    frame.size.width = bdbs_width;
    self.frame = frame;
}

- (CGFloat)bdbs_width {
    return CGRectGetWidth(self.frame);
}

- (void)setBdbs_height:(CGFloat)bdbs_height {
    CGRect frame = self.frame;
    frame.size.height = bdbs_height;
    self.frame = frame;
}

- (CGFloat)bdbs_height {
    return CGRectGetHeight(self.frame);
}

- (void)setBdbs_centerX:(CGFloat)bdbs_centerX {
    CGPoint center = self.center;
    center.x = bdbs_centerX;
    self.center = center;
}

- (CGFloat)bdbs_centerX {
    return self.center.x;
}

- (void)setBdbs_centerY:(CGFloat)bdbs_centerY {
    CGPoint center = self.center;
    center.y = bdbs_centerY;
    self.center = center;
}

- (CGFloat)bdbs_centerY {
    return self.center.y;
}

- (void)setBdbs_maxX:(CGFloat)bdbs_maxX {
    self.bdbs_x = bdbs_maxX - self.bdbs_width;
}

- (CGFloat)bdbs_maxX {
    return CGRectGetMaxX(self.frame);
}

- (void)setBdbs_maxY:(CGFloat)bdbs_maxY {
    self.bdbs_y = bdbs_maxY - self.bdbs_height;
}

- (CGFloat)bdbs_maxY {
    return CGRectGetMaxY(self.frame);
}

- (void)setBdbs_left:(CGFloat)bdbs_left {
    self.bdbs_x = bdbs_left;
}

- (CGFloat)bdbs_left {
    return self.bdbs_x;
}

- (void)setBdbs_top:(CGFloat)bdbs_top {
    self.bdbs_y = bdbs_top;
}

- (CGFloat)bdbs_top {
    return self.bdbs_y;
}

- (void)setBdbs_right:(CGFloat)bdbs_right {
    self.bdbs_maxX = bdbs_right;
}

- (CGFloat)bdbs_right {
    return self.bdbs_maxX;
}

- (void)setBdbs_bottom:(CGFloat)bdbs_bottom {
    self.bdbs_maxY = bdbs_bottom;
}

- (CGFloat)bdbs_bottom {
    return self.bdbs_maxY;
}

- (void)setBdbs_halfWidth:(CGFloat)bdbs_halfWidth {
    self.bdbs_width = bdbs_halfWidth * 2.0f;
}

- (CGFloat)bdbs_halfWidth {
    return self.bdbs_width / 2.0f;
}

- (void)setBdbs_halfHeight:(CGFloat)bdbs_halfHeight {
    self.bdbs_height = bdbs_halfHeight * 2.0f;
}

- (CGFloat)bdbs_halfHeight {
    return self.bdbs_height / 2.0f;
}

@end
