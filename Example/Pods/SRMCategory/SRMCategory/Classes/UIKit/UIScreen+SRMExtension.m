//
//  UIScreen+SRMExtension.m
//  SRMNews
//
//  Created by marksong on 17/01/2017.
//  Copyright © 2017 S.R. All rights reserved.
//

#import "UIScreen+SRMExtension.h"

@implementation UIScreen (SRMExtension)

+ (CGSize)srm_mainSize {
    return [self mainScreen].bounds.size;
}

+ (CGFloat)srm_mainWidth {
    return CGRectGetWidth([self mainScreen].bounds);
}

+ (CGFloat)srm_mainHeight {
    return CGRectGetHeight([self mainScreen].bounds);
}

@end
