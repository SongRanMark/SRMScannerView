//
//  UIView+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 14/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import "UIView+SRMExtension.h"

@implementation UIView (SRMExtension)

- (void)srm_clearSubviews {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
}

@end
