//
//  RCStatusCodes.h
//  Marvelous
//
//  Created by Javier Cicchelli on 29/03/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

typedef NS_ENUM(NSInteger, RCStatusCodes) {
	RCStatusCodeOK = 200,
	RCStatusCodeInvalidParameter = 401,
	RCStatusCodeAccessForbidden = 403,
	RCStatusCodeDataNotFound = 404,
	RCStatusCodeMethodNotAllowed = 405,
	RCStatusCodeParameterError = 409
};

