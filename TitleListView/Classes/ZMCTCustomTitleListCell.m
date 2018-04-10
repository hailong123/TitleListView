//
//  ZMCTCustomTitleListCell.m
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "ZMCTCustomTitleListCell.h"

#import "ZMCTCustomTitleListModel.h"

@interface ZMCTCustomTitleListCell ()

//文本
@property (nonatomic, strong) UILabel *subTitleLabel;

//选择按钮
@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation ZMCTCustomTitleListCell

#pragma mark - Delloc

#pragma mark - Life Cycle

#pragma mark - Private Method

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self defaultConfig];
    }
    return self;
}

- (void)defaultConfig {

    [self.contentView addSubview:self.selectButton];
    
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.left.equalTo(self.contentView).offset(20);
    }];
    
    [self.contentView addSubview:self.subTitleLabel];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(self.selectButton);
        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.selectButton.mas_right).offset(15);
    }];
    
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Getter And Setter
- (UILabel *)subTitleLabel {
 
    if (!_subTitleLabel) {
        
        _subTitleLabel           = [[UILabel alloc] init];
        _subTitleLabel.font      = [UIFont systemFontOfSize:14];
        _subTitleLabel.textColor = [UIColor blackColor];
    }
    
    return _subTitleLabel;
}


- (UIButton *)selectButton {

    if (!_selectButton) {
        
        _selectButton = [UIButton buttonWithType:UIButtonTypeCustom];

    }
    
    return _selectButton;
}

- (void)setTitleListModel:(ZMCTCustomTitleListModel *)titleListModel {

    _titleListModel         = titleListModel;
    self.subTitleLabel.text = titleListModel.title;
    
    [self.selectButton setImage:[UIImage zmc_imageNamed:titleListModel.normalImgName]
                       forState:UIControlStateNormal];
    [self.selectButton setImage:[UIImage zmc_imageNamed:titleListModel.selectImgName]
                       forState:UIControlStateSelected];
    
    //状态
    self.selectButton.selected = titleListModel.isSelected;
    
}

@end
