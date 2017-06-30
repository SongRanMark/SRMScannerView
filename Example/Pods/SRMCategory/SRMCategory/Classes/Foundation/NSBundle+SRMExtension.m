//
//  NSBundle+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 11/3/16.
//  Copyright © 2016 SR. All rights reserved.
//

#import "NSBundle+SRMExtension.h"

@implementation NSBundle (SRMExtension)

- (NSString *)srm_localizedStringForKey:(NSString *)key table:(NSString *)tableName {
    return [self localizedStringForKey:key value:nil table:tableName];
}

@end
