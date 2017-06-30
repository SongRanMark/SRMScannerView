//
//  NSURL+SRMExtension.m
//  Category Demo
//
//  Created by marksong on 08/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import "NSURL+SRMExtension.h"
#import "NSString+SRMExtension.h"

@implementation NSURL (SRMExtension)

- (NSURL *)srm_URLByAppendingQueryItemWithName:(NSString *)name value:(NSString *)value {
    if ([NSString srm_isNilOrEmptyString:name] || [NSString srm_isNilOrEmptyString:value]) {
        return self;
    }

    NSURLComponents *URLComponents = [NSURLComponents componentsWithString:self.absoluteString];
    NSMutableArray *mutableQueryItems = [NSMutableArray arrayWithArray:URLComponents.queryItems];
    [mutableQueryItems addObject:[NSURLQueryItem queryItemWithName:name value:value]];
    URLComponents.queryItems = mutableQueryItems;

    return URLComponents.URL;
}

- (NSURL *)srm_URLByAppendingQueryItems:(NSDictionary *)queryItems {
    NSMutableArray *mutableQueryItemArray = [NSMutableArray array];

    [queryItems.allKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([NSString srm_isNilOrEmptyString:obj] || [NSString srm_isNilOrEmptyString:queryItems[obj]]) {
            return;
        }

        [mutableQueryItemArray addObject:[NSURLQueryItem queryItemWithName:obj value:queryItems[obj]]];
    }];

    if (mutableQueryItemArray.count == 0) {
        return self;
    }

    NSURLComponents *URLComponents = [NSURLComponents componentsWithString:self.absoluteString];
    NSMutableArray *allQueryItemArray = [NSMutableArray arrayWithArray:URLComponents.queryItems];
    [allQueryItemArray addObjectsFromArray:mutableQueryItemArray];
    URLComponents.queryItems = allQueryItemArray;

    return URLComponents.URL;
}

@end
