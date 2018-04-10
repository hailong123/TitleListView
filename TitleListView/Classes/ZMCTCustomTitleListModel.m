//
//  ZMCTCustomTitleListModel.m
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "ZMCTCustomTitleListModel.h"

@implementation ZMCTCustomTitleListModel

+ (instancetype)initCustomTitleListModelWithTitle:(nonnull NSString *)title
                                    normalImgName:(nonnull NSString *)normalImgName
                                    selectImgName:(nonnull NSString *)selectImgName
                                         selected:(BOOL)selected {

    ZMCTCustomTitleListModel *listModel = [[ZMCTCustomTitleListModel alloc] init];
    
    listModel.title          = title;
    listModel.selected       = selected;
    listModel.normalImgName  = normalImgName;
    listModel.selectImgName  = selectImgName;
    
    return listModel;
}

@end
