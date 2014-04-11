//
//  RCComicsObject.h
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

#import "RCObject.h"
#import "RCSummaryObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"

@interface RCComicsObject : RCObject

@property (nonatomic, readonly, strong) NSNumber *identifier;
@property (nonatomic, readonly, strong) NSNumber *digitalIdentifier;
@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSNumber *issueNumber;
@property (nonatomic, readonly, strong) NSString *summary;
@property (nonatomic, readonly, strong) NSString *variantDescription;
@property (nonatomic, readonly, strong) NSDate *lastModified;
@property (nonatomic, readonly, strong) NSString *isbn;
@property (nonatomic, readonly, strong) NSString *upc;
@property (nonatomic, readonly, strong) NSString *diamondCode;
@property (nonatomic, readonly, strong) NSString *ean;
@property (nonatomic, readonly, strong) NSString *issn;
@property (nonatomic, readonly, strong) NSString *format;
@property (nonatomic, readonly, strong) NSNumber *pageCount;
@property (nonatomic, readonly, strong) NSArray *textObjects;
@property (nonatomic, readonly, strong) NSURL *resourceURI;
@property (nonatomic, readonly, strong) NSArray *urls;
@property (nonatomic, readonly, strong) RCSummaryObject *series;
@property (nonatomic, readonly, strong) NSArray *variants;
@property (nonatomic, readonly, strong) NSArray *collections;
@property (nonatomic, readonly, strong) NSArray *collectedIssues;
@property (nonatomic, readonly, strong) NSArray *dates;
@property (nonatomic, readonly, strong) NSArray *prices;
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;
@property (nonatomic, readonly, strong) NSArray *images;
@property (nonatomic, readonly, strong) RCListObject *creators;
@property (nonatomic, readonly, strong) RCListObject *characters;
@property (nonatomic, readonly, strong) RCListObject *stories;
@property (nonatomic, readonly, strong) RCListObject *events;

@end
