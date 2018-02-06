//
//  TriangleView.m
//  iOSApp
//

#import "TriangleView.h"

@implementation TriangleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UIColor *)fileColor {
    if (!_fileColor) {
        _fileColor = [UIColor whiteColor];
    }
    return _fileColor;
}

- (void)drawRect:(CGRect)rect {
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    switch (self.direction) {
        case TriangleViewDirectionTop:
            CGContextMoveToPoint(context, rect.size.width / 2.0f, 0.0f);//设置起点
            CGContextAddLineToPoint(context, 0.0f, rect.size.height);
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
            break;
        case TriangleViewDirectionBottom:
            CGContextMoveToPoint(context, 0.0f, 0.0f);//设置起点
            CGContextAddLineToPoint(context, rect.size.width, 0.0f);
            CGContextAddLineToPoint(context, rect.size.width / 2.0f, rect.size.height);
            break;
        case TriangleViewDirectionLeft:
            CGContextMoveToPoint(context, 0.0f, rect.size.height / 2.0f);//设置起点
            CGContextAddLineToPoint(context, rect.size.width, 0.0f);
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
            break;
        case TriangleViewDirectionRight:
            CGContextMoveToPoint(context, 0.0f, 0.0f);//设置起点
            CGContextAddLineToPoint(context, 0.0f, rect.size.height);
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height / 2.0f);
            break;
        default:
            break;
    }
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [[UIColor clearColor] setStroke];
    [self.fileColor setFill]; //设置填充色
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
}


@end
