//
//  LMProductReformer.m
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "LMProductReformer.h"
#import "LMBaseAPIManager.h"
#import "LMProductionAPIManager.h"

NSString * const kLMProductionVer = @"productionVer";
NSString * const kLMProductionVerDesc = @"productionVerDesc";

@implementation LMProductReformer

- (id)reformDataWith:(LMBaseAPIManager *)apiManager{
    //这里根据不同的APIManager返回相应的数据
    if ([apiManager isKindOfClass: [LMProductionAPIManager class]]) {
        NSDictionary *dict = apiManager.responseData;
        NSArray *list = dict[@"list"];
        NSMutableArray *mArr = [NSMutableArray arrayWithCapacity:list.count];
        for (NSDictionary *dict in list) {
            NSDictionary *infoDict = @{kLMProductionVer:dict[@"ver"],kLMProductionVerDesc:dict[@"verDesc"]};
            [mArr addObject:infoDict];
        }
        return mArr;
    }else{
        return  nil;
    }
}
@end
