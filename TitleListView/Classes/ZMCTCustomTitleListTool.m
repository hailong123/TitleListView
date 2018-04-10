//
//  ZMCTCustomTitleListTool.m
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import "ZMCTCustomTitleListTool.h"

#import "ZMCTCustomTitleListModel.h"

@implementation ZMCTCustomTitleListTool

+ (NSArray<ZMCTCustomTitleListModel *> *)fetchCustomTitleListModelData {

    ZMCTCustomTitleListModel *listOne = CreateCustomTitleListModel(@"应用于最近7天",
                                                                  @"home_icon_coursescheduling",
                                                                  @"home_icon_courseware", YES);
    
    ZMCTCustomTitleListModel *listTwo = CreateCustomTitleListModel(@"存为模板并应用于以后每周",
                                                                  @"home_icon_coursescheduling",
                                                                  @"home_icon_courseware", NO);
    
    
    
    return @[listOne,listTwo];
}

@end
