//
//  NSUserDefaults+SRMExtension.h
//  Category Demo
//
//  Created by marksong on 06/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SRMExtension)

/**
 当未存有对应键的值时，则返回空字符串。当对应键所存值为 NSNumber 类型时，则返回数值的字符串类型。
 */
- (NSString *)srm_nonNullStringForKey:(NSString *)key;

@end
