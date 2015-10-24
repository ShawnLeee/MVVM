//
//  DWHomeTool.h
//  WeiiCoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "DWBaseParam.h"
#import <Foundation/Foundation.h>
@interface DWHomeParam:DWBaseParam
/**
 *  若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
 */
@property (nonatomic, strong) NSNumber *since_id;

/**
 *  若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
 */
@property (nonatomic, strong) NSNumber *max_id;

/**
 *  单页返回的记录条数，最大不超过100，默认为20。
 */
@property (nonatomic, strong) NSNumber *count;

@end
@interface DWHomeTool : NSObject
+ (void)fetchHomeStatusWithParam:(DWHomeParam *)param success:(void (^)(NSArray *statusArr))success failure:(void (^)(NSError *error))failure;
@end
