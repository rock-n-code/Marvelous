//
//  RCListModel.h
//  Marvelous
//
//  Created by Javier Cicchelli on 31/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

@interface RCListModel : NSObject

@property (nonatomic, strong) NSNumber *available;
@property (nonatomic, strong) NSNumber *returned;
@property (nonatomic, strong) NSURL *collectionURI;
@property (nonatomic, strong) NSArray *items;

@end
