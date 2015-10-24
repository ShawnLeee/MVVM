//
//  DWBaseParam.h
//  Mygoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWBaseParam : NSObject
@property (nonatomic,copy) NSString *access_token;
+ (instancetype)param;
@end
