//
//  LMBaseAPIManager.m
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "LMBaseAPIManager.h"

@interface LMBaseAPIManager()
@property (nonatomic, weak) id<APIRequestProtocol> request;
@end

@implementation LMBaseAPIManager
- (instancetype)init{
    if (self = [super init]) {
        if ([self conformsToProtocol:@protocol(APIRequestProtocol)]) {
            self.request = (id<APIRequestProtocol>)self;
        }else{
            NSAssert(NO, @"子类必须要遵循APIRequestProtocol协议");
        }
    }
    return self;
}


- (void)startRequest{
    [[LMNetwork sharedInstance]requestMethod:[self.request apiRequestMethod] url:[self.request apiRequestName] parameters:[self.request apiRequestParameters] finishBlock:^(id data, NSError *error) {
        if (error) {
            self.responseError = error;
        }else{
            self.responseData = data;
        }
        if ([self.response respondsToSelector:@selector(apiResponseSuccess:)]) {
            [self.response apiResponseSuccess:self.request];
        }
    }];
}

@end
