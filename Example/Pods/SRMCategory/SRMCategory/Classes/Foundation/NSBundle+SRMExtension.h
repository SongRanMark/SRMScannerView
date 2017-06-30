//
//  NSBundle+SRMExtension.h
//  Category Demo
//
//  Created by marksong on 11/3/16.
//  Copyright © 2016 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (SRMExtension)

- (NSString *)srm_localizedStringForKey:(NSString *)key table:(NSString *)tableName;

@end
