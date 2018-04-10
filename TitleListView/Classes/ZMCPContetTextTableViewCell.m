//
//  ZMCPContetTextTableViewCell.m
//  ZMParentsProject
//
//  Created by Sea on 2017/9/9.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "ZMCPContetTextTableViewCell.h"

@interface ZMCPContetTextTableViewCell ()

@property (nonatomic, strong) UILabel *textContantLabel;

@end

@implementation ZMCPContetTextTableViewCell

#pragma mark - Private Method
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createContentTextCellUI];
    }
    
    return self;
}

- (void)createContentTextCellUI {

    [self.contentView addSubview:self.textContantLabel];
    
    [self.textContantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@20).priorityLow();
        make.height.equalTo(@20).priorityLow();
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
    }];
}

#pragma mark - Public Method

#pragma mark - Delegate

#pragma mark - Getter And Setter
- (UILabel *)textContantLabel {

    if (!_textContantLabel) {
        _textContantLabel      = [[UILabel alloc] init];
        _textContantLabel.font = [UIFont systemFontOfSize:16];
        _textContantLabel.textColor     = DEFAULT_3333_COLOR;
        _textContantLabel.textAlignment = NSTextAlignmentCenter;
        _textContantLabel.numberOfLines = 1;
    }
    
    return _textContantLabel;
}

- (void)setTextTitle:(NSString *)textTitle {

    _textTitle = textTitle;
    
    self.textContantLabel.text = textTitle;
}

#pragma mark - Delloc


@end
