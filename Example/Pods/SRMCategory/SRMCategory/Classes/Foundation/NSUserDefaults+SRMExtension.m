//
//  NSUserDefaults+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 06/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import "NSUserDefaults+SRMExtension.h"

@implementation NSUserDefaults (SRMExtension)

- (NSString *)srm_nonNullStringForKey:(NSString *)key {
    NSString *string = [[NSUserDefaults standardUserDefaults] stringForKey:key];

    // stringForKey 方法会将 NSNumber 类型的值转换为对应字符串类型，将其他非字符串类型转换为 nil。
    if (!string) {
        string = @"";
    }

    return string;
}

@end
