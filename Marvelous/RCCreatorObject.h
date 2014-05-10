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

/*!
 @header

 RCCreatorObject class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"

/*!
 @class

 This class is a object representation of a Creator resource.
 */
@interface RCCreatorObject : RCObject

/*!
 @property

 This property gets the unique identifier of the resource.
 */
@property (nonatomic, readonly, strong) NSNumber *identifier;

/*!
 @property

 This property gets the first name of the resource.
 */
@property (nonatomic, readonly, strong) NSString *firstName;

/*!
 @property

 This property gets the middle name of the resource.
 */
@property (nonatomic, readonly, strong) NSString *middleName;

/*!
 @property

 This property gets the last name of the resource.
 */
@property (nonatomic, readonly, strong) NSString *lastName;

/*!
 @property

 This property gets the suffix or honorific for the resource.
 */
@property (nonatomic, readonly, strong) NSString *suffix;

/*!
 @property

 This property gets the full name identifier of the resource.
 
 Its value is a space-separated concatenation of the first name, middle name, last name and suffix.
 */
@property (nonatomic, readonly, strong) NSString *fullName;

/*!
 @property

 This property gets the date the resource was most recently modified.
 */
@property (nonatomic, readonly, strong) NSDate *lastModified;

/*!
 @property

 This property gets the canonical URL identifier for the resource.
 */
@property (nonatomic, readonly, strong) NSURL *resourceURI;

/*!
 @property

 This property gets the set of public web site URLs for the resource.
 */
@property (nonatomic, readonly, strong) NSArray *urls;

/*!
 @property

 This property gets the representative image for the resource.
 */
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;

/*!
 @property

 This property gets the list of series summaries which feature work by the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *series;

/*!
 @property

 This property gets the list of story summaries which feature work by the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *stories;

/*!
 @property

 This property gets the list of comic summaries which feature work by the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *comics;

/*!
 @property

 This property gets the list of event summaries which feature work by the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *events;

@end
