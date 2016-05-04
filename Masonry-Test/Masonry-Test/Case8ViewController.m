//
//  Case8ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case8ViewController.h"
#import "Case4DataModel.h"
#import <Masonry.h>
#import "Case8Cell.h"
@interface Case8ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSArray *modelArray;

@end

@implementation Case8ViewController

-(NSArray *)modelArray{
    if (!_modelArray){
        _modelArray = [Case4DataModel modelArray];
    }
    return _modelArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text  = @"展开收缩UITableViewCell";
    self.tableView = [UITableView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 150;
    [self.tableView registerClass:[Case8Cell class] forCellReuseIdentifier:NSStringFromClass([Case8Cell class])];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Case8Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case8Cell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexPath;
    __weak typeof(self)weakSelf = self;
    cell.expandBlock = ^(NSIndexPath *myIndexPath){
        Case4DataModel *model = weakSelf.modelArray[myIndexPath.row];
        model.isExpand = !model.isExpand;
        model.calHeight = 0;
        
//        [weakSelf.tableView beginUpdates];
//        [weakSelf.tableView endUpdates];
        //或
        [weakSelf.tableView reloadRowsAtIndexPaths:@[myIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    [cell setupDataWithModel:self.modelArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    static Case8Cell *templateCell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([Case8Cell class])];
    });
    Case4DataModel *model = self.modelArray[indexPath.row];
    if (model.calHeight <= 0){
        [templateCell setupDataWithModel:model];
        model.calHeight = [templateCell systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height+0.5;
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
