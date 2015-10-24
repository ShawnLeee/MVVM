//
//  DWBaseParam.m
//  Mygoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "IWAccount.h"
#import "DWBaseParam.h"
#import "IWAccountTool.h"
@implementation DWBaseParam
- (id)init
{
    if (self = [super init]) {
        self.access_token = [IWAccountTool account].access_token;
    }
    return self;
}

+ (instancetype)param
{
    return [[self alloc] init];
}
@end
