//
//  DGPhoto.h
//  Weibo
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 apress. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DGPhoto : NSObject
/**
 *  缩略图
 */
@property (nonatomic,copy) NSString *thumbnail_pic;
/**
 *  中等尺寸图片地址，没有时不返回此字段
 */
@property (nonatomic,copy) NSString *bmiddle_pic;
/**
 *   原始图片地址，没有时不返回此字段
 */
@property (nonatomic,copy) NSString *original_pic;
@end
