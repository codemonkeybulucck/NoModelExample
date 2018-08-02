//
//  LMNetwork.m
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

#import "LMNetwork.h"

NSString * const POST = @"POST";
NSString * const GET = @"GET";

@interface LMNetwork()
@property (nonatomic,weak) NSURLSession *session;
@end

@implementation LMNetwork

+ (instancetype)sharedInstance{
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LMNetwork alloc]init];
    });
    return _instance;
}

- (void)requestMethod:(NSString *)method url:(NSString *)url parameters:(id)parameters finishBlock:(void (^)(id data, NSError *error))finishBlock{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    if (parameters != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
        request.HTTPBody = data;
    }
    request.HTTPMethod = method;
    [[self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data == nil || error) {
                finishBlock(nil,error);
                return ;
            }
            NSError *parseError = nil;
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&parseError];
            if (error) {
                finishBlock(nil,error);
            }else{
                finishBlock(json,nil);
            }
        });
    }]resume];
}

- (NSURLSession *)session{
    if (!_session) {
        _session = [NSURLSession sharedSession];
    }
    return _session;
}
@end
