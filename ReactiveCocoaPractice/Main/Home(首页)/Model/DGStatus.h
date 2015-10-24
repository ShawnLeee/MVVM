//
//  DGStatus.h
//  Weibo
//
//  Created by myApple on 15/4/29.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DGUser.h"
#import "DGGeography.h"
@interface DGStatus : NSObject
/**
 * 	微博创建时间
 */
@property (nonatomic,copy) NSString *created_at;
/**
 * 微博ID
 */
@property (nonatomic,assign) long long id;
/**
 *  微博MID
 */
@property (nonatomic,assign) long long mid;
/**
 *  字符串型的微博ID
 */
@property (nonatomic,copy) NSString *idstr;
/**
 *  微博信息内容
 */
@property (nonatomic,copy) NSString *text;
/**
 *   微博来源
 */
@property (nonatomic,copy) NSString *source;
/**
 * 是否已收藏，true：是，false：否 
 */
@property (nonatomic,assign,getter=isfavorited) BOOL favorited;
/**
 * 是否被截断，true：是，false：否
 */
@property (nonatomic,assign,getter=istruncated) BOOL truncated;
/**
 *  微博的配图(数组中装模型:IWPhoto)
 */
@property (nonatomic,strong) NSArray *pic_urls;
/**
 * 被转发的原微博信息字段，当该微博为转发微博时返回
 */
@property (nonatomic,strong) DGStatus *retweeted_status;
/**
 * 转发数
 */
@property (nonatomic,assign) int reposts_count;
/**
 * 评论数
 */
@property (nonatomic,assign) int comments_count;
/**
 * 表态数 
 */
@property (nonatomic,assign) int attitudes_count;
/**
 *  微博作者的用户信息字段
 */
@property (nonatomic,strong) DGUser *user;
/**
 *   地理信息字段
 */
@property (nonatomic,strong) DGGeography *geo;
@end
















