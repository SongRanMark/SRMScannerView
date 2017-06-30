//
//  UIView+SRMFrame.h
//  SRMNews
//
//  Created by marksong on 24/01/2017.
//  Copyright © 2017 S.R. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SRMFrame)

- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;
- (CGFloat)originX;
- (CGFloat)originY;
- (CGPoint)origin;
- (void)setOriginX:(CGFloat)originX;
- (void)setOriginY:(CGFloat)originY;
- (void)setOrigin:(CGPoint)origin;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setSize:(CGSize)size;

@end
