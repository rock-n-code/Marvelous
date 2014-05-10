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

/*!
 @header

 RCComicsObject class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCObject.h"
#import "RCSummaryObject.h"
#import "RCImageObject.h"
#import "RCListObject.h"

/*!
 @class

 This class is a object representation of a Comic resource.
 */
@interface RCComicsObject : RCObject

/*!
 @property

 This property gets the unique identifier of the resource.
 */
@property (nonatomic, readonly, strong) NSNumber *identifier;

/*!
 @property

 This property gets the identifier of the digital comic representation of the resource.
 
 Its value will be 0 in case the resource is not available digitally.
 */
@property (nonatomic, readonly, strong) NSNumber *digitalIdentifier;

/*!
 @property

 This property gets the canonical title of the resource.
 */
@property (nonatomic, readonly, strong) NSString *title;

/*!
 @property

 This property gets the number of the issue in the series.
 
 Its value will be 0 for collection formats.
 */
@property (nonatomic, readonly, strong) NSNumber *issueNumber;

/*!
 @property

 This property gets the preferred description of the resource.
 */
@property (nonatomic, readonly, strong) NSString *summary;

/*!
 @property

 This property gets the description in case the issue is a variant (for example: an alternate cover, second printing, or director's cut)/
 */
@property (nonatomic, readonly, strong) NSString *variantDescription;

/*!
 @property

 This property gets the date the resource was most recently modified.
 */
@property (nonatomic, readonly, strong) NSDate *lastModified;

/*!
 @property

 This property gets the ISBN for the resource.
 
 Its value is only populated for collection formats.
 */
@property (nonatomic, readonly, strong) NSString *isbn;

/*!
 @property

 This property gets the UPC barcode number identifier for the resource.
 
 Its value is only populated for periodical formats.
 */
@property (nonatomic, readonly, strong) NSString *upc;

/*!
 @property

 This property gets the Diamond code for the resource.
 */
@property (nonatomic, readonly, strong) NSString *diamondCode;

/*!
 @property

 This property gets the EAN barcode for the resource.
 */
@property (nonatomic, readonly, strong) NSString *ean;

/*!
 @property

 This property gets the ISSN barcode for the resource.
 */
@property (nonatomic, readonly, strong) NSString *issn;

/*!
 @property

 This property gets the publication format of the resource.
 */
@property (nonatomic, readonly, strong) NSString *format;

/*!
 @property

 This property gets the number of story pages in the resource.
 */
@property (nonatomic, readonly, strong) NSNumber *pageCount;

/*!
 @property

 This property gets the set of descriptive text blurbs for the resource.
 */
@property (nonatomic, readonly, strong) NSArray *textObjects;

/*!
 @property

 This property gets the canonical URLidentifier for the resource.
 */
@property (nonatomic, readonly, strong) NSURL *resourceURI;

/*!
 @property

 This property gets the set of public web site URLs for the resource.
 */
@property (nonatomic, readonly, strong) NSArray *urls;

/*!
 @property

 This property gets the summary representation of the series to which the resource belongs.
 */
@property (nonatomic, readonly, strong) RCSummaryObject *series;

/*!
 @property

 This property gets the list of variant issues for the resource.
 
 It includes the "original" issue if the current issue is a variant.
 */
@property (nonatomic, readonly, strong) NSArray *variants;

/*!
 @property

 This property gets the list of collections which include the resource.
 
 Its value will generally be empty if the resource's format is a collection.
 */
@property (nonatomic, readonly, strong) NSArray *collections;

/*!
 @property

 This property gets the list of collected issues in the resource.
 
 Its value will generally be empty for periodical formats such as "comic" or "magazine".
 */
@property (nonatomic, readonly, strong) NSArray *collectedIssues;

/*!
 @property

 This property gets the list of key dates for the resource.
 */
@property (nonatomic, readonly, strong) NSArray *dates;

/*!
 @property

 This property gets the list of prices for the resource.
 */
@property (nonatomic, readonly, strong) NSArray *prices;

/*!
 @property

 This property gets the representative image for the resource.
 */
@property (nonatomic, readonly, strong) RCImageObject *thumbnail;

/*!
 @property

 This property gets the list of promotional associated with the resource.
 */
@property (nonatomic, readonly, strong) NSArray *images;

/*!
 @property

 This property gets the list of creator summaries associated with the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *creators;

/*!
 @property

 This property gets the list of character summaries which appear in the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *characters;

/*!
 @property

 This property gets the list of story summaries which appear in the resource.
 */
@property (nonatomic, readonly, strong) RCListObject *stories;

/*!
 @property

 This property gets the list of event summaries in which the resource appears.
 */
@property (nonatomic, readonly, strong) RCListObject *events;

@end
