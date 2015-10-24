//
//  DGPhotosView.h
//  Mygoo
//
//  Created by SXQ on 15/10/21.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGPhotosView : UIView
/**
 *   Model array of DGPhoto
 */
@property (nonatomic,strong) NSArray *photos;
+ (CGFloat)photosViewHeightWithPhotoCount:(NSUInteger)count;
@end
