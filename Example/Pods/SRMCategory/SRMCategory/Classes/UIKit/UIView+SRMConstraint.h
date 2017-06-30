//
//  UIView+SRMConstraint.h
//  Example
//
//  Created by S.R on 16/3/27.
//  Copyright © 2016年 S.R. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 添加约束即已生效，无需额外执行激活操作。返回约束实例以便之后动态的修改。只支持 iOS8.0 及以上，若
 系统版本低于 iOS8.0 则不会添加对应约束，返回值为 nil。执行添加约束的方法，默认为该 view 的布局
 完全由手动添加的约束控制，所以会将 translatesAutoresizingMaskIntoConstraints 属性设为 NO，
 如需改为 YES，应在执行完所有添加约束的方法后设置。
 */
@interface UIView (SRMConstraint)

#pragma mark - Size
- (NSArray<NSLayoutConstraint *> *)srm_addSizeConstraints:(CGSize)size;
- (NSLayoutConstraint *)srm_addWidthConstraint:(CGFloat)width;
- (NSLayoutConstraint *)srm_addHeightConstraint:(CGFloat)height;
- (NSArray<NSLayoutConstraint *> *)srm_addSizeConstraintsEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addWidthConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addHeightConstraintEqualToView:(UIView *)view;
#pragma mark - Center
- (NSArray<NSLayoutConstraint *> *)srm_addCenterConstraintsEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addCenterConstraintEqualToViewVertically:(UIView *)view;
- (NSLayoutConstraint *)srm_addCenterConstraintEqualToViewHorizontally:(UIView *)view;
- (NSArray<NSLayoutConstraint *> *)srm_addCenterConstraintsToView:(UIView *)view offset:(UIOffset)offset;
- (NSLayoutConstraint *)srm_addCenterConstraintToViewVertically:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)srm_addCenterConstraintToViewHorizontally:(UIView *)view constant:(CGFloat)constant;
#pragma mark - Edge
- (NSArray<NSLayoutConstraint *> *)srm_addEdgesConstraintsEqualToView:(UIView *)view;
- (NSArray<NSLayoutConstraint *> *)srm_addEdgesConstraintsToView:(UIView *)view insets:(UIEdgeInsets)edgeInsets;
- (NSLayoutConstraint *)srm_addTopConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addTopConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)srm_addBottomConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addBottomConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)srm_addLeadingConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addLeadingConstraintToView:(UIView *)view constant:(CGFloat)constant;
- (NSLayoutConstraint *)srm_addTrailingConstraintEqualToView:(UIView *)view;
- (NSLayoutConstraint *)srm_addTrailingConstraintToView:(UIView *)view constant:(CGFloat)constant;
// view.bottom - 0 - self.top
- (NSLayoutConstraint *)srm_addConstraintNextToViewVertically:(UIView *)view;
// view.bottom - constant - self.top
- (NSLayoutConstraint *)srm_addConstraintNextToViewVertically:(UIView *)view constant:(CGFloat)constant;
// view.trailing - 0 - self.leading
- (NSLayoutConstraint *)srm_addConstraintNextToViewHorizontally:(UIView *)view;
// view.trailing - constant - self.leading
- (NSLayoutConstraint *)srm_addConstraintNextToViewHorizontally:(UIView *)view constant:(CGFloat)constant;

@end
