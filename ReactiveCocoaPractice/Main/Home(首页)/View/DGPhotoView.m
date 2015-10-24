//
//  DGPhotoView.m
//  Mygoo
//
//  Created by SXQ on 15/10/21.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "DGPhoto.h"
#import "DGPhotoView.h"
#import "UIImageView+WebCache.h"
@interface DGPhotoView ()
@property (nonatomic,weak) UIImageView *gifView;
@end
@implementation DGPhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        _gifView = gifView;
    }
    return self;
}
- (void)setPhoto:(DGPhoto *)photo
{
    _photo = photo;
    self.gifView.hidden = ![photo.thumbnail_pic hasSuffix:@"gif"];
    
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.gifView.layer.anchorPoint = CGPointMake(1, 1);
    self.gifView.layer.position = CGPointMake(self.frame.size.width, self.frame.size.height);
}
@end
