//
//  DGBottomView.m
//  Mygoo
//
//  Created by SXQ on 15/10/20.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import "DGBottomView.h"
#import "DGStatus.h"
#import "NSLayoutAnchor+Priority.h"
@interface DGBottomView ()
@property (nonatomic,weak) UIButton *retweetBtn;
@property (nonatomic,weak) UIButton *commentBtn;
@property (nonatomic,weak) UIButton *likeBtn;
@property (nonatomic,assign) BOOL didSetupConstraints;
@end
@implementation DGBottomView
- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
//        self.backgroundColor = [UIColor redColor];
        _didSetupConstraints = NO;
        [self setupCustomViews];
    }
    return self;
}
- (void)setStatus:(DGStatus *)status
{
    _status = status;
    [self.commentBtn setTitle:[NSString stringWithFormat:@"%d",status.comments_count] forState:UIControlStateNormal];
    [self.commentBtn setImage:[UIImage imageNamed:@"timeline_icon_comment"] forState:UIControlStateNormal];
    
    [self.retweetBtn setTitle:[NSString stringWithFormat:@"%d",status.reposts_count] forState:UIControlStateNormal];
    [self.retweetBtn setImage:[UIImage imageNamed:@"timeline_icon_retweet"] forState:UIControlStateNormal];
    
    [self.likeBtn setTitle:[NSString stringWithFormat:@"%d",status.attitudes_count] forState:UIControlStateNormal];
    [self.likeBtn setImage:[UIImage imageNamed:@"timeline_icon_like"] forState:UIControlStateSelected];
    [self.likeBtn setImage:[UIImage imageNamed:@"timeline_icon_like_disable"] forState:UIControlStateNormal];
//    [self setNeedsUpdateConstraints];
//    [self layoutIfNeeded];
}
- (void)updateConstraints
{
    if (!_didSetupConstraints) {
        [self setupCustomViwesConstraints];
        _didSetupConstraints = YES;
    }
    [super updateConstraints];
}
- (void)setupCustomViews
{
    //转发
    UIButton *retweetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    retweetBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    retweetBtn.imageView.contentMode = UIViewContentModeCenter;
    [retweetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    retweetBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _retweetBtn = retweetBtn;
    [self addSubview:retweetBtn];
    //评论
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    commentBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    commentBtn.imageView.contentMode = UIViewContentModeCenter;
    [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    commentBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _commentBtn = commentBtn;
    [self addSubview:commentBtn];
    //赞
     UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    likeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    likeBtn.imageView.contentMode = UIViewContentModeCenter;
    [likeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    likeBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _likeBtn = likeBtn;
    [self addSubview:likeBtn];
}

- (void)setupCustomViwesConstraints
{
    CGFloat padding = 60;
    CGFloat bottomPadding = 4;
    //赞
    [self addConstraint:[self.likeBtn.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-padding]];
    [self addConstraint:[self.likeBtn.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-bottomPadding]];
    //转发
    [self addConstraint:[self.retweetBtn.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:padding]];
    [self addConstraint:[self.retweetBtn.bottomAnchor constraintEqualToAnchor:self.likeBtn.bottomAnchor]];
    //评论
    [self addConstraint:[self.commentBtn.centerXAnchor constraintEqualToAnchor:self.centerXAnchor]];
    [self addConstraint:[self.commentBtn.bottomAnchor constraintEqualToAnchor:self.likeBtn.bottomAnchor]];
    
    
}
@end
