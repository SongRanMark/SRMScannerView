//
//  UIView+SRMFrame.m
//  SRMNews
//
//  Created by marksong on 24/01/2017.
//  Copyright © 2017 S.R. All rights reserved.
//

#import "UIView+SRMFrame.h"

@implementation UIView (SRMFrame)

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)originX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)originY {
    return CGRectGetMinY(self.frame);
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOriginX:(CGFloat)originX {
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (void)setOriginY:(CGFloat)originY {
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

@end
