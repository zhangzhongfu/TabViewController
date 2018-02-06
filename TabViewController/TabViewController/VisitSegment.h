//
//  VisitSegment.h
//  iOSApp
//


#import <UIKit/UIKit.h>

@interface VisitSegment : UIView

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UIColor *selectTitleColor;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, assign) CGFloat contentOffsetX;

@property (nonatomic, copy) void(^operation)(NSInteger index);

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@end

@interface VisitSegmentItem : UIButton

@end
