//
//  Case2ViewController.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case2ViewController.h"
#import <Masonry.h>
@interface Case2ViewController ()
@property (nonatomic, strong)UIView *containerView;
@property (nonatomic, strong)NSMutableArray *widConstraints;
@property (nonatomic, strong)UIView *switchView;
@end

@implementation Case2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = @"四个ImageView整体居中，可以任意显示、隐藏";
    
    [self buildContent];
    
    [self buildSwitchView];
}

- (void)buildContent{
    self.containerView = [UIView new];
    self.containerView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@32);
    }];
    
    NSMutableArray *imgViewArray = [NSMutableArray new];
    for (int i=0;i<4;i++){
        UIImageView *imgView = [UIImageView new];
        [imgView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d",i+1]]];
        [self.containerView addSubview:imgView];
        
        [imgViewArray addObject:imgView];
    }
    
    __block UIImageView *lastImgView = nil;
    __block MASConstraint *widthConstraint = nil;
    NSInteger imgViewConut = imgViewArray.count;
    
    self.widConstraints = [NSMutableArray new];
    [imgViewArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imgView = (UIImageView *)obj;
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            widthConstraint = make.width.equalTo(@32);
            make.height.equalTo(@32);
            make.top.equalTo(self.containerView);
            make.left.equalTo(lastImgView ? lastImgView.mas_right : self.containerView);
            
            if (idx == imgViewConut-1){
                make.right.equalTo(self.containerView);
            }
        }];
        [self.widConstraints addObject:widthConstraint];
        lastImgView = imgView;
    }];

}

- (void)buildSwitchView{
    self.switchView = [UIView new];
//    self.switchView.backgroundColor = [UIColor lightGrayColor];
    self.switchView.userInteractionEnabled = YES;
    [self.view addSubview:self.switchView];
    [self.switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_bottom).offset(5);
        make.centerX.equalTo(self.view);
        make.height.equalTo(@35);
    }];
    
    NSMutableArray *mySwitchArray  =[NSMutableArray new];
    for (int i=0;i<4;i++){
        UISwitch *mySwitch = [[UISwitch alloc]init];
        mySwitch.tag = i;
        [mySwitch addTarget:self action:@selector(switchClick:) forControlEvents:UIControlEventValueChanged];
        [self.switchView addSubview:mySwitch];
        
        [mySwitchArray addObject:mySwitch];
    }
    
    __block UISwitch *lastSwitch = nil;
    NSInteger mySwitchArrayCount = mySwitchArray.count;
    [mySwitchArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UISwitch *mySwitch = (UISwitch *)obj;
        [mySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.switchView);
            
            make.left.equalTo(lastSwitch ? lastSwitch.mas_right : self.switchView).offset(2);
            if (idx == mySwitchArrayCount-1){
                make.right.equalTo(self.switchView).offset(-2);
            }
        }];
        lastSwitch = mySwitch;
    }];
}

- (void)switchClick:(UISwitch *)mySwitch{
    NSInteger index = mySwitch.tag;
    MASConstraint *widthConstraint = self.widConstraints[index];
    if (mySwitch.on){
        widthConstraint.equalTo(@0);
    }else{
        widthConstraint.equalTo(@32);
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
