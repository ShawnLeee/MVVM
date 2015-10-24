//
//  DWHomeData.h
//  WeiiCoo
//
//  Created by SXQ on 15/10/7.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWHomeData : NSObject
@property (nonatomic,strong,readonly) NSArray *dwStatus;
- (instancetype)initWithDataLoadCompletion:(void (^)(BOOL success))completion;
@end
