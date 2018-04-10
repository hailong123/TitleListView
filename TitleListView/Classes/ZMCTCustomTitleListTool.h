//
//  ZMCTCustomTitleListTool.h
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZMCTCustomTitleListModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZMCTCustomTitleListTool : NSObject

//获取到指定的模型数组
+ (NSArray <ZMCTCustomTitleListModel*> *)fetchCustomTitleListModelData;

@end

NS_ASSUME_NONNULL_END
