//
//  ViewController.m
//  ATDinPingApp
//
//  Created by ATBJB15 on 15/7/30.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "ViewController.h"
#import "ATHttpTool.h"

@interface ViewController ()
{
    UIView *viewTest;
    
    CALayer *layer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //数据请求字典(其他更多细节参见大众点评API)
    NSDictionary *requestDict = @{
                                  @"city":@"合肥",//城市
                                  @"limit":@10//分页(最多显示几条数据)
                                  };
    [[ATHttpTool sharedATHttpTool] requestWithURL:@"v1/deal/find_deals" params:requestDict success:^(id json) {
         NSLog(@"请求成功----%@",json);
    } failure:^(NSError *error) {
        NSLog(@"请求失败----%@",error);
    }];

}

@end
