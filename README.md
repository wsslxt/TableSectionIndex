# CNSlideSelectionView Instructions
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
