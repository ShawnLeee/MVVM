//
//  DGBottomViewModel.h
//  ReactiveCocoaPractice
//
//  Created by SXQ on 15/10/24.
//  Copyright © 2015年 SXQ. All rights reserved.
//
@class RACCommand;
#import <Foundation/Foundation.h>

@interface DGBottomViewModel : NSObject
@property (nonatomic,strong) RACCommand *retweetCmd;
@property (nonatomic,strong) RACCommand *commentCmd;
@property (nonatomic,strong) RACCommand *likeCmd;
@end
