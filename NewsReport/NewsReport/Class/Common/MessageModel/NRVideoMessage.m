//
//  NRIMVideoElem.m
//  NewsReport
//
//  Created by Facebook on 2018/2/1.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "NRVideoMessage.h"

@implementation NRVideoMessage

- (instancetype)init
{
    if (self = [super init]) {
        [self setMessageType:MessageTypeVideo];
    }
    return self;
}






- (NSString *)conversationContent
{
    return @"[视频消息]";
}

- (NSString *)messageCopy
{
    return [self.content mj_JSONString];
}


@end
