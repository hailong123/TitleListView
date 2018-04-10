//
//  ZMTCustomTitleListView.m
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "ZMCTCustomTitleListView.h"

#import "ZMCTCustomTitleListModel.h"

#import "ZMCTCustomTitleListCell.h"
#import "ZMCPContetTextTableViewCell.h"

static NSString * const kCustomTitleListCellID     = @"kCustomTitleListCellID";
static NSString * const kContetTextTableViewCellID = @"kContetTextTableViewCellID";

static NSInteger ZMTTableViewRowHeight                  = 86;
static NSInteger ZMTTableViewHeardAndFooterViewHeight   = 44;

static NSString * const ZMTCancelButtonTitle   = @"取消";
static NSString * const ZMTMakeSureButtonTitle = @"确定";

@interface ZMCTCustomTitleListView ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
{
    struct {
    
        int ZMTCustomTitleListViewDelegate : 1;
        
    }_hasDes;
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *tableHeardView;//头部视图
@property (nonatomic, strong) UIView *tableFooterView;//尾部视图

@property (nonatomic, assign) CustomType customType;//显示类型
@property (nonatomic, assign) CustomTitleChangeType selectTye;//选择的下标

@property (nonatomic, copy) NSString *sectionTitle;
@property (nonatomic, copy) NSString *contantTitle;

@end

IB_DESIGNABLE

@implementation ZMCTCustomTitleListView

#pragma mark - Delloc

#pragma mark - Life Cycle

#pragma mark - Private Method
- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
    
        [self defaultConfig];
        
    }
    
    return self;
}

- (void)defaultConfig {

    self.frame           = [UIScreen mainScreen].bounds;
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

    [self addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.equalTo(@130);
        make.width.mas_equalTo(self.frame.size.width - (40 * 2));
    }];
}

- (void)clickFooterViewButton:(UIButton *)button {

    switch (button.tag) {
        case 100:
        {
            [self customTitleListViewHidden];
        }
            break;
            
        case 200:
        {
            if (_hasDes.ZMTCustomTitleListViewDelegate) {
                [self.titleListViewDelegate customTitleListView:self chooseIndex:self.selectTye];
            }
            
            [self customTitleListViewHidden];
        }
            break;
    }
    
}

//更新状态
- (void)changeSelectStatusWithSelectListModel:(ZMCTCustomTitleListModel *)selectListModel {

    for (ZMCTCustomTitleListModel *listModel in self.titleArray) {
        listModel.selected = NO;
    }
    
    selectListModel.selected = YES;
    
    [self.tableView reloadData];
}

#pragma mark - Public Method

- (void)showSectionTittle:(NSString *)sectionTitle
             contantTitle:(NSString *)contantTitle
               customType:(CustomType)customType
                     view:(nonnull UIView *)view {

    self.sectionTitle = sectionTitle;
    self.contantTitle = contantTitle;
    self.customType   = customType;
    
    [self showInView:view];
}

- (void)showInView:(UIView *)view {
    
    for (UIView *subView in view.subviews) {
        if ([subView isKindOfClass:[self class]]) {
            return;
        }
    }

    [view addSubview:self];
}

//隐藏
- (void)customTitleListViewHidden {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

- (CGFloat)fetchHeardViewHeight {
    return _sectionTitle.length > 0?ZMTTableViewHeardAndFooterViewHeight:CGFLOAT_MIN;
}

- (UIView *)fetchHeardView {
    return _sectionTitle.length > 0 ? self.tableHeardView:nil;
}

#pragma mark - Delegate
//UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.customType == CustomType_List) {
        return self.titleArray.count;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    switch (self.customType) {
        case CustomType_List:
        {
            ZMCTCustomTitleListCell *titleListCell = [tableView dequeueReusableCellWithIdentifier:kCustomTitleListCellID];
            
            titleListCell.titleListModel = self.titleArray[indexPath.row];
            
            return titleListCell;
        }
            break;
            
        case CustomType_Title:
        {
            ZMCPContetTextTableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:kContetTextTableViewCellID];
            
            contentCell.textTitle = self.contantTitle;
            
            return contentCell;
        }
            break;
    }
    
    return nil;
}

//UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //改变下标
    self.selectTye = indexPath.row;
    
    [self changeSelectStatusWithSelectListModel:self.titleArray[indexPath.row]];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self fetchHeardViewHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return ZMTTableViewHeardAndFooterViewHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self fetchHeardView];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.tableFooterView;
}

#pragma mark - Getter And Setter

