//
//  Case4DataModel.h
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Case4DataModel : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString*intro;
@property (nonatomic, assign)BOOL isExpand;
@property (nonatomic, assign)float calHeight;

+ (instancetype)modelWithDic:(NSDictionary *)dic;
+ (NSArray *)modelArray;
@end
