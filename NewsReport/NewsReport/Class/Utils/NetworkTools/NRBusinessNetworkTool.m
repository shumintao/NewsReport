//
//  NRBusinessNetworkTool.m
//  NewsReport
//
//  Created by Facebook on 2018/1/30.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "NRBusinessNetworkTool.h"
#import "NRNetworkHelper.h"

@implementation NRBusinessNetworkTool

+(void)PostLoginWithUserPassword:(NSString *)password username:(NSString *)username CompleteSuccessfull:(void (^)(id responseObject))successfull  failure:(void (^)(NSError *error))failure{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:0];
    [parameters setValue:convertToString(password) forKey:@"password"];
    [parameters setValue:convertToString(username) forKey:@"name"];
    
    [NRNetworkHelper POST:PostLoginAuthenticationURL parameters:parameters success:^(id responseObject) {
        if (responseObject) {
            if ([responseObject[@"code"] intValue]==0) {
                successfull?successfull(responseObject[@"result"]):nil;
            }
        }
    } failure:^(NSError *error) {
        failure?failure(error):nil;
    }];
    
}

@end
