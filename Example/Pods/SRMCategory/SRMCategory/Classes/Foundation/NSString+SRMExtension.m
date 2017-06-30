//
//  NSString+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 14/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import "NSString+SRMExtension.h"
#import <CommonCrypto/CommonDigest.h>

static NSString *const kEmptyString = @"";

@implementation NSString (SRMExtension)

+ (NSString *)srm_emptyString {
    return kEmptyString;
}

+ (BOOL)srm_isNilOrEmptyString:(NSString *)string {
    if (!string) {
        return YES;
    }

    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }

    NSCharacterSet *whitespaceAndNewlineCharacterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [string stringByTrimmingCharactersInSet:whitespaceAndNewlineCharacterSet];

    if ([trimedString isEqualToString:[self srm_emptyString]]) {
        return YES;
    }

    return NO;
}

- (NSString *)srm_md5HexDigest {
    NSData* inputData = [self dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char outputData[CC_MD5_DIGEST_LENGTH];
    CC_MD5([inputData bytes], (unsigned int)[inputData length], outputData);
    NSMutableString* hashStr = [NSMutableString string];

    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [hashStr appendFormat:@"%02x", outputData[i]];
    }

    return hashStr;
}

@end
