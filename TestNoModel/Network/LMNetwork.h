//
//  LMNetwork.h
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString * const POST;
FOUNDATION_EXTERN NSString * const GET;

@interface LMNetwork : NSObject

+ (instancetype)sharedInstance;

- (void)requestMethod:(NSString *)method url:(NSString *)url parameters:(id)parameters finishBlock:(void (^)(id data, NSError *error))finishBlock;

@end
