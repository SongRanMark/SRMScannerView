//
//  NSString+SRMExtension.h
//  Category Demo
//
//  Created by marksong on 14/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SRMExtension)

#pragma mark - Empty String
+ (NSString *)srm_emptyString;
+ (BOOL)srm_isNilOrEmptyString:(NSString *)string;
#pragma mark - Encryption
- (NSString *)srm_md5HexDigest;

@end
