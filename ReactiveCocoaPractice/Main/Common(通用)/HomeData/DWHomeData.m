//
//  DWHomeData.m
//  WeiiCoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "DWHomeData.h"
#import "DWHomeTool.h"
@interface DWHomeData()
@property (nonatomic,strong,readwrite) NSArray *dwStatus;
@property (nonatomic,copy) void (^completion)(BOOL success);
@end
@implementation DWHomeData
- (instancetype)initWithDataLoadCompletion:(void (^)(BOOL))completion
{
    if (self = [super init]) {
        _dwStatus = [@[] mutableCopy];
        _completion = [completion copy];
        [self loadStatusData];    
    }
    return self;
    
}
- (void)loadStatusData
{
    DWHomeParam *param = [DWHomeParam new];
    [DWHomeTool fetchHomeStatusWithParam:param success:^(NSArray *statusArr) {
        self.dwStatus = statusArr;
        _completion(YES);
    } failure:^(NSError *error) {
        
    }];
}
@end
