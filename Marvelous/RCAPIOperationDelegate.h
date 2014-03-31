//
//  RCAPIOperationDelegate.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

@class RCAPIOperation;

@protocol RCAPIOperationDelegate <NSObject>

@required
- (void)operation:(RCAPIOperation *)operation didReceivedJSONDictionary:(NSDictionary *)dictionary;
- (void)operation:(RCAPIOperation *)operation didReceivedError:(NSError *)error;

@end