- (UITableView *)tableView {
    
    if (!_tableView) {
    
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        
        _tableView.delegate        = self;
        _tableView.bounces         = NO;
        _tableView.rowHeight       = ZMTTableViewRowHeight;
        _tableView.dataSource      = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        
        _tableView.layer.cornerRadius  = 8;
        _tableView.layer.masksToBounds = YES;
        
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[ZMCTCustomTitleListCell class]
           forCellReuseIdentifier:kCustomTitleListCellID];
        [_tableView registerClass:[ZMCPContetTextTableViewCell class]
           forCellReuseIdentifier:kContetTextTableViewCellID];
    }
    
    return _tableView;
}

//头尾视图
- (UIView *)tableFooterView {

    if (!_tableFooterView) {
        
        _tableFooterView                 = [[UIView alloc] init];
        _tableFooterView.backgroundColor = [UIColor whiteColor];
        
        UIView *topLineView         = [[UIView alloc] init];
        topLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [_tableFooterView addSubview:topLineView];
        
        [topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.top.equalTo(_tableFooterView);
            make.left.equalTo(_tableFooterView);
            make.width.equalTo(_tableFooterView);
        }];
        
        UIView *middleLineView         = [[UIView alloc] init];
        middleLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [_tableFooterView addSubview:middleLineView];
        
        [middleLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@1);
            make.top.equalTo(_tableFooterView);
            make.height.equalTo(_tableFooterView);
            make.centerX.equalTo(_tableFooterView);
        }];
        
        UIButton *cancelButton       = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.tag             = 100;
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        [cancelButton setTitle:ZMTCancelButtonTitle forState:UIControlStateNormal];
        [cancelButton setTitleColor:DEFAULT_6666_COLOR forState:UIControlStateNormal];
        [cancelButton setTitleColor:DEFAULT_6666_COLOR forState:UIControlStateHighlighted];
        
        [cancelButton addTarget:self
                         action:@selector(clickFooterViewButton:)
               forControlEvents:UIControlEventTouchUpInside];
        
        [_tableFooterView addSubview:cancelButton];
        
        [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_tableFooterView);
            make.right.equalTo(middleLineView.mas_left);
            make.top.equalTo(_tableFooterView).offset(1);
            make.height.mas_equalTo(ZMTTableViewHeardAndFooterViewHeight - 1);
        }];
        
        UIButton *makeSureButton       = [UIButton buttonWithType:UIButtonTypeCustom];
        makeSureButton.tag             = 200;
        makeSureButton.titleLabel.font = [UIFont systemFontOfSize:16];
        
        [makeSureButton setTitle:ZMTMakeSureButtonTitle forState:UIControlStateNormal];
        [makeSureButton setTitleColor:DEFAULT_RED_COLOR forState:UIControlStateNormal];
        [makeSureButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        
        
        [makeSureButton addTarget:self
                           action:@selector(clickFooterViewButton:)
                 forControlEvents:UIControlEventTouchUpInside];
        
        [_tableFooterView addSubview:makeSureButton];
        
        [makeSureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(cancelButton);
            make.centerY.equalTo(cancelButton);
            make.right.equalTo(_tableFooterView);
            make.left.equalTo(middleLineView.mas_right);
        }];
    }
    
    return _tableFooterView;
}

- (UIView *)tableHeardView {

    if (!_tableHeardView) {
        
        _tableHeardView            = [[UIView alloc] init];
        
        UILabel *titleLable        = [[UILabel alloc] init];
        titleLable.font            = [UIFont boldSystemFontOfSize:16];
        titleLable.text            = _sectionTitle;
        titleLable.textAlignment   = NSTextAlignmentCenter;
        titleLable.backgroundColor = [UIColor whiteColor];
        titleLable.textColor       = [UIColor redColor];
        
        [_tableHeardView addSubview:titleLable];
        
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(_tableHeardView);
        }];
    }
    
    return _tableHeardView;
}

- (void)setTitleArray:(NSArray *)titleArray {
 
    _titleArray = titleArray;
    
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(self.frame.size.width - (20 * 2));
        make.height.mas_equalTo(MIN(titleArray.count, 4)*ZMTTableViewRowHeight+(ZMTTableViewHeardAndFooterViewHeight * 2));
    }];
    
    [self.tableView reloadData];
}

- (void)setTitleListViewDelegate:(id<ZMCTCustomTitleListViewDelegate>)titleListViewDelegate {

    _titleListViewDelegate                 = titleListViewDelegate;
    
    _hasDes.ZMTCustomTitleListViewDelegate = [titleListViewDelegate respondsToSelector:@selector(customTitleListView:chooseIndex:)];
}

- (void)setCustomType:(CustomType)customType {

    _customType = customType;
    
    if (customType == CustomType_Title) {
        [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.mas_equalTo(@130);
            make.width.mas_equalTo(self.frame.size.width - (40 * 2));
        }];
        
        [self.tableView reloadData];
    }
}

@end
