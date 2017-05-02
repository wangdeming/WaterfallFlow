//
//  DMGood.h
//  WaterfallFlow
//
//  Created by SDC201 on 2017/5/2.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMGood : NSObject

@property (nonatomic, assign) NSInteger h; // 商品图片高
@property (nonatomic, assign) NSInteger w; // 商品图片宽
@property (nonatomic, copy) NSString *img; // 商品图片地址
@property (nonatomic, copy) NSString *price; // 商品价格

+ (instancetype)goodWithDict:(NSDictionary *)dict; // 字典转模型
+ (NSArray *)goodsWithIndex:(NSInteger)index; // 根据索引返回商品数组

@end
