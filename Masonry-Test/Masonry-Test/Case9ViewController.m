//
//  Case9ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case9ViewController.h"
#import <Masonry.h>

#define ScreenWidth [[UIScreen mainScreen]bounds].size.width

@interface Case9ViewController ()
@property (nonatomic, strong)UIView *containerView1;
@property (nonatomic, strong)UIView *containerView2;

@property (nonatomic, strong)MASConstraint *containerView1Width;
@property (nonatomic, strong)MASConstraint *containerView2Width;

@end

@implementation Case9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.titleLabel.text = @"等间距排列view";
    [self buildContainerView1];
    [self buildContainerView2];
    [self buildSlider];
    
    
}

- (void)buildContainerView1{
    self.containerView1 = [UIView new];
    self.containerView1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView1];
    
    [self.containerView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
//        make.right.equalTo(self.view).offset(-20);
        _containerView1Width = make.width.mas_equalTo(ScreenWidth-40);
        make.height.equalTo(@50);
    }];
    
    UIView *lastView = [UIView new];
    lastView.backgroundColor = [UIColor greenColor];
    [self.containerView1 addSubview:lastView];
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.equalTo(self.containerView1);
    }];
    
    for (int i=0;i<4;i++){
        UIImageView *imageView = [UIImageView new];
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d",i+1]]];
        [self.containerView1 addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastView.mas_right);
            make.size.mas_equalTo(CGSizeMake(32, 32));
            make.centerY.equalTo(self.containerView1);
        }];
        
        UIView *spaceView = [UIView new];
        spaceView.backgroundColor = [UIColor greenColor];
        [self.containerView1 addSubview:spaceView];
        
        [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).priorityHigh();
            make.top.bottom.equalTo(self.containerView1);
            make.width.equalTo(lastView);
        }];
        
        lastView = spaceView;
        
    }
    
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.containerView1);
    }];

}

- (void)buildContainerView2{
    self.containerView2 = [UIView new];
    self.containerView2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView2];
    
    [self.containerView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView1.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(20);
        _containerView2Width = make.width.mas_equalTo(ScreenWidth-40);
        make.height.equalTo(@50);
    }];
    
    for (int i=0;i<4;i++){
        UIImageView *imageView = [UIImageView new];
        [imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d",i+1]]];
        [self.containerView2 addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 32));
            make.centerY.equalTo(self.containerView2);
            make.centerX.equalTo(self.containerView2.mas_right).multipliedBy((CGFloat)(i+1)/5);
        }];
    }
}

- (void)buildSlider{
    UISlider *slider = [[UISlider alloc]init];
    [slider addTarget:self action:@selector(slide:) forControlEvents:UIControlEventValueChanged];
    slider.value = 1.0;
    [self.view addSubview:slider];
    
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.top.equalTo(self.containerView2.mas_bottom).offset(5);

    }];
    
}

- (void)slide:(UISlider *)slider{
    CGFloat width = (ScreenWidth-40) * slider.value;

    _containerView1Width.mas_equalTo(width);
    _containerView2Width.mas_equalTo(width);

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
