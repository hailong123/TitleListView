//
//  ZMCTCustomTitleListModel.h
//  ZMTProject
//
//  Created by Sea on 2017/8/15.
//  Copyright © 2017年 Sea. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CreateCustomTitleListModel(subTitle, normalImgStr,selectImgStr, select)  \
[ZMCTCustomTitleListModel initCustomTitleListModelWithTitle:subTitle \
                                            normalImgName:normalImgStr \
                                            selectImgName:selectImgStr \
                                                selected:select]

NS_ASSUME_NONNULL_BEGIN

@interface ZMCTCustomTitleListModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normalImgName;
@property (nonatomic, copy) NSString *selectImgName;

@property (nonatomic, assign, getter=isSelected) BOOL selected;

//创建实例
/*
 *  @param title    标题
 *  @param imgName  图片名称
 *  @param selected 是否被选中
 *
 */

+ (instancetype)initCustomTitleListModelWithTitle:(NSString *)title
                                    normalImgName:(NSString *)normalImgName
                                    selectImgName:(NSString *)selectImgName
                                         selected:(BOOL)selected;

@end

NS_ASSUME_NONNULL_END
