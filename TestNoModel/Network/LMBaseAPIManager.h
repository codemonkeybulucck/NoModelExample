//
//  LMBaseAPIManager.h
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMReformerProtocol.h"
#import "LMNetwork.h"


@class LMBaseAPIManager;

//请求协议
@protocol APIRequestProtocol <NSObject>
- (NSString *)apiRequestName;
- (NSString *)apiRequestMethod;
- (NSDictionary *)apiRequestParameters;
- (id)fetchDataWithReformer:(id<ReformerProtocol>)reformer;
@end

//响应协议
@protocol APIResponseProtocol <NSObject>
/// 响应成功后的处理
- (void)apiResponseSuccess:(id<APIRequestProtocol>)request;
@end


@interface LMBaseAPIManager : NSObject
@property (nonatomic, weak) id<APIResponseProtocol> response;
@property (nonatomic, strong) NSDictionary *responseData;
@property (nonatomic, strong) NSError *responseError;
@property (nonatomic, assign) BOOL isCache;
- (void)startRequest;
@end





