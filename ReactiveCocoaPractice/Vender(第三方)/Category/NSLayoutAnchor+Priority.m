//
//  NSLayoutAnchor+Priority.m
//  Mygoo
//
//  Created by SXQ on 15/10/20.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import "NSLayoutAnchor+Priority.h"

@implementation NSLayoutAnchor (Priority)
- (NSLayoutConstraint *)constraintEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)p
{
    NSLayoutConstraint *constraint = [self constraintEqualToAnchor:anchor constant:c];
    constraint.priority = p;
    return constraint;
}
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)p
{
    NSLayoutConstraint *constraint = [self constraintGreaterThanOrEqualToAnchor:anchor constant:c];
    constraint.priority = p;
    return constraint;
}
@end
