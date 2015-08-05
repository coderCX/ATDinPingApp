//
//  ATHttpTool.h
//  奥拓团购01
//
//  Created by ATBJB15 on 15/7/30.
//  Copyright (c) 2015年 AT. All rights reserved.
//  网络请求层

/*
     UI层->业务处理层->网络数据层
 */

#import <Foundation/Foundation.h>
#import "ATHttpTool.h"
#import "ATSingleton.h"

@interface ATHttpTool : NSObject

ATSingletonH(ATHttpTool)


/** 根据url和参数请求数据*/
- (void)requestWithURL:(NSString *)url params:(NSDictionary *)params
               success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
