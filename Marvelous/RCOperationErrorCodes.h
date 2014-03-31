//
//  RCOperationErrorCodes.h
//  Marvelous
//
//  Created by Javier Cicchelli on 15/02/14.
//  Copyright (c) 2014 Rock & Code. All rights reserved.
//

typedef NS_ENUM(NSInteger, RCOperationErrorCodes) {
	RCOperationErrorCodeOperationCancelled = -1,
	RCOperationErrorCodeTypeUndefined = -1001,
	RCOperationErrorCodePublicKeyIsNull = -1002,
	RCOperationErrorCodeIdentifierIsNull = -1003,
	RCOperationErrorCodeJSONStatus = -1004,
	RCOperationErrorCodeInvalidParameter = -1005,
	RCOperationErrorCodeAccessForbidden = -1006,
	RCOperationErrorCodeDataNotFound = -1007,
	RCOperationErrorCodeMethodNotAllowed = -1008,
	RCOperationErrorCodeParameterError = -1009,
};