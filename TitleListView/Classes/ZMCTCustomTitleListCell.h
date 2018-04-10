//
//  ZMCTCustomTitleListCell.h
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZMCTCustomTitleListModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZMCTCustomTitleListCell : UITableViewCell

//显示文字
@property (nonatomic, strong) ZMCTCustomTitleListModel *titleListModel;

@end

NS_ASSUME_NONNULL_END
