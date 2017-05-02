//
//  DMGood.m
//  WaterfallFlow
//
//  Created by SDC201 on 2017/5/2.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "DMGood.h"

@implementation DMGood

/**
 *  字典转模型
 */
+ (instancetype)goodWithDict:(NSDictionary *)dict {
    id good = [[self alloc] init];
    [good setValuesForKeysWithDictionary:dict];
    return good;
}

/**
 *  根据索引返回商品数组
 */
+ (NSArray *)goodsWithIndex:(NSInteger)index {
    
    NSString *fileName = [NSString stringWithFormat:@"%ld.plist", index % 3 + 1];
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSArray *goodsArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:goodsArray.count];
    
    [goodsArray enumerateObjectsUsingBlock: ^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        [tmpArray addObject:[self goodWithDict:dict]];
    }];
    return tmpArray.copy;
}

@end
