//
//  ViewController.m
//  WaterfallFlow
//
//  Created by SDC201 on 2017/5/2.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "ViewController.h"
#import "DMGood.h"
#import "DMWaterfallFlowCell.h"
#import "DMWaterfallFlowLayout.h"
#import "DMWaterfallFlowFooterView.h"

@interface ViewController ()

// 商品列表数组
@property (nonatomic, strong) NSMutableArray *goodsList;
// 当前的数据索引
@property (nonatomic, assign) NSInteger index;
// 瀑布流布局
@property (weak, nonatomic) IBOutlet DMWaterfallFlowLayout *waterfallFlowLayout;
// 底部视图
@property (nonatomic, weak) DMWaterfallFlowFooterView *footerView;
// 是否正在加载数据标记
@property (nonatomic, assign, getter=isLoading) BOOL loading;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

/**
 *  加载数据
 */
- (void)loadData {
    NSArray *goods = [DMGood goodsWithIndex:self.index];
    [self.goodsList addObjectsFromArray:goods];
    self.index++;
    // 设置布局的属性
    self.waterfallFlowLayout.columnCount = 3;
    self.waterfallFlowLayout.goodsList = self.goodsList;
    // 刷新数据
    [self.collectionView reloadData];
}

#pragma mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.goodsList.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 创建可重用的cell
    DMWaterfallFlowCell *cell = [collectionView
                                 dequeueReusableCellWithReuseIdentifier:@"CellCache"
                                 forIndexPath:indexPath];
    
    cell.good = self.goodsList[indexPath.item];
    return cell;
}

#pragma mark - FooterView
/**
 *  追加视图
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionFooter) {
        self.footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterViewCache" forIndexPath:indexPath];
        return self.footerView;
    }
    return nil;
}

#pragma mark - scrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.footerView == nil || self.isLoading) {
        return;
    }
    
    if (self.footerView.frame.origin.y < (scrollView.contentOffset.y + scrollView.bounds.size.height)) {
        NSLog(@"开始刷新");
        // 如果正在刷新数据，不需要再次刷新
        self.loading = YES;
        [self.footerView.indicatorView startAnimating];
        // 模拟数据刷新
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.footerView = nil;
            [self loadData];
            self.loading = NO;
        });
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)goodsList {
    if (_goodsList == nil) {
        _goodsList = [NSMutableArray array];
    }
    return _goodsList;
}

@end
