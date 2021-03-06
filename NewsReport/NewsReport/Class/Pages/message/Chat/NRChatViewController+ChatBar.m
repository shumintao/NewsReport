//
//  NRChatViewController+ChatBar.m
//  NewsReport
//
//  Created by Facebook on 2018/2/13.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "NRChatViewController+ChatBar.h"
#import "NRChatViewController+Message.h"

@implementation NRChatViewController (ChatBar)

#pragma mark < 发送消息 >
/*！
 *  文本消息
 */
- (void)chatKeyBoardSendText:(NSString *)text{
//        NRTextMessage *message = [[NRTextMessage alloc]init];
//        message.messageType = MessageTypeText;
//        message.userID = [[NRUserHelper defaultCenter]getUserID];
//        message.friendID  = convertToString(_targetId);
//        message.text = convertToString(text);
//        message.messageID = convertToString( [NSString stringWithFormat:@"%@+%@",[[NRUserHelper defaultCenter]getUserID],[NRNewsReportTools getTimeTampWithDigit:13]]);
//        [self sendMessageWithText:message CompletecBlock:^(int code) {
//            if (code == COMMON_CODE_OK) {
//                NSLog(@"文本消息发送成功");
//            }else{
//                NSLog(@"文本消息发送失败");
//            }
//        }];
}

/*！
 *  图片消息
 */
-(void)sendMessageWithImages{
    //    [self.lastSelectProcessedDatas enumerateObjectsUsingBlock:^(NRImagePickModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        NRImageMessage *message = [[NRImageMessage alloc]init];
    //        message.messageType = MessageTypeImage;
    //        message.userID = [[NRUserHelper defaultCenter]getUserID];
    //        message.friendID  = convertToString(_targetId);
    ////        message.imagePath = obj.image;
    //        message.messageID = convertToString( [NSString stringWithFormat:@"%@+%@",[[NRUserHelper defaultCenter]getUserID],[NRNewsReportTools getTimeTampWithDigit:13]]);
    //        [self sendMessageWithImage:message isOrignal:self.isOriginal CompletecBlock:^(int code) {
    //            if (code == COMMON_CODE_OK) {
    //                NSLog(@"文本消息发送成功");
    //            }else{
    //                NSLog(@"文本消息发送失败");
    //            }
    //        }];
    //    }];
}



#pragma MARK < ChatKeyBoardDelegate >
/*！
 *  更多功能
 */
- (void)chatKeyBoard:(ChatKeyBoard *)chatKeyBoard didSelectMorePanelItemIndex:(NSInteger)index{
    [self.chatKeyBoard keyboardDown];
    MoreItem *item = self.morePanelItems[index];
    
    WS(weakSelf)
    if ([item.itemName isEqualToString:@"图片"]) {
        [NRPhotoLibraryManager requestALAssetsLibraryAuthorizationWithCompletion:^(Boolean isAuth) {
            WSSTRONG(strongSelf)
            if (isAuth) {
                [strongSelf.lastSelectProcessedDatas removeAllObjects];
                [strongSelf showPhotoLibray];
            }else{
                NSString *tips = @"请在iPhone的“设置-隐私-照片”选项中，允许在线访问你的照片";
                [[NRAlertView shareInstance]showAlert:nil message:tips  cancelTitle:@"取消" titleArray:@[@"确定"] viewController:self confirm:^(NSInteger buttonTag) {
                    if (buttonTag != -1) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"]];
                    }
                }];
            }
        }];
        return ;
    }
    
    if ([item.itemName isEqualToString:@"拍照"]) {
        
        [NRPhotoLibraryManager requestALAssetsCameraAuthorizationWithCompletion:^(Boolean isAuth) {
            WSSTRONG(strongSelf)
            if (isAuth) {
                
                ZLCustomCamera *camera = [[ZLCustomCamera alloc] init];
                camera.allowRecordVideo = NO;
                camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
                    
                    
                };
                [strongSelf presentViewController:camera animated:YES completion:nil];
            }else{
                NSString *tips = @"请在iPhone的“设置-隐私-照片”选项中，允许在线访问你的相机";
                [[NRAlertView shareInstance]showAlert:nil message:tips  cancelTitle:@"取消" titleArray:@[@"确定"] viewController:self confirm:^(NSInteger buttonTag) {
                    if (buttonTag != -1) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"]];
                    }
                }];
            }
        }];
        return ;
    }
    
    if ([item.itemName isEqualToString:@"小视频"]) {
        ZLCustomCamera *camera = [[ZLCustomCamera alloc] init];
        camera.circleProgressColor = MainTitle_Color;
        camera.maxRecordDuration = 60;
        camera.allowRecordVideo = YES;
        
        camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
            
            
        };
        [self presentViewController:camera animated:YES completion:nil];
        
        return ;
    }
    
    if ([item.itemName isEqualToString:@"位置"]) {
        
        
    }
    
    if ([item.itemName isEqualToString:@"语音通话"]) {
        
        
    }
    
    if ([item.itemName isEqualToString:@"视频通话"]) {
        
        
    }
    
    if ([item.itemName isEqualToString:@"文件"]) {
        
        
    }
}

