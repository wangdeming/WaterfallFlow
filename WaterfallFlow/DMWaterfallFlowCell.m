//
//  DMWaterfallFlowCell.m
//  WaterfallFlow
//
//  Created by SDC201 on 2017/5/2.
//  Copyright © 2017年 PCEBG. All rights reserved.
//

#import "DMWaterfallFlowCell.h"
#import "DMGood.h"
#import "UIImageView+WebCache.h"

@interface DMWaterfallFlowCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation DMWaterfallFlowCell

- (void)setGood:(DMGood *)good
{
    _good = good;
    NSURL *url = [NSURL URLWithString:good.img];
    [self.iconView sd_setImageWithURL:url];
    self.priceLabel.text = good.price;
}

@end
