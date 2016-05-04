//
//  Case4Cell.m
//  Masonry-Test
//
//  Created by 鞠凝玮 on 16/1/18.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "Case4Cell.h"
#import <Masonry.h>
#import "Case4DataModel.h"
#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
@interface Case4Cell ()
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *introLabel;
@end

@implementation Case4Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.nameLabel = [UILabel new];
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.nameLabel];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(15);
        }];
        
        self.introLabel = [UILabel new];
        self.introLabel.textColor = [UIColor blackColor];
        self.introLabel.font = [UIFont systemFontOfSize:14];
        self.introLabel.numberOfLines = 0;
        self.introLabel.preferredMaxLayoutWidth = ScreenWidth-30;
        [self.contentView addSubview:self.introLabel];
        
        [self.introLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
    }
    return self;
}

- (void)setupDataWithModel:(Case4DataModel *)model{
    self.nameLabel.text = model.name;
    self.introLabel.text = model.intro;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
