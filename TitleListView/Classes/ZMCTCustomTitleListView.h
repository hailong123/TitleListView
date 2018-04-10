//
//  ZMCTCustomTitleListView.h
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZMCTCustomTitleListTool.h"

typedef NS_ENUM(NSInteger, CustomTitleChangeType) {
    CustomTitleChangeType_Sure = 0,
    CustomTitleChangeType_Cancle
};

typedef NS_ENUM(NSInteger, CustomType) {

    CustomType_List = 0,
    CustomType_Title
};

@class ZMCTCustomTitleListView;
@class ZMCTCustomTitleListModel;

NS_ASSUME_NONNULL_BEGIN

@protocol ZMCTCustomTitleListViewDelegate <NSObject>

- (void)customTitleListView:(ZMCTCustomTitleListView *)titleListView
                chooseIndex:(CustomTitleChangeType)type;

@end

IB_DESIGNABLE

@interface ZMCTCustomTitleListView : UIView

@property (nonatomic, copy) NSArray <ZMCTCustomTitleListModel *> *titleArray;

@property (nonatomic, weak) id<ZMCTCustomTitleListViewDelegate>titleListViewDelegate;

- (void)showSectionTittle:(nullable NSString *)sectionTitle
             contantTitle:(nullable NSString *)contantTitle
               customType:(CustomType)customType
                     view:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
