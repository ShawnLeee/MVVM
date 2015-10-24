//
//  DGPhotosView.m
//  Mygoo
//
//  Created by SXQ on 15/10/21.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "DGPhoto.h"
#import "DGPhotoView.h"
#import "DGPhotosView.h"
#import "MJPhotoBrowser.h"
#import "MJPhoto.h"
#define IWPhotoW 70
#define IWPhotoH 70
#define IWPhotoMargin 10
@implementation DGPhotosView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        for (int i = 0; i < 9; i++) {
            DGPhotoView *photoView = [DGPhotoView new];
            photoView.tag = i;
            [photoView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoTap:)]];
            [self addSubview:photoView];
        }
    }
    return self;
}
+ (CGFloat)photosViewHeightWithPhotoCount:(NSUInteger)count
{
    if(count == 0)
        return 0;
    // 一行最多有3列
    int maxColumns = (count == 4) ? 2 : 3;
    
    //  总行数
    NSUInteger rows = (count + maxColumns - 1) / maxColumns;
    // 高度
    CGFloat photosH = rows * IWPhotoH + (rows - 1) * IWPhotoMargin;
    
    // 总列数
    NSUInteger cols = (count >= maxColumns) ? maxColumns : count;
    // 宽度
//    CGFloat photosW = cols * IWPhotoW + (cols - 1) * IWPhotoMargin;
    return photosH;
}
- (void)photoTap:(UITapGestureRecognizer *)recognizer
{
    NSUInteger count = self.photos.count;
    NSMutableArray *myPhotos = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0 ; i < count; i++) {
        MJPhoto *mjPhoto = [MJPhoto new];
        mjPhoto.srcImageView = self.subviews[i];
        
        DGPhoto *dgPhoto = self.photos[i];
        NSString *photoUrl = [dgPhoto.thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        mjPhoto.url = [NSURL URLWithString:photoUrl];
        [myPhotos addObject:mjPhoto];
    }
    
    MJPhotoBrowser *browser = [MJPhotoBrowser new];
    browser.photos = myPhotos;
    [browser show];
}
- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    for (int i = 0; i<self.subviews.count; i++) {
        // 取出i位置对应的imageView
        DGPhotoView *photoView = self.subviews[i];
        
        // 判断这个imageView是否需要显示数据
        if (i < photos.count) {
            // 显示图片
            photoView.hidden = NO;
            
            // 传递模型数据
            photoView.photo = photos[i];
            
            // 设置子控件的frame
            int maxColumns = (photos.count == 4) ? 2 : 3;
            int col = i % maxColumns;
            int row = i / maxColumns;
            CGFloat photoX = col * (IWPhotoW + IWPhotoMargin);
            CGFloat photoY = row * (IWPhotoH + IWPhotoMargin);
            photoView.frame = CGRectMake(photoX, photoY, IWPhotoW, IWPhotoH);
            
            // Aspect : 按照图片的原来宽高比进行缩
            // UIViewContentModeScaleAspectFit : 按照图片的原来宽高比进行缩放(一定要看到整张图片)
            // UIViewContentModeScaleAspectFill :  按照图片的原来宽高比进行缩放(只能图片最中间的内容)
            // UIViewContentModeScaleToFill : 直接拉伸图片至填充整个imageView
            
            if (photos.count == 1) {
                photoView.contentMode = UIViewContentModeScaleAspectFit;
                photoView.clipsToBounds = NO;
            } else {
                photoView.contentMode = UIViewContentModeScaleAspectFill;
                photoView.clipsToBounds = YES;
            }
        } else { // 隐藏imageView
            photoView.hidden = YES;
        }
    }
}
@end
