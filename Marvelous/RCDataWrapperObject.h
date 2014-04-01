//
//  RCDataWrapperObject.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCDataContainerObject.h"
#import "RCAPITypes.h"

@interface RCDataWrapperObject : NSObject

@property (nonatomic, readonly, strong) NSNumber *code;
@property (nonatomic, readonly, strong) NSString *status;
@property (nonatomic, readonly, strong) NSString *copyright;
@property (nonatomic, readonly, strong) NSString *attributionText;
@property (nonatomic, readonly, strong) NSString *attributionHTML;
@property (nonatomic, readonly, strong) RCDataContainerObject *data;
@property (nonatomic, readonly, strong) NSString *etag;

- (id)initWithType:(RCAPITypes)type andDictionary:(NSDictionary *)dictionary;

@end
