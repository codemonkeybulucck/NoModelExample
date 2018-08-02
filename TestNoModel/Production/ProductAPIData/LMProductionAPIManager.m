//
//  LMPrudoctAPIManager.m
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "LMProductionAPIManager.h"

@implementation LMProductionAPIManager
- (NSString *)apiRequestName{
    return  @"http://120.197.235.101:8080/apk/iosPagingQuery?pageNo=1";
}


- (NSString *)apiRequestMethod{
    return GET;
}

- (NSDictionary *)apiRequestParameters{
    return nil;
}

- (id)fetchDataWithReformer:(id<ReformerProtocol>)reformer{
    if (reformer == nil) {
        return self.responseData;
    }else{
        return [reformer reformDataWith:self];
    }
}

@end
