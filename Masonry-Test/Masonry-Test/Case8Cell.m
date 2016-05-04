//
//  Case8Cell.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case8Cell.h"
#import <Masonry.h>
#import "Case4DataModel.h"

#define ScreenWidth [[UIScreen mainScreen]bounds].size.width

@interface Case8Cell ()
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *introLabel;
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)MASConstraint *heightConstraint;
@end

@implementation Case8Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.nameLabel = [UILabel new];
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font  =[UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.nameLabel];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@15);
        }];
        
        self.introLabel = [UILabel new];
        self.introLabel.textColor = [UIColor blackColor];
        self.introLabel.font = [UIFont systemFontOfSize:14];
        self.introLabel.numberOfLines = 0;
        self.introLabel.preferredMaxLayoutWidth = ScreenWidth-30;
        [self.contentView addSubview:self.introLabel];
        
        [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);

            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            _heightConstraint = make.height.equalTo(@45).priorityHigh();
        }];
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.button];
        
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.introLabel.mas_bottom).offset(5);
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
    }
    return self;
}

- (void)setupDataWithModel:(Case4DataModel *)model{
    self.nameLabel.text = model.name;
    self.introLabel.text = model.intro;
    
    if (!model.isExpand){
        [self.button setTitle:@"更多" forState:UIControlStateNormal];
        [_heightConstraint install];
    }else{
        [self.button setTitle:@"收起" forState:UIControlStateNormal];
        [_heightConstraint uninstall];
    }
}

- (void)click{
    self.expandBlock(self.indexPath);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
