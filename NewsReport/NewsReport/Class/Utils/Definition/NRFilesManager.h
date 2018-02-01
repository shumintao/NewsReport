//
//  NRFilesManager.h
//  NewsReport
//
//  Created by Facebook on 2018/1/30.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#ifndef NRFilesManager_h
#define NRFilesManager_h

/*!
 系统库
 */
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*!
 宏文件
 */
#import "NRConst.h"
#import "Chat.h"
/*!
 自定义类
 */
#import "UIImage+NRExtension.h"
#import "UIView+NRExtension.h"
#import "NSString+LSWMEXtension.h"
#import "NSDate+NRCategory.h"
#import "NRBusinessNetworkTool.h"
#import "UIView+Toast.h"
#import "NRUserTools.h"

/*!
 Base类
 */
#import "NRBaseViewController.h"
#import "NRBaseTableViewCell.h"
#import "NRBaseModel.h"

/*!
 三方库
 */

#import <UIImageView+WebCache.h>
#import <FLAnimatedImageView+WebCache.h>
#import <CYLTabBarController/CYLTabBarController.h>
#import <TTTAttributedLabel.h>
#import <AFNetworking.h>
#import <Masonry.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import <YYCache.h>
#import <FMDB.h>
/*!
 Chat库
 */
#import "ClientCoreSDK.h"
#import "ConfigEntity.h"
#import "NRIMClientManager.h"
#import "LocalUDPDataSender.h"

/*!
 消息数据基类
 */
#import "NRIMElem.h"
#import "NRIMTextElem.h"
#import "NRIMImageElem.h"
#import "NRIMSoundElem.h"
#import "NRIMFileElem.h"
#import "NRIMVideoElem.h"
#import "NRIMLocationElem.h"

#endif /* NRFilesManager_h */
