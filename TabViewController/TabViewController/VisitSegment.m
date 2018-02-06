//
//  VisitSegment.m
//  iOSApp
//


#import "VisitSegment.h"
#import "TriangleView.h"
@interface VisitSegment ()

@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation VisitSegment

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.buttons = [NSMutableArray array];
        self.titles = titles;
    }
    return self;
}

#pragma mark - Setter
- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    if (titles.count) {
        [self buildUI];
    }
}

- (void)setContentOffsetX:(CGFloat)contentOffsetX {
    _contentOffsetX = contentOffsetX;
    
    CGFloat tabWidth = self.bdbs_width / (self.titles.count > 0 ? self.titles.count : 1);
    self.bottomLine.bdbs_centerX = contentOffsetX / self.bdbs_width * tabWidth + tabWidth / 2;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    if (self.buttons.count == 0) {
        return;
    }
    VisitSegmentItem *item = [self.buttons objectAtIndex:selectedIndex];
    for (VisitSegmentItem *btn in self.buttons) {
        btn.selected = NO;
    }
    item.selected = YES;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.bottomLine.bdbs_centerX = item.bdbs_centerX;
    }];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    
    self.bottomLine.backgroundColor = lineColor;
}

- (void)setSelectTitleColor:(UIColor *)selectTitleColor {
    _selectTitleColor = selectTitleColor;
    
    if (self.titles.count > 0) {
        for (VisitSegmentItem *item in self.buttons) {
            [item setTitleColor:selectTitleColor forState:UIControlStateSelected];
        }
    }
}

- (void)getMaxTitleLength {
    NSInteger maxWidth = 0;
    for (NSString *title in self.titles) {
        NSInteger width = [title sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f]}].width;
        maxWidth = MAX(width, maxWidth);
    }
    
    self.bottomLine.bdbs_width = maxWidth + 20.0f;
}

- (void)buildUI {
    [self.buttons removeAllObjects];
    CGFloat w = self.bdbs_width / self.titles.count;
    for (int i = 0; i < self.titles.count; i++) {
        VisitSegmentItem *item = [[VisitSegmentItem alloc] initWithFrame:CGRectMake(i * w, 0, w, self.bdbs_height)];
        [item setTitle:self.titles[i] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        item.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.buttons addObject:item];
        [self addSubview:item];
    }
    [self addSubview:self.bottomLine];
    
    [self getMaxTitleLength];
    [self setContentOffsetX:0.0f];
}

- (void)itemClick:(VisitSegmentItem *)sender {
    NSInteger index = [self.buttons indexOfObject:sender];
    if (index != NSNotFound) {
        if (self.operation) {
            self.operation(index);
        }
    }
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        CGFloat width = self.bdbs_width / self.titles.count / 2.0f;
        _bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0.0f, self.bdbs_height - 2.0f, width + 20.0f, 2.0f)];
        _bottomLine.backgroundColor = [UIColor blackColor];
    }
    return _bottomLine;
}

@end

@interface VisitSegmentItem ()

@property (nonatomic, strong) TriangleView *triangleView;

@end

@implementation VisitSegmentItem

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (TriangleView *)triangleView {
    if (!_triangleView) {
        _triangleView = [[TriangleView alloc] initWithFrame:CGRectMake(self.bdbs_width / 2.0f - 7.0f, self.bdbs_height - 6.0f, 14.0f, 6.0f)];
        _triangleView.fileColor = [UIColor colorWithRed:0xFF green:0x55 blue:0x41 alpha:1.0f];
        _triangleView.direction = TriangleViewDirectionTop;
    }
    return _triangleView;
}

@end
