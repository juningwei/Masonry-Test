//
//  Case3ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case3ViewController.h"
#import <Masonry.h>

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface Case3ViewController ()
@property (nonatomic, strong)UIView *parentView;
@property (nonatomic, strong)UIView *childView;

@property (nonatomic, strong)MASConstraint *widthConstraint;
@end

@implementation Case3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = @"子View的宽度始终是父View宽度的一半";
    [self buildContent];
}

- (void)buildContent{
    self.parentView = [UIView new];
    self.parentView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.parentView];
    
    [self.parentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(50);
        make.left.equalTo(self.view).offset(15);
        make.height.equalTo(@60);
        _widthConstraint = make.width.mas_equalTo(ScreenWidth-30);
    }];
    
    self.childView = [UIView new];
    self.childView.backgroundColor = [UIColor redColor];
    [self.parentView addSubview:self.childView];
    
    [self.childView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.parentView);
        make.width.equalTo(self.parentView).multipliedBy(0.5);
    }];
    
    UISlider *slider = [[UISlider alloc]init];
    [slider addTarget:self action:@selector(slide:) forControlEvents:UIControlEventValueChanged];
    slider.value = 1.0;
    [self.view addSubview:slider];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.parentView.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
    }];
}

- (void)slide:(UISlider *)slider{
    CGFloat width = (ScreenWidth-30) * slider.value;
    _widthConstraint.mas_equalTo(width);
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
