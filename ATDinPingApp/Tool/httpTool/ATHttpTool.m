//
//  ATHttpTool.m
//  奥拓团购01
//
//  Created by ATBJB15 on 15/7/30.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "ATHttpTool.h"
#import "DPAPI.h"

@interface ATHttpTool()<DPRequestDelegate>
@property (nonatomic,strong) DPAPI *api;
@end

@implementation ATHttpTool

ATSingletonM(ATHttpTool)

//懒加载
- (DPAPI *)api{
    if (!_api) {
        self.api = [[DPAPI alloc] init];
    }
    return _api;
}

#pragma - mark block包装处理// v1/deal/find_deals
- (void)requestWithURL:(NSString *)url params:(NSDictionary *)params
               success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
   DPRequest *request =  [self.api requestWithURL:url params:[NSMutableDictionary dictionaryWithDictionary:params] delegate:self];
    request.success = success;
    request.failure = failure;
    
//    NSLog(@"%@---%@",request.success,success);
}

- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result{
    
    if (request.success) {
        request.success(result);
    }
    
}

- (void)request:(DPRequest *)request didFailWithError:(NSError *)error{
    if (request.failure) {
        request.failure(error);
    }
}

@end
