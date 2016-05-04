//
//  Case5ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case5ViewController.h"
#import <Masonry.h>

#define MASONRY_NEWFUTURE

@interface Case5ViewController ()
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIView *bottomView;

@end

@implementation Case5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildContent];
    [self buildTopAndBottomView];
}

- (void)buildContent{
    UILabel *introLabel = [UILabel new];
    introLabel.textColor = [UIColor blackColor];
    introLabel.font = [UIFont systemFontOfSize:14];
    introLabel.numberOfLines = 0;
    introLabel.text = @"使用top(bottom)LayoutGuide确定当前ViewController的最佳显示范围。\n\n方法1: 直接使用length属性，避免强制转换成UIView所带来的风险。\n方法2: 使用新的mas_topLayoutGuide和mas_bottomLayoutGuide";
    introLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:introLabel];
    
    [introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"show or hide navigationBar" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(showOrHideNavigationBar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(introLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"show or hide toolBar" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(showOrHideToolBar) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button1.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button2.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
}


- (void)buildTopAndBottomView{
    self.topView = [UIView new];
    self.topView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.topView];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
#ifdef MASONRY_NEWFUTURE
        make.top.equalTo(self.mas_topLayoutGuideBottom);
#endif
        
        make.left.right.equalTo(self.view);
        make.height.equalTo(@45);
    }];
    
    self.bottomView = [UIView new];
    self.bottomView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
#ifdef MASONRY_NEWFUTURE
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
#endif
        
        make.left.right.equalTo(self.view);
        make.height.equalTo(@45);
    }];

}


-(void)updateViewConstraints{

#ifndef MASONRY_NEWFUTURE
    NSLog(@"[viewDidLoad] top: %g", self.topLayoutGuide.length);

    [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(self.topLayoutGuide.length);
    }];
    
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-self.bottomLayoutGuide.length);
    }];
    
#endif

    [super updateViewConstraints];
}

- (void)showOrHideNavigationBar{
    self.navigationController.navigationBarHidden  = !self.navigationController.navigationBarHidden;
    [self updateViewConstraints];
}

- (void)showOrHideToolBar{
    self.navigationController.toolbarHidden = !self.navigationController.toolbarHidden;
    [self updateViewConstraints];
    
}

- (void)back{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
