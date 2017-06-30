//
//  UIColor+SRMExtension.h
//  Category Demo
//
//  Created by marksong on 07/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SRMExtension)

/**
 期望接收的参数为六位十六进制形式的整数(0xcccccc)，以对应 RGB 颜色值的十六进制表示。若输入其他
 形式的整数，则以该整数的十六进制形式处理。若整数值小于0，则以 0x000000 处理。若整数值大于 0xffffff，
 则以 0xffffff 处理。若整数值的十六进制形式不足六位，则在高位补足 0，如 0xfff 会以 0x000fff
 处理。返回的颜色实例透明度为 1。
 */
+ (instancetype)srm_colorWithHex:(NSInteger)hex;
/**
 透明度参数值的范围为0到1之间，若小于0则以0计算，若大于1则以1计算。
 */
+ (instancetype)srm_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;
/**
 分别接收 RGB 颜色表示中三个值的十进制表示，若颜色值小于0，则以0处理。若颜色值大于255则以255处理。
 返回的颜色实例透明度为 1。
 */
+ (instancetype)srm_colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue;
/**
 透明度参数值的范围为0到1之间，若小于0则以0计算，若大于1则以1计算。
 */
+ (instancetype)srm_colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(CGFloat)alpha;

@end
