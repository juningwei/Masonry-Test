//
//  Case6ItemView.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case6ItemView.h"
#import <Masonry.h>

@interface Case6ItemView ()
@property (nonatomic, strong)UIImage *img;
@property (nonatomic, copy)NSString *text;
@property (nonatomic, strong)UIImageView *topImageView;
@end

@implementation Case6ItemView

+ (Case6ItemView *)itemWithImage:(UIImage *)image text:(NSString *)text{
    Case6ItemView *itemView = [Case6ItemView new];
    itemView.backgroundColor = [UIColor lightGrayColor];
    itemView.img = image;
    itemView.text = text;
    [itemView buildView];
    return itemView;
}

- (void)buildView{
    self.topImageView = [UIImageView new];
    [self.topImageView setImage:self.img];
    [self addSubview:self.topImageView];
    
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(2);
        make.left.equalTo(self).offset(2);
        make.right.equalTo(self).offset(-2);
    }];
    
    [self.topImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.topImageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    
    UILabel *label = [UILabel new];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.numberOfLines = 0;
    label.text = self.text;
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom).offset(3);
        make.left.right.equalTo(self.topImageView);
        make.bottom.equalTo(self).offset(-3);
    }];

}

-(UIView *)viewForLastBaselineLayout{
    return self.topImageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
