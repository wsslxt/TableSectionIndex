//
//  CNSlideSelectionView.m
//
//  Created by sswang on 2018/4/26.
//  Copyright © 2018年 中华粮网. All rights reserved.
//

#import "CNSlideSelectionView.h"
@interface CNSlideSelectionView()
@property(nonatomic)NSString   *indexStr;
@property(nonatomic)UILabel    *indexNotiLab;//提示lab
@end
@implementation CNSlideSelectionView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}
//添加按压手势
-(void)setUp{
    self.indexViewWidth = 20.0;
    self.indexViewHeight = 20.0;
    self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
    UIPanGestureRecognizer   *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
}
-(void)pan:(UILongPressGestureRecognizer *)ges{
    CGPoint   point = [ges locationInView:self];
    switch (ges.state) {
        case UIGestureRecognizerStateBegan:
            [self fileterIndexLab:point];
            break;
        case UIGestureRecognizerStateChanged:
            [self fileterIndexLab:point];
            break;
        case UIGestureRecognizerStateEnded:
            self.indexStr=nil;
            self.indexNotiLab.hidden=YES;
            break;
        default:
            break;
    }
  
}
-(void)fileterIndexLab:(CGPoint)point{
    for (UILabel *lab in self.subviews) {
        if (CGRectContainsPoint(lab.frame, point)) {
            if (self.indexStr==nil || ![self.indexStr isEqualToString:lab.text]) {
                self.indexStr = lab.text;
                self.indexNotiLab.hidden=NO;
                self.indexNotiLab.text = self.indexStr;
                if (self.delegate && [self.delegate respondsToSelector:@selector(slideView:index:title:)]) {
                    NSInteger  index = [self.subviews indexOfObject:lab];
                    [self.delegate slideView:self index:index title:lab.text];
                }
            }
        }
    }
}
-(void)setIndexArr:(NSArray *)indexArr{
    _indexArr = indexArr;
    [self addIndexLabs];
}
//添加索引的子控件
-(void)addIndexLabs{
    for (NSString *str in _indexArr) {
        UILabel  *lab = [[UILabel alloc]init];
        lab.text = str;
//        lab.userInteractionEnabled = YES;
        lab.font = [UIFont systemFontOfSize:14];
        lab.textAlignment  = NSTextAlignmentCenter;
        [self addSubview:lab];
    }
}
//添加提示的lab
-(UILabel *)indexNotiLab{
    if (!_indexNotiLab) {
        _indexNotiLab = [[UILabel alloc]init];
        _indexNotiLab.textColor = [UIColor blackColor];
        _indexNotiLab.textAlignment = NSTextAlignmentCenter;
        _indexNotiLab.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:48];
        _indexNotiLab.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
        _indexNotiLab.hidden = YES;
        _indexNotiLab.layer.cornerRadius=5;
        _indexNotiLab.layer.masksToBounds=YES;
    }
    return _indexNotiLab;
}
//布局
-(void)layoutSubviews{
    self.bounds = CGRectMake(0, 0, self.indexViewWidth, _indexArr.count*self.indexViewHeight);
    self.center = CGPointMake(self.superview.bounds.size.width-self.indexViewWidth/2.0, self.superview.bounds.size.height/2.0);
    for (int i = 0; i<self.subviews.count; i++) {
        UILabel *lab = self.subviews[i];
        lab.frame = CGRectMake(0, i*self.indexViewHeight,self.indexViewWidth, self.indexViewHeight);
    }
    self.indexNotiLab.bounds = CGRectMake(0, 0, 80, 80);
    self.indexNotiLab.center = self.superview.center;
}

-(void)didMoveToSuperview{
    [self.superview addSubview:self.indexNotiLab];
}

@end
