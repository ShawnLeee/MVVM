//
//  DGUserView.m
//  Mygoo
//
//  Created by SXQ on 15/10/20.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "DGStatus.h"
#import "DGUserView.h"
#import "DGUser.h"
#import "UIImageView+WebCache.h"
#import "NSLayoutAnchor+Priority.h"
#import "DGPhotosView.h"
#define kAvatarHeight 35
#define kAvatarWidth 35
@interface DGUserView ()
@property (nonatomic,weak) UILabel *userLabel;
@property (nonatomic,weak) UILabel *createdLabel;
@property (nonatomic,weak) UIImageView *avatar;
@property (nonatomic,weak) UILabel *statusLabel;
@property (nonatomic,weak) DGPhotosView *photosView;
@property (nonatomic,weak) NSLayoutConstraint *photosViewConstant;
@property (nonatomic,assign) CGFloat photoHeight;
@property (nonatomic,assign) BOOL didSetupConstraints;
@end
@implementation DGUserView
- (instancetype)init
{
    if(self =  [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
        _didSetupConstraints = NO;
        [self setupCostomViews];
    }
    return self;
}
- (void)setStatus:(DGStatus *)status
{
    _status = status;
    DGUser *user = status.user;
    
    self.statusLabel.text = status.text;
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:user.avatar_hd]];
    self.createdLabel.text = status.created_at;
    self.userLabel.text = user.screen_name;
    self.photosView.photos = status.pic_urls;
    _photoHeight = [DGPhotosView photosViewHeightWithPhotoCount:status.pic_urls.count];
    [self setNeedsUpdateConstraints];
    [self layoutIfNeeded];
}
- (void)updateConstraints
{
    if (!_didSetupConstraints) {
        [self setupCostomViewsConstrains];
        _didSetupConstraints = YES;
    }
    _photosViewConstant.constant = _photoHeight;
    [super updateConstraints];
}
- (void)setupCostomViews
{
    //用户头像
    UIImageView *avatar = [[UIImageView alloc] init];
    avatar.layer.cornerRadius = kAvatarHeight/2.0;
    avatar.clipsToBounds = YES;
    avatar.contentMode = UIViewContentModeScaleAspectFit;
    avatar.translatesAutoresizingMaskIntoConstraints = NO;
    _avatar = avatar;
    [self addSubview:avatar];
   //用户昵称
    UILabel *userLabel = [[UILabel alloc] init];
    userLabel.translatesAutoresizingMaskIntoConstraints = NO;
    userLabel.font = [UIFont systemFontOfSize:15];
    userLabel.textColor = [UIColor colorWithRed:0.96 green:0.48 blue:0.03 alpha:1.0];
    userLabel.backgroundColor = [UIColor clearColor];
    _userLabel = userLabel;
    [self addSubview:userLabel];
    
    //创建时间
    UILabel *cretedLabel = [[UILabel alloc] init];
    cretedLabel.font = [UIFont systemFontOfSize:13];
    cretedLabel.textColor = [UIColor orangeColor];
    cretedLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _createdLabel = cretedLabel;
    [self addSubview:cretedLabel];
    
   //微博正文
    UILabel *statusLabel = [[UILabel alloc] init];
    statusLabel.numberOfLines = 0;
    statusLabel.font = [UIFont systemFontOfSize:17];
    statusLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _statusLabel = statusLabel;
    [self addSubview:_statusLabel];
    //微博配图
    DGPhotosView *photosView = [[DGPhotosView alloc] init];
    photosView.translatesAutoresizingMaskIntoConstraints = NO;
    _photosView = photosView;
    [self addSubview:photosView];
}
- (void)setupCostomViewsConstrains
{
    //用户头像
    [self addConstraint:[self.avatar.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10]];
    [self addConstraint:[self.avatar.topAnchor constraintEqualToAnchor:self.topAnchor constant:10]];
    [self addConstraint:[self.avatar.widthAnchor constraintEqualToAnchor:nil constant:kAvatarWidth]];
    [self addConstraint:[self.avatar.heightAnchor constraintEqualToAnchor:nil constant:kAvatarHeight]];
    
   //用户昵称
    [self addConstraint:[self.userLabel.leadingAnchor constraintEqualToAnchor:self.avatar.trailingAnchor constant:10]];
    [self addConstraint:[self.userLabel.topAnchor constraintEqualToAnchor:self.avatar.topAnchor constant:0]];
    
    //创建时间
    [self addConstraint:[self.createdLabel.leadingAnchor constraintEqualToAnchor:self.userLabel.leadingAnchor constant:0]];
    [self addConstraint:[self.createdLabel.bottomAnchor constraintEqualToAnchor:self.avatar.bottomAnchor constant:0]];
    
    //微博正文
    [self addConstraint:[self.statusLabel.leadingAnchor constraintEqualToAnchor:self.avatar.leadingAnchor constant:0]];
    [self addConstraint:[self.statusLabel.topAnchor constraintEqualToAnchor:self.avatar.bottomAnchor constant:10]];
    [self addConstraint:[self.statusLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10]];
//    [self addConstraint:[self.statusLabel.bottomAnchor constraintGreaterThanOrEqualToAnchor:self.bottomAnchor constant:-10 priority:999]];
    
    //微博配图
    NSLayoutConstraint *photosViewHeightConstraint = [self.photosView.heightAnchor constraintEqualToAnchor:nil constant:0];
    _photosViewConstant = photosViewHeightConstraint;
    [self addConstraint:photosViewHeightConstraint];
    
    [self addConstraint:[self.photosView.leadingAnchor constraintEqualToAnchor:self.avatar.leadingAnchor]];
    [self addConstraint:[self.photosView.topAnchor constraintEqualToAnchor:self.statusLabel.bottomAnchor constant:10]];
    [self addConstraint:[self.photosView.trailingAnchor constraintEqualToAnchor:self.statusLabel.trailingAnchor]];
    [self addConstraint:[self.photosView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0]];
    
}

@end
