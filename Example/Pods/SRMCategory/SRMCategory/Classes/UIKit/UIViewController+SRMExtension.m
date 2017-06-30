//
//  UIViewController+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 14/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import "UIViewController+SRMExtension.h"

@implementation UIViewController (SRMExtension)

+ (instancetype)srm_controllerFromNib {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

@end
