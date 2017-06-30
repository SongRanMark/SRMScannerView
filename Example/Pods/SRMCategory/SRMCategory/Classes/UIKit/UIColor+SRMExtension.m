//
//  UIColor+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import "UIColor+SRMExtension.h"

@implementation UIColor (SRMExtension)

+ (instancetype)srm_colorWithHex:(NSInteger)hex {
    UIColor *color = [[self class] srm_colorWithHex:hex alpha:1];

    return color;
}

+ (instancetype)srm_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha {
    hex = hex < 0 ? 0 : hex;
    hex = hex > 0xffffff ? 0xffffff : hex;
    UIColor *color = [[self class] srm_colorWithR:(hex >> 16) & 0xff G:(hex >> 8) & 0xff B:hex & 0xff A:alpha];

    return color;
}

+ (instancetype)srm_colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue {
    UIColor *color = [self srm_colorWithR:red G:green B:blue A:1];

    return color;
}

+ (instancetype)srm_colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha {
    red = red < 0 ? 0 : red;
    red = red > 255 ? 255 : red;
    green = green < 0 ? 0 : green;
    green = green > 255 ? 255 : green;
    blue = blue < 0 ? 0 : blue;
    blue = blue > 255 ? 255 : blue;
    UIColor *color = [[self class] colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];

    return color;
}

@end
