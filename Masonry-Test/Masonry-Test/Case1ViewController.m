//
//  Case1ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case1ViewController.h"
#import <Masonry.h>
@interface Case1ViewController ()
@property (nonatomic, strong)UIView *containerView;

@property (nonatomic, strong)UILabel *label1;
@property (nonatomic, strong)UILabel *label2;
@end

@implementation Case1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = @"Case 1: 并排两个label，宽度由内容决定。父级View宽度不够时，优先显示右边label的内容，左边的会被压缩。";
    [self buildContent];
    
    [self buildStepper];

}

- (void)buildContent{
    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.equalTo(@50);
    }];
    
    self.label1 = [UILabel new];
    self.label1.backgroundColor = [UIColor yellowColor];
    self.label1.text = @"label,";
    [self.containerView addSubview:self.label1];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView).offset(5);
        make.left.equalTo(self.containerView).offset(2);
        make.height.equalTo(@40);
    }];
    
    self.label2 = [UILabel new];
    self.label2.backgroundColor = [UIColor greenColor];
    self.label2.text = @"label,";
    [self.containerView addSubview:self.label2];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView).offset(5);
        make.left.equalTo(self.label1.mas_right).offset(2);
        make.right.lessThanOrEqualTo(self.containerView).offset(-2);
        make.height.equalTo(@40);
    }];
    
    [self.label1 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.label1 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.label2 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.label2 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

}

- (void)buildStepper{
    UIStepper *stepper1 = [[UIStepper alloc]init];
    stepper1.tag = 1;
    [stepper1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper1];
    [stepper1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_bottom).offset(5);
        make.left.equalTo(self.containerView);
    }];
    
    UIStepper *stepper2 = [[UIStepper alloc]init];
    stepper2.tag = 2;
    [stepper2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:stepper2];
    [stepper2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_bottom).offset(5);
        make.right.equalTo(self.containerView);
    }];

}

- (void)click:(UIStepper *)stepper{
    NSMutableString *string = [NSMutableString new];
    for (int i=0;i<stepper.value+1;i++){
        [string appendString:@"label,"];
    }
    
    switch (stepper.tag) {
        case 1:
            self.label1.text = string;
            break;
        case 2:
            self.label2.text = string;
            break;

        default:
            break;
    }
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
