//
//  RCComicsFilter.h
//  Marvelous
//
//  Copyright (c) 2014 Rock & Code [http://rock-n-code.com]
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "RCFilter.h"
#import "RCFormatTypeCodes.h"
#import "RCIssueTypeCodes.h"
#import "RCBooleanValueCodes.h"
#import "RCDateDescriptorCodes.h"

@interface RCComicsFilter : RCFilter

@property (nonatomic) RCFormatTypeCodes format;
@property (nonatomic) RCIssueTypeCodes formatType;
@property (nonatomic) RCBooleanValueCodes noVariants;
@property (nonatomic) RCDateDescriptorCodes dateDescriptor;
@property (nonatomic, strong) NSArray *dateRange;
@property (nonatomic, strong) NSString *diamondCode;
@property (nonatomic, strong) NSNumber *digitalIdentifier;
@property (nonatomic, strong) NSString *upc;
@property (nonatomic, strong) NSString *isbn;
@property (nonatomic, strong) NSString *ean;
@property (nonatomic, strong) NSString *issn;
@property (nonatomic) RCBooleanValueCodes hasDigitalIssue;
@property (nonatomic, strong) NSArray *creators;
@property (nonatomic, strong) NSArray *characters;
@property (nonatomic, strong) NSArray *series;
@property (nonatomic, strong) NSArray *events;
@property (nonatomic, strong) NSArray *stories;
@property (nonatomic, strong) NSArray *sharedAppearances;
@property (nonatomic, strong) NSArray *collaborators;

@end
