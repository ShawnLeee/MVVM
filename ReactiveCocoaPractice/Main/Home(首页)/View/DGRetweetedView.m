//
//  DGRetweetedView.m
//  Mygoo
//
//  Created by SXQ on 15/10/24.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "DGPhotosView.h"
#import "DGStatus.h"
#import "DGUser.h"
#import "DGRetweetedView.h"
#import "NSLayoutAnchor+Priority.h"
@interface DGRetweetedView ()
@property (nonatomic,weak) UIButton *nameBtn;
@property (nonatomic,weak) UILabel *retweetedText;
@property (nonatomic,weak) DGPhotosView *photosView;
@property (nonatomic,assign) BOOL didSetupConstraints;
@property (nonatomic,assign) CGFloat photosHeight;
@property (nonatomic,weak) NSLayoutConstraint *photosViewHeight;
@property (nonatomic,strong) NSMutableArray *paddingConstraints;
@property (nonatomic,weak) NSLayoutConstraint *heightConstraint;
@end
@implementation DGRetweetedView
- (NSMutableArray *)paddingConstraints{
    if (_paddingConstraints == nil) {
        _paddingConstraints = [NSMutableArray array];
    }
    return _paddingConstraints;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1.0];
        _didSetupConstraints = NO;
        [self p_addCustomViews];
    }
    return self;
}
- (void)setRetweetedStatus:(DGStatus *)retweetedStatus
{
    _retweetedStatus = retweetedStatus;
    [_nameBtn setTitle:_retweetedStatus.user.screen_name forState:UIControlStateNormal];
    _retweetedText.text = retweetedStatus.text;
    _photosView.photos = retweetedStatus.pic_urls;
    _photosHeight = [DGPhotosView photosViewHeightWithPhotoCount:retweetedStatus.pic_urls.count];
    
    [self setNeedsUpdateConstraints];
    [self layoutIfNeeded];
}
- (void)p_addCustomViews
{
    UIButton *nameBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nameBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [nameBtn setTitleColor:[UIColor colorWithRed:0.57 green:0.66 blue:0.78 alpha:1.0] forState:UIControlStateNormal];
    _nameBtn = nameBtn;
    [self addSubview:nameBtn];
    
    UILabel *retweetedText = [[UILabel alloc] init];
    retweetedText.translatesAutoresizingMaskIntoConstraints = NO;
    retweetedText.numberOfLines = 0;
    _retweetedText = retweetedText;
    [self addSubview:retweetedText];
    
    DGPhotosView *photosView = [[DGPhotosView alloc] init];
    photosView.translatesAutoresizingMaskIntoConstraints = NO;
    _photosView = photosView;
    [self addSubview:photosView];
}
- (void)p_setupConstraints
{
    NSLayoutConstraint *nameTopConstraint = [_nameBtn.topAnchor constraintEqualToAnchor:self.topAnchor constant:10 priority:999];
    NSLayoutConstraint *nameLeadingConstraint = [_nameBtn.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:10 priority:999];
    [self addConstraint:nameLeadingConstraint];
    [self addConstraint:nameTopConstraint];
    
    NSLayoutConstraint *retweetLeadingConstraint = [_retweetedText.leadingAnchor constraintEqualToAnchor:_nameBtn.leadingAnchor constant:0 priority:999];
    NSLayoutConstraint *retweetTopConstraint = [_retweetedText.topAnchor constraintEqualToAnchor:_nameBtn.bottomAnchor constant:0 priority:999];
    NSLayoutConstraint *retweetTrailingConstraint = [_retweetedText.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-10 priority:999];
    [self addConstraint:retweetTopConstraint];
    [self addConstraint:retweetLeadingConstraint];
    [self addConstraint:retweetTrailingConstraint];
    
    NSLayoutConstraint *photoLeadingConstraint = [_photosView.leadingAnchor constraintEqualToAnchor:_nameBtn.leadingAnchor constant:0 priority:999];
    NSLayoutConstraint *photoToRewteetConstraint = [_photosView.topAnchor constraintEqualToAnchor:_retweetedText.bottomAnchor constant:10 priority:999];
    NSLayoutConstraint *photoToBottomConstraint = [_photosView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-10 priority:999];
    NSLayoutConstraint *photoTrailingConstraint = [_photosView.trailingAnchor constraintEqualToAnchor:_retweetedText.trailingAnchor constant:0 priority:999];
    NSLayoutConstraint *photosHeightConstraint = [_photosView.heightAnchor constraintEqualToAnchor:nil constant:0 priority:999];
    [self addConstraint:photoLeadingConstraint];
    [self addConstraint:photoToRewteetConstraint];
    [self addConstraint:photoToBottomConstraint];
    [self addConstraint:photoTrailingConstraint];
    [self addConstraint:photosHeightConstraint];
 
    NSLayoutConstraint *heightConstraint = [self.heightAnchor constraintEqualToAnchor:nil constant:0 priority:1000];
    [self addConstraint:heightConstraint];
    _heightConstraint = heightConstraint;
    
    [self.paddingConstraints addObjectsFromArray:@[heightConstraint,nameTopConstraint,nameLeadingConstraint,retweetLeadingConstraint,retweetTopConstraint,retweetTrailingConstraint,photoToBottomConstraint,photoToRewteetConstraint,photoTrailingConstraint,photosHeightConstraint,photoLeadingConstraint]];
    _photosViewHeight = photosHeightConstraint;
    
}

- (void)updateConstraints
{
    if (_didSetupConstraints == NO) {
        
        [self p_setupConstraints];
        _didSetupConstraints = YES;
    }
    if (!_retweetedStatus) {
        if (_heightConstraint) {
            _heightConstraint.active = YES;
        }
    }else
    {
        _heightConstraint.active = NO;
    }   
    _photosViewHeight.constant = _photosHeight;
    
    [super updateConstraints];
}
@end
