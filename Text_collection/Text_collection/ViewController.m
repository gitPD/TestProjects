//
//  ViewController.m
//  Text_collection
//
//  Created by rong on 15/11/21.
//  Copyright © 2015年 rong. All rights reserved.
//

#import "ViewController.h"


static NSString * const BKTipsItemCellIdentifier = @"BKTipsItemCellIdentifier";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *exhibitionCollection;
@property (nonatomic, strong) UICollectionViewFlowLayout *exhitionCollectionLaout;
@property (nonatomic, strong) UIPageControl              *imagepageControl;
@property (nonatomic, strong) UIView                     *backgroundView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.backgroundView];
    [self.backgroundView addSubview:self.exhibitionCollection];
    [self.backgroundView addSubview:self.imagepageControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio {
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cellIdentifier = [collectionView dequeueReusableCellWithReuseIdentifier:BKTipsItemCellIdentifier forIndexPath:indexPath];
    cellIdentifier.backgroundColor = [UIColor orangeColor];
    return cellIdentifier;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == self.exhibitionCollection) {
        
        int imagePage = scrollView.contentOffset.x/scrollView.frame.size.width;
        self.imagepageControl.currentPage = imagePage;
        
//        self.exhibitionCollection.alwaysBounceHorizontal = YES;
        NSInteger page = roundf((scrollView.contentOffset.x + 200) / scrollView.frame.size.width);
        
        page = MAX(page - 1, 0);
        page = MIN(page - 1, self.subjectList.count - 1);
        
//        self.timerCount = page;
//        if (scrollView.contentOffset.x <= 0) {
//            
//            [self.exhibitionCollection scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.subjectList.count inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//        }
//        else if (scrollView.contentOffset.x >= 200 * (self.subjectList.count + 1)) {
//            
//            [self.exhibitionCollection scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
//        }
    }
}


-(UICollectionView *)exhibitionCollection {
    if (!_exhibitionCollection) {
        _exhibitionCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 200, 230) collectionViewLayout:self.exhitionCollectionLaout];
        _exhibitionCollection.showsHorizontalScrollIndicator = NO;
        [_exhibitionCollection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:BKTipsItemCellIdentifier];
        _exhibitionCollection.dataSource = self;
        _exhibitionCollection.delegate = self;
        _exhibitionCollection.pagingEnabled = YES;
    }
    return _exhibitionCollection;
}

-(UICollectionViewFlowLayout *)exhitionCollectionLaout {
    if (!_exhitionCollectionLaout) {
        _exhitionCollectionLaout = [[UICollectionViewFlowLayout alloc]init];
        _exhitionCollectionLaout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _exhitionCollectionLaout.itemSize = CGSizeMake(200, 230);
        _exhitionCollectionLaout.minimumInteritemSpacing = 0.0;
        _exhitionCollectionLaout.minimumLineSpacing = 5.0;
        _exhitionCollectionLaout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
    }
    return _exhitionCollectionLaout;
}

-(NSArray *)subjectList {
    if (_subjectList) {
        _subjectList = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    }
    return _subjectList;
}

-(UIPageControl *)imagepageControl {
    if (!_imagepageControl) {
        _imagepageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(60, 120, 80, 20)];
        _imagepageControl.numberOfPages = 5;
        _imagepageControl.pageIndicatorTintColor = [UIColor redColor];
        _imagepageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        _imagepageControl.enabled = NO;
    }
    return _imagepageControl;
}

-(UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]initWithFrame:CGRectMake(120, 200, 200, 230)];
        
    }
    return _backgroundView;
}

@end
