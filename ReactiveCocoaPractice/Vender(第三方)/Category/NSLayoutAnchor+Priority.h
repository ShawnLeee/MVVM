//
//  NSLayoutAnchor+Priority.h
//  Mygoo
//
//  Created by SXQ on 15/10/20.
//  Copyright © 2015年 SXQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSLayoutAnchor (Priority)
- (NSLayoutConstraint *)constraintEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)p;
- (NSLayoutConstraint *)constraintGreaterThanOrEqualToAnchor:(NSLayoutAnchor *)anchor constant:(CGFloat)c priority:(UILayoutPriority)p;
@end
