//
//  LMReformer.h
//  TestNoModel
//
//  Created by lemon on 2018/8/1.
//  Copyright © 2018年 Lemon. All rights reserved.
//

//数据过滤器的协议
@class LMBaseAPIManager;

@protocol ReformerProtocol <NSObject>
- (id)reformDataWith:(LMBaseAPIManager*)apiManager;
@end
