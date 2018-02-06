//
//  TriangleView.h
//  iOSApp
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TriangleViewDirection) {
    TriangleViewDirectionTop,
    TriangleViewDirectionBottom,
    TriangleViewDirectionRight,
    TriangleViewDirectionLeft
};

@interface TriangleView : UIView
@property (nonatomic,assign) TriangleViewDirection direction;
@property (nonatomic,strong) UIColor *fileColor;
@end
