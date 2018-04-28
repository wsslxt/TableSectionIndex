//  CNSlideSelectionView.h
//  Created by sswang on 2018/4/26.
//  Copyright © 2018年 中华粮网. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CNSlideSelectionViewDelegate;
@interface CNSlideSelectionView : UIView
@property(nonatomic)NSArray<NSString *>  *indexArr;//索引字符数组
@property(nonatomic,assign)CGFloat   indexViewHeight;//索引子控件的高度
@property(nonatomic,assign)CGFloat   indexViewWidth;//索引子控件的宽度
@property(nonatomic,assign)id<CNSlideSelectionViewDelegate>delegate;
@end
@protocol CNSlideSelectionViewDelegate<NSObject>
//滑动切换不同的标题索引的代理方法
-(void)slideView:(CNSlideSelectionView *)sliderView index:(NSInteger)index title:(NSString *)title;
@end
