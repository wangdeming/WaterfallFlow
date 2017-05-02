//
//  DMWaterfallFlowLayout.h
//  WaterfallFlow
//
//  Created by SDC201 on 2017/5/2.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMWaterfallFlowLayout : UICollectionViewFlowLayout

// 总列数
@property (nonatomic, assign) NSInteger columnCount;
// 商品数据数组
@property (nonatomic, strong) NSArray *goodsList;

@end
