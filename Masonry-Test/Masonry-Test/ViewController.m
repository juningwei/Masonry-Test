//
//  ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "ViewController.h"
#import "Case1ViewController.h"
#import "Case2ViewController.h"
#import "Case3ViewController.h"
#import "Case4ViewController.h"
#import "Case5ViewController.h"
#import "Case6ViewController.h"
#import "Case7ViewController.h"
#import "Case8ViewController.h"
#import "Case9ViewController.h"

#import <Masonry.h>

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSArray *titleArray;
@property (nonatomic, copy)NSArray *subTitleArray;
@property (nonatomic, copy)NSArray *classArray;
@end

@implementation ViewController

-(NSArray *)titleArray{
    if (!_titleArray){
        _titleArray = @[@"Case1",@"Case2",@"Case3",@"Case4",@"Case5",@"Case6",@"Case7",@"Case8",@"Case9"];
    }
    return _titleArray;
}

-(NSArray *)subTitleArray{
    if (!_subTitleArray){
        _subTitleArray = @[@"并排Label",@"动态居中",@"百分比宽度",@"变高UITableViewCell",@"top(bottom)GuideView",@"自定义baseline",@"Parallax Header",@"动态展开UITableViewCell",@"变种方式实现等间距"];
    }
    return _subTitleArray;
}

-(NSArray *)classArray{
    if (!_classArray){
        _classArray = @[[Case1ViewController class],[Case2ViewController class],[Case3ViewController class],[Case4ViewController class],[Case5ViewController class],[Case6ViewController class],[Case7ViewController class],[Case8ViewController class],[Case9ViewController class]];
    }
    return _classArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [UITableView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 44;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    cell.detailTextLabel.text = self.subTitleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Class vcClass = self.classArray[indexPath.row];
    UIViewController *vc = [[vcClass alloc]init];
    if (indexPath.row == 4){
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }else{
        [self.navigationController pushViewController:vc animated:YES];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
