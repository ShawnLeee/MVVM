//
//  DGStatusCell.m
//  Mygoo
//
//  Created by SXQ on 15/10/20.
//  Copyright © 2015年 SXQ. All rights reserved.
//
#import "NSLayoutAnchor+Priority.h"
#import "DGUserView.h"
#import "DGStatusCell.h"
#import "DGBottomView.h"
#import "DGStatus.h"
#import "DGRetweetedView.h"
@interface DGStatusCell ()
@property (nonatomic,weak) DGUserView *userView;
@property (nonatomic,weak) DGRetweetedView *retweeteView;
@property (nonatomic,weak) DGBottomView *bottomView;
@property (nonatomic,assign) BOOL didSetupConstraints;
@end
@implementation DGStatusCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _didSetupConstraints = NO;
        self.contentView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
        [self setupCostumsView];
//        [self updateConstraints];
    }
    return self;
}
- (void)updateConstraints
{
    if (!_didSetupConstraints) {
        [self setupCostomsConstraints];
        _didSetupConstraints = YES;
    }
//    if (self.status.retweeted_status) {
//        [NSLayoutConstraint activateConstraints:@[_userToRetweetConstraint]];
//    }else
//    {
//        [NSLayoutConstraint activateConstraints:@[_userToBottomConstraint]];
//    }
    [super updateConstraints];
}
- (void)setStatus:(DGStatus *)status
{
    _status = status;
   self.userView.status = status;
    if (status.retweeted_status) {
        self.retweeteView.hidden = NO;
    }else{
        self.retweeteView.hidden = YES;
    }
    self.retweeteView.retweetedStatus = status.retweeted_status;
    self.bottomView.status = status;
    [self layoutIfNeeded];
}
- (void)setupCostumsView
{
    //user
    DGUserView *userView = [[DGUserView alloc] init];
    userView.translatesAutoresizingMaskIntoConstraints = NO;
    _userView = userView;
    [self.contentView addSubview:userView];
    //转发微博
    DGRetweetedView *retweetedView = [[DGRetweetedView alloc] init];
    retweetedView.translatesAutoresizingMaskIntoConstraints = NO;
    _retweeteView = retweetedView;
    [self.contentView addSubview:retweetedView];
    //底部工具
    DGBottomView *bottomView = [[DGBottomView alloc] init];
    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    _bottomView = bottomView;
    [self.contentView addSubview:bottomView];
    
    
 
}
- (void)setupCostomsConstraints
{
    [self.contentView addConstraint:[self.userView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10]];
    [self.contentView addConstraint:[self.userView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10]];
    [self.contentView addConstraint:[self.userView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10]];
    
    //有转发微博
    [self.contentView addConstraint:[self.retweeteView.leadingAnchor constraintEqualToAnchor:self.userView.leadingAnchor]];
    [self.contentView addConstraint:[self.retweeteView.trailingAnchor constraintEqualToAnchor:self.userView.trailingAnchor]];
    [self.contentView addConstraint:[self.retweeteView.topAnchor constraintEqualToAnchor:self.userView.bottomAnchor]];
    
    //底部工具
    [self.contentView addConstraint:[self.bottomView.topAnchor constraintEqualToAnchor:self.retweeteView.bottomAnchor constant:0 priority:999]];
    
    [self.contentView addConstraint:[self.bottomView.leadingAnchor constraintEqualToAnchor:self.userView.leadingAnchor constant:0]];
    [self.contentView addConstraint:[self.bottomView.trailingAnchor constraintEqualToAnchor:self.userView.trailingAnchor constant:0]];
    [self.contentView addConstraint:[self.bottomView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0]];
    [self.contentView addConstraint:[self.bottomView.heightAnchor constraintEqualToAnchor:nil constant:30]];
    
}

@end
