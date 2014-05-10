//
//  RCCharacterObject.h
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

 RCCharacterObject class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"
#import "RCURLObject.h"

/*!
 @class

 This class is a object representation of a Character resource.
 */
@interface RCCharacterObject : RCObject

/*!
 @property

 This property gets the unique identifier of the resource.
 */
@property (nonatomic, readonly, strong) NSNumber *identifier;

/*!
 @property

 This property gets the name of the resource.
 */
@property (nonatomic, readonly, strong) NSString *name;

/*!
 @property

 This property gets the short bio or description of the resource.
 */
@property (nonatomic, readonly, strong) NSString *bio;

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

 This property gets the list of comics summaries which feature the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *comics;

/*!
 @property

 This property gets the list of story summaries in which the resource appears.
 */
@property (nonatomic, readonly, strong) RCListObject *stories;

/*!
 @property

 This property gets the list of event summaries in which the resource appears.
 */
@property (nonatomic, readonly, strong) RCListObject *events;

/*!
 @property

 This property gets the list of series summaries in which the resource appears.
 */
@property (nonatomic, readonly, strong) RCListObject *series;

@end
