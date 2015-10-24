//
//  DGGeography.h
//  Weibo
//
//  Created by myApple on 15/4/29.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGGeography : NSObject
/**
 *经度坐标
 */
@property (nonatomic,copy) NSString *longitude;
/**
 *维度坐标
 */
@property (nonatomic,copy) NSString *latitude;
/**
 *所在城市的城市代码
 */
@property (nonatomic,copy) NSString *city;
/**
 *所在省份的省份代码
 */
@property (nonatomic,copy) NSString *province;
/**
 *所在城市的城市名称
 */
@property (nonatomic,copy) NSString *city_name;
/**
 *所在省份的省份名称
 */
@property (nonatomic,copy) NSString *province_name;
/**
 *所在的实际地址，可以为空
 */
@property (nonatomic,copy) NSString *address;
/**
 * 	地址的汉语拼音，不是所有情况都会返回该字段
 */
@property (nonatomic,copy) NSString *pinyin;
/**
 *更多信息，不是所有情况都会返回该字段 
 */
@property (nonatomic,copy) NSString *more;
@end
