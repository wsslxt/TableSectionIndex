//
//  ViewController.m
//  TableSectionIndex
//
//  Created by WangShaoShuai on 2018/4/28.
//  Copyright © 2018年 com.sswang.www. All rights reserved.
//

#import "ViewController.h"
#import "CNSlideSelectionView.h"
@interface ViewController ()<CNSlideSelectionViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CNSlideSelectionView  *sliderView = [[CNSlideSelectionView alloc]init];
    sliderView.delegate=self;
    sliderView.indexArr = @[@"A",@"B",@"C",@"D",
                            @"E",@"F",@"G",@"H",
                            @"I",@"J",@"K",@"L",
                            @"M",@"N",@"O",@"P",
                            @"Q",@"R",@"S",@"T",
                            @"U",@"V",@"W",@"X",
                            @"Y",@"Z"];
    [self.view addSubview:sliderView];
}
-(void)slideView:(CNSlideSelectionView *)sliderView index:(NSInteger)index title:(NSString *)title{
    NSLog(@"点击的字母是---%@\n区索引是---%ld",title,index);
}

@end
