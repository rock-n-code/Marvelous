//
//  RCCreatorObject.h
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
#import "RCImageObject.h"
#import "RCListObject.h"

@interface RCCreatorObject : RCObject

@property (nonatomic, readonly, strong) NSNumber *identifier;
@property (nonatomic, readonly, strong) NSString *firstName;
@property (nonatomic, readonly, strong) NSString *middleName;
@property (nonatomic, readonly, strong) NSString *lastName;
@property (nonatomic, readonly, strong) NSString *suffix;
@property (nonatomic, readonly, strong) NSString *fullName;
@property (nonatomic, readonly, strong) NSDate *lastModified;
@property (nonatomic, readonly, strong) NSURL *resourceURI;
@property (nonatomic, readonly, strong) NSArray *urls;
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;
@property (nonatomic, readonly, strong) RCListObject *comics;
@property (nonatomic, readonly, strong) RCListObject *stories;
@property (nonatomic, readonly, strong) RCListObject *series;
@property (nonatomic, readonly, strong) RCListObject *events;

@end
