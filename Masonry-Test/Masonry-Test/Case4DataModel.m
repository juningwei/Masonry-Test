//
//  Case4DataModel.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case4DataModel.h"

@implementation Case4DataModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"calHeight"]){
        self.calHeight = 0;
    }
    if ([key isEqualToString:@"isExpand"]){
        self.isExpand = NO;
    }
}

+ (instancetype)modelWithDic:(NSDictionary *)dic{
    id obj = [[self alloc]init];
    [obj setValuesForKeysWithDictionary:dic];
    return obj;
}

+ (NSArray *)modelArray{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error){
        NSLog(@"error!");
        return nil;
    }
    NSDictionary *resultDic = (NSDictionary *)result;
    NSArray *dataArray = resultDic[@"contents"];
    
    NSMutableArray *modelArray = [NSMutableArray new];
    for (NSDictionary *dic in dataArray){
        id model = [self modelWithDic:dic];
        [modelArray addObject:model];
    }
    return modelArray.copy;
}
@end
