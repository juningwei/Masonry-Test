//
//  Case4ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case4ViewController.h"
#import <Masonry.h>
#import "Case4DataModel.h"
#import "Case4Cell.h"
//取消此注释，即可用iOS8新特性计算高度
//#define IOS8_CALCULATE

@interface Case4ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSArray *modelArray;
@end

@implementation Case4ViewController

-(NSArray *)modelArray{
    if (!_modelArray){
        _modelArray = [Case4DataModel modelArray];
    }
    return _modelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = @"可变高度cell+简单高度缓存";
    self.tableView = [UITableView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 150;
    
    
#ifdef IOS8_CALCULATE
//iOS8新特性
    self.tableView.rowHeight = UITableViewAutomaticDimension;
#endif
    
    [self.tableView registerClass:[Case4Cell class] forCellReuseIdentifier:NSStringFromClass([Case4Cell class])];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Case4Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case4Cell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupDataWithModel:self.modelArray[indexPath.row]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

#ifdef IOS8_CALCULATE
//iOS8新特性
    return UITableViewAutomaticDimension;
#endif
    
    static Case4Cell *templateCell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case4Cell class])];
    });
    Case4DataModel *model = self.modelArray[indexPath.row];
    if (model.calHeight <= 0){
        [templateCell setupDataWithModel:model];
        model.calHeight = [templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+0.5;
        NSLog(@"model中高度为0，计算高度");
    }else{
        NSLog(@"从model中直接取高度");
    }
    return model.calHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