/*！
 *  表情
 */
- (void)chatKeyBoardFacePicked:(ChatKeyBoard *)chatKeyBoard faceStyle:(NSInteger)faceStyle faceName:(NSString *)faceName delete:(BOOL)isDeleteKey{
    
    
}

#pragma mark < Recording >

/*！
 *  开始录音
 */
- (void)chatKeyBoardDidStartRecording:(ChatKeyBoard *)chatKeyBoard{
    [self.recordView recordButtonTouchDown];
    //     [[NRSoundRecorder shareInstance] startSoundRecord:self.view];
    
    int x = arc4random() % 100000;
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSString *fileName = [NSString stringWithFormat:@"%d%d",(int)time,x];
    [[WXDeviceManager sharedInstance] asyncStartRecordingWithFileName:fileName completion:^(NSError *error){
        if (error) {
            NSLog(@"开始录音失败");
        }else{
            NSLog(@"开始录音成功");
        }
    }];
}

/*！
 *  取消录音
 */
- (void)chatKeyBoardDidCancelRecording:(ChatKeyBoard *)chatKeyBoard{
    [self.recordView recordButtonTouchUpOutside];
    //    [[NRSoundRecorder shareInstance]recordButtonTouchUpOutside];
}

/*！
 *  完成录音
 */
- (void)chatKeyBoardDidFinishRecoding:(ChatKeyBoard *)chatKeyBoard{
    [self.recordView recordButtonTouchUpInside];
    //        [[NRSoundRecorder shareInstance]recordButtonTouchUpInside];
    
    [[WXDeviceManager sharedInstance] asyncStopRecordingWithCompletion:^(NSString *recordPath, NSInteger aDuration, NSError *error) {
        if (!error) {
            NSLog(@"完成录音成功:%@||录音时长:%zd",recordPath,aDuration);
        }else{
            NSLog(@"录音时间太短了");
        }
    }];
}

/*！
 *  将要取消录音
 */
- (void)chatKeyBoardWillCancelRecoding:(ChatKeyBoard *)chatKeyBoard{
    [self.recordView recordButtonDragOutside];
    //     [[NRSoundRecorder shareInstance]recordButtonDragOutside];
}

/*！
 *  继续录音
 */
- (void)chatKeyBoardContineRecording:(ChatKeyBoard *)chatKeyBoard{
    [self.recordView recordButtonDragInside];
    //      [[NRSoundRecorder shareInstance]recordButtonDragInside];
}

#pragma mark  < WXDeviceManagerProximitySensorDelegate >

