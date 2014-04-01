//
//  RCQueryInfoObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 01/04/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCDataWrapperObject.h"

@interface RCQueryInfoObject : NSObject

@property (nonatomic, readonly, strong) NSString *copyright;
@property (nonatomic, readonly, strong) NSString *attributionText;
@property (nonatomic, readonly, strong) NSString *attributionHTML;
@property (nonatomic, readonly, strong) NSString *etag;
@property (nonatomic, readonly, strong) NSNumber *offset;
@property (nonatomic, readonly, strong) NSNumber *limit;
@property (nonatomic, readonly, strong) NSNumber *total;
@property (nonatomic, readonly, strong) NSNumber *count;

- (id)initWithDataWrapper:(RCDataWrapperObject *)dataWrapper;

@end
