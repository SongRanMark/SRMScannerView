//
//  NSURL+SRMExtension.h
//  Category Demo
//
//  Created by marksong on 08/06/2017.
//  Copyright © 2017 SR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SRMExtension)

/**
 若所添加的 query 键值对不合法时，则返回实例本身。成功添加键值对时，会返回新的实例。返回的新实例
 会以实例本身的 absoluteString 创建，所以新的 NSURL 实例不会有 baseURL。
 */
- (NSURL *)srm_URLByAppendingQueryItemWithName:(NSString *)name value:(NSString *)value;
/**
 当字典中键值都为字符串时，会作为一个合法的 query item 添加。若没有可添加的 query item 时，则
 返回实例本身。成功添加键值对时，会返回新的实例。
 */
- (NSURL *)srm_URLByAppendingQueryItems:(NSDictionary *)queryItems;

@end