- (void)proximitySensorChanged:(BOOL)isCloseToUser{
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if (isCloseToUser){
        [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    } else {
        [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
        [[WXDeviceManager sharedInstance] disableProximitySensor];
    }
    [audioSession setActive:YES error:nil];
}

#pragma mark  < ChatKeyBoardDataSource >
- (NSArray<MoreItem *> *)chatKeyBoardMorePanelItems{
    [self.morePanelItems removeAllObjects];
    
    MoreItem *item1 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_photo" highLightPicName:nil itemName:@"图片"];
    MoreItem *item2 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_camera" highLightPicName:nil itemName:@"拍照"];
    MoreItem *item3 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_video" highLightPicName:nil itemName:@"小视频"];
    MoreItem *item4 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_location" highLightPicName:nil itemName:@"位置"];
    MoreItem *item5 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_audioCall" highLightPicName:nil itemName:@"语音通话"];
    MoreItem *item6 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_videoCall" highLightPicName:nil itemName:@"视频通话"];
    MoreItem *item7 = [MoreItem moreItemWithPicName:@"chatBar_colorMore_photo" highLightPicName:nil itemName:@"文件"];
    [self.morePanelItems addObjectsFromArray:@[item1, item2, item3, item4, item5, item6, item7]];
    
    return self.morePanelItems;
}

- (NSArray<ChatToolBarItem *> *)chatKeyBoardToolbarItems{
    ChatToolBarItem *item1 = [ChatToolBarItem barItemWithKind:kBarItemFace normal:@"face" high:@"face_HL" select:@"keyboard"];
    ChatToolBarItem *item2 = [ChatToolBarItem barItemWithKind:kBarItemVoice normal:@"voice" high:@"voice_HL" select:@"keyboard"];
    ChatToolBarItem *item3 = [ChatToolBarItem barItemWithKind:kBarItemMore normal:@"more_ios" high:@"more_ios_HL" select:nil];
    ChatToolBarItem *item4 = [ChatToolBarItem barItemWithKind:kBarItemSwitchBar normal:@"switchDown" high:nil select:nil];
    
    return @[item1, item2, item3, item4];
}

- (NSArray<FaceThemeModel *> *)chatKeyBoardFacePanelSubjectItems{
    return [FaceSourceManager loadFaceSource];
}

#pragma MARK  < ZLCustomCamera >
-(void)showPhotoLibray{
    ZLPhotoActionSheet *photoActionSheetView = [[ZLPhotoActionSheet alloc] init];
    ZLPhotoConfiguration *configuration = [ZLPhotoConfiguration defaultPhotoConfiguration];
    configuration.sortAscending = NO;
    configuration.allowSelectImage = YES;
    configuration.allowSelectGif = NO;
    configuration.allowSelectVideo = NO;
    configuration.allowSelectLivePhoto = NO;
    configuration.allowForceTouch = NO;
    configuration.allowEditImage = NO;
    configuration.allowEditVideo = NO;
    configuration.allowSlideSelect = YES;
    configuration.allowDragSelect = YES;
    configuration.allowMixSelect = NO;
    //设置相册内部显示拍照按钮
    configuration.allowTakePhotoInLibrary = YES;
    //设置在内部拍照按钮上实时显示相机俘获画面
    configuration.showCaptureImageOnTakePhotoBtn = YES;
    //设置照片最大预览数
    configuration.maxPreviewCount = 100;
    //设置照片最大选择数
    configuration.maxSelectCount =  9 - self.lastSelectPhotos.count;
    configuration.maxVideoDuration  = 999999;
    //单选模式是否显示选择按钮
    configuration.showSelectBtn = YES;
    //是否在选择图片后直接进入编辑界面
    configuration.editAfterSelectThumbnailImage = NO;
    //是否在已选择照片上显示遮罩层
    configuration.showSelectedMask = NO;
    configuration.clipRatios = @[GetClipRatio(1, 1)];
    //颜色，状态栏样式
    configuration.selectedMaskColor = UIColorFromRGB(0xFF758C);
    configuration.navBarColor =  [UIColor blackColor];
    configuration.navTitleColor = UIColorFromRGB(0X323232);
    configuration.bottomBtnsNormalTitleColor =  UIColorFromRGB(0xFF758C);
    configuration.bottomBtnsDisableBgColor =  UIColorFromRGB(0xFF758C);
    configuration.bottomViewBgColor =  UIColorFromRGB(0xffffff);
    configuration.statusBarStyle = UIStatusBarStyleDefault;
    //是否允许框架解析图片
    configuration.shouldAnialysisAsset = YES;
    configuration.exportVideoType = ZLExportVideoTypeMp4;
    photoActionSheetView.configuration = configuration;
    photoActionSheetView.sender = self;
    WS(weakSelf)
    [photoActionSheetView setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
        NSMutableArray *dataSocure = [NSMutableArray arrayWithCapacity:0];
        WSSTRONG(strongSelf)
        strongSelf.isEditor  = YES;
        strongSelf.isOriginal  =isOriginal;
        [strongSelf.lastSelectAssets addObjectsFromArray:assets.mutableCopy];
        [strongSelf.lastSelectPhotos addObjectsFromArray:images.mutableCopy];
        NSLog(@"image:%@", images);
        for (int  i = 0 ; i<strongSelf.lastSelectAssets.count; i++) {
            PHAsset *asset = strongSelf.lastSelectAssets[i];
            NRImagePickModel *model = [[NRImagePickModel alloc]init];
            if (asset.mediaType == PHAssetMediaTypeVideo) {     ///视频
                model.pushType = PhotosPushTypeVideo;
                model.durationStr = [ZLPhotoManager getDuration:asset];
                model.duration = [asset duration];
            }else{
                model.pushType = PhotosPushTypeImage;
            }
            model.image = strongSelf.lastSelectPhotos[i];
            [dataSocure addObject:model];
        }
        strongSelf.lastSelectProcessedDatas = [NSMutableArray arrayWithArray:dataSocure];
        [strongSelf sendMessageWithImages];
    }];
    [photoActionSheetView showPhotoLibrary];
}

@end
