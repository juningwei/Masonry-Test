//
//  Case8Cell.h
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Case4DataModel;

typedef void(^ExpandBlock)(NSIndexPath *indexPath);
@interface Case8Cell : UITableViewCell
@property (nonatomic, strong)NSIndexPath *indexPath;
@property (nonatomic, copy)ExpandBlock expandBlock;
- (void)setupDataWithModel:(Case4DataModel *)model;
@end
