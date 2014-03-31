//
//  RCDataWrapperModel.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

@class RCDataContainerModel;

@interface RCDataWrapperModel : NSObject

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSString *attributionText;
@property (nonatomic, strong) NSString *attributionHTML;
@property (nonatomic, strong) RCDataContainerModel *data;
@property (nonatomic, strong) NSString *etag;

@end
