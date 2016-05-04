//
//  Case6ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case6ViewController.h"
#import "Case6ItemView.h"
#import <Masonry.h>
@interface Case6ViewController ()

@end

@implementation Case6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = @"自定义View的Baseline";
    
    
    
    Case6ItemView *itemView1 = [Case6ItemView itemWithImage:[UIImage imageNamed:@"dog_small"] text:@"Auto layout is a system"];
    [self.view addSubview:itemView1];
    
    [itemView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(150);
        make.left.equalTo(self.view).offset(5);
    }];
    
    Case6ItemView *itemView2 = [Case6ItemView itemWithImage:[UIImage imageNamed:@"dog_middle"] text:@"Auto Layout is a system that lets you lay out"];
    [self.view addSubview:itemView2];
    
    [itemView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(itemView1.mas_right).offset(5);
        make.baseline.equalTo(itemView1);
    }];

    Case6ItemView *itemView3 = [Case6ItemView itemWithImage:[UIImage imageNamed:@"dog_big"] text:@"Auto Layout is a system that lets you lay out your app’s user interface"];
    [self.view addSubview:itemView3];
    
    [itemView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(itemView2.mas_right).offset(5);
        make.baseline.equalTo(itemView2);
    }];

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
