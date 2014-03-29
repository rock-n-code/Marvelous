//
//  RCAPIOperation.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

#import "RCOperation.h"
#import "RCAPIOperationTypes.h"

@interface RCAPIOperation : RCOperation

@property (nonatomic, readonly) RCAPIOperationTypes type;

@end
