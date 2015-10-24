//
//  DWHomeTool.m
//  WeiiCoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "SXQHttpTool.h"
#import "DWHomeTool.h"
#import "MJExtension.h"
#import "DGStatus.h"
@implementation DWHomeTool
+ (void)fetchHomeStatusWithParam:(DWHomeParam *)param success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    [SXQHttpTool getWithURL:@"https://api.weibo.com/2/statuses/friends_timeline.json" params:param.keyValues success:^(id json) {
        NSArray *stausArr = [DGStatus objectArrayWithKeyValuesArray:json[@"statuses"]];
        if (success) {
            success(stausArr);
        }
    } failure:^(NSError *error) {
        
    }];
}

@end

@implementation DWHomeParam
@end