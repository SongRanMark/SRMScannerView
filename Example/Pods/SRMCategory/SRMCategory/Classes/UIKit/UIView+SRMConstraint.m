//
//  UIView+SRMConstraint.m
//  Example
//
//  Created by S.R on 16/3/27.
//  Copyright © 2016年 S.R. All rights reserved.
//

#import "UIView+SRMConstraint.h"

@implementation UIView (SRMConstraint)

- (NSArray<NSLayoutConstraint *> *)srm_addSizeConstraints:(CGSize)size {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self srm_addWidthConstraint:size.width]];
    [constraintArray addObject:[self srm_addHeightConstraint:size.height]];

    return [constraintArray copy];
}

- (NSLayoutConstraint *)srm_addWidthConstraint:(CGFloat)width {
    return [self addConstraintAttribute:NSLayoutAttributeWidth toView:nil constant:width];
}

- (NSLayoutConstraint *)srm_addHeightConstraint:(CGFloat)height {
    return [self addConstraintAttribute:NSLayoutAttributeHeight toView:nil constant:height];
}

- (NSArray<NSLayoutConstraint *> *)srm_addSizeConstraintsEqualToView:(UIView *)view {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self srm_addWidthConstraintEqualToView:view]];
    [constraintArray addObject:[self srm_addHeightConstraintEqualToView:view]];

    return [constraintArray copy];
}

- (NSLayoutConstraint *)srm_addWidthConstraintEqualToView:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeWidth toView:view multiplier:1];
}

- (NSLayoutConstraint *)srm_addHeightConstraintEqualToView:(UIView *)view {
    return [self addConstraintAttribute:NSLayoutAttributeHeight toView:view multiplier:1];
}

- (NSArray<NSLayoutConstraint *> *)srm_addCenterConstraintsEqualToView:(UIView *)view {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self srm_addCenterConstraintEqualToViewVertically:view]];
    [constraintArray addObject:[self srm_addCenterConstraintEqualToViewHorizontally:view]];

    return [constraintArray copy];
}

- (NSLayoutConstraint *)srm_addCenterConstraintEqualToViewVertically:(UIView *)view {
    return [self srm_addCenterConstraintToViewVertically:view constant:0];
}

- (NSLayoutConstraint *)srm_addCenterConstraintEqualToViewHorizontally:(UIView *)view {
    return [self srm_addCenterConstraintToViewHorizontally:view constant:0];
}

- (NSArray<NSLayoutConstraint *> *)srm_addCenterConstraintsToView:(UIView *)view offset:(UIOffset)offset {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self srm_addCenterConstraintToViewVertically:view constant:offset.vertical]];
    [constraintArray addObject:[self srm_addCenterConstraintToViewHorizontally:view constant:offset.horizontal]];

    return [constraintArray copy];
}

- (NSLayoutConstraint *)srm_addCenterConstraintToViewVertically:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeCenterY toView:view constant:constant];
}

- (NSLayoutConstraint *)srm_addCenterConstraintToViewHorizontally:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeCenterX toView:view constant:constant];
}

- (NSArray<NSLayoutConstraint *> *)srm_addEdgesConstraintsEqualToView:(UIView *)view {
    return [self srm_addEdgesConstraintsToView:view insets:UIEdgeInsetsZero];
}

- (NSArray<NSLayoutConstraint *> *)srm_addEdgesConstraintsToView:(UIView *)view insets:(UIEdgeInsets)edgeInsets {
    NSMutableArray *constraintArray = [NSMutableArray array];
    [constraintArray addObject:[self srm_addTopConstraintToView:view constant:edgeInsets.top]];
    [constraintArray addObject:[view srm_addBottomConstraintToView:self constant:edgeInsets.bottom]];
    [constraintArray addObject:[self srm_addLeadingConstraintToView:view constant:edgeInsets.left]];
    [constraintArray addObject:[view srm_addTrailingConstraintToView:self constant:edgeInsets.right]];
   
    return [constraintArray copy];
}

- (NSLayoutConstraint *)srm_addTopConstraintEqualToView:(UIView *)view {
    return [self srm_addTopConstraintToView:view constant:0];
}
     
- (NSLayoutConstraint *)srm_addTopConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeTop toView:view constant:constant];
}
     
- (NSLayoutConstraint *)srm_addBottomConstraintEqualToView:(UIView *)view {
    return [self srm_addBottomConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)srm_addBottomConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeBottom toView:view constant:constant];
}
     
- (NSLayoutConstraint *)srm_addLeadingConstraintEqualToView:(UIView *)view {
    return [self srm_addLeadingConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)srm_addLeadingConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeLeading toView:view constant:constant];
}

- (NSLayoutConstraint *)srm_addTrailingConstraintEqualToView:(UIView *)view {
    return [self srm_addTrailingConstraintToView:view constant:0];
}

- (NSLayoutConstraint *)srm_addTrailingConstraintToView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeTrailing toView:view constant:constant];
}


- (NSLayoutConstraint *)srm_addConstraintNextToViewVertically:(UIView *)view {
    return [self srm_addConstraintNextToViewVertically:view constant:0];
}

- (NSLayoutConstraint *)srm_addConstraintNextToViewVertically:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeTop toView:view attribute:NSLayoutAttributeBottom constant:constant];
}

- (NSLayoutConstraint *)srm_addConstraintNextToViewHorizontally:(UIView *)view {
    return [self srm_addConstraintNextToViewHorizontally:view constant:0];
}

- (NSLayoutConstraint *)srm_addConstraintNextToViewHorizontally:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:NSLayoutAttributeLeading toView:view attribute:NSLayoutAttributeTrailing constant:constant];
}

- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)attribute toView:(UIView *)view constant:(CGFloat)constant {
    return [self addConstraintAttribute:attribute toView:view attribute:attribute constant:constant];
}
     
- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)attribute toView:(UIView *)view multiplier:(CGFloat)multiplier {
    return [self addConstraintAttribute:attribute toView:view attribute:attribute multiplier:multiplier];
}
     
- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)selfAttribute toView:(UIView *)view attribute:(NSLayoutAttribute)viewAttribute constant:(CGFloat)constant {
    return [self addConstraintAttribute:selfAttribute toView:view attribute:viewAttribute multiplier:1 constant:constant];
}
     
- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)selfAttribute toView:(UIView *)view attribute:(NSLayoutAttribute)viewAttribute multiplier:(CGFloat)multiplier {
    return [self addConstraintAttribute:selfAttribute toView:view attribute:viewAttribute multiplier:multiplier constant:0];
}

- (NSLayoutConstraint *)addConstraintAttribute:(NSLayoutAttribute)selfAttribute toView:(UIView *)view attribute:(NSLayoutAttribute)viewAttribute multiplier:(CGFloat)multiplier constant:(CGFloat)constant {
    if (![NSLayoutConstraint respondsToSelector:@selector(activateConstraints:)]) {
        return nil;
    }

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:selfAttribute relatedBy:NSLayoutRelationEqual toItem:view attribute:viewAttribute multiplier:multiplier constant:constant];
    [NSLayoutConstraint activateConstraints:@[constraint]];

    return constraint;
}

@end
