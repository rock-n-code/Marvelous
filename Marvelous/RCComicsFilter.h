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

/*!
 @header

 RCComicsFilter class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCFilter.h"
#import "RCIssueFormatCodes.h"
#import "RCIssueTypeCodes.h"
#import "RCBooleanValueCodes.h"
#import "RCDateDescriptorCodes.h"

/*!
 @class

 This class defines the properties a filter could use to filter Comics resources.
 */
@interface RCComicsFilter : RCFilter

/*!
 @property

 This property sets and gets the issue format value the filter use to search for Comics resources by this issue format.
 */
@property (nonatomic) RCIssueFormatCodes format;

/*!
 @property

 This property sets and gets the issue format type value the filter use to search for Comics resources by this issue format type.
 */
@property (nonatomic) RCIssueTypeCodes formatType;

/*!
 @property

 This property sets and gets the boolean value the filter use to exclude variant Comics resources (alternate covers, secondary printings, director's cuts, etc.) from the result set.
 */
@property (nonatomic) RCBooleanValueCodes noVariants;

/*!
 @property

 This property sets and gets the date range value the filter use to search for Comics resources within the predefined date range.
 */
@property (nonatomic) RCDateDescriptorCodes dateDescriptor;

/*!
 @property

 This property sets and gets the comics title the filter use to search for Comics resources which match this specified title.
 */
@property (nonatomic, strong) NSString *title;

/*!
 @property

 This property sets and gets the comics title the filter use to search for Comics resources that begin with this specified string.
 */
@property (nonatomic, strong) NSString *titleStartsWith;

/*!
 @property

 This property sets and gets the number os issue the filter use to search for Comics resources within match the specified issue number.
 */
@property (nonatomic, strong) NSNumber *issueNumber;

/*!
 @property

 This property sets and gets the comics year the filter use to search for Comics resources which match this specified start year.
 */
@property (nonatomic, strong) NSNumber *startYear;

/*!
 @property

 This property sets and gets the list of 2 (two) dates (represented as NSDate objects) the filter use to search for Comics resources within the predefined date range.
 */
@property (nonatomic, strong) NSArray *dateRange;

/*!
 @property

 This property sets and gets the diamond code the filter use to search for Comics resources by this specified code.
 */
@property (nonatomic, strong) NSString *diamondCode;

/*!
 @property

 This property sets and gets the digital comic identifier the filter use to search for Comics resources by this specified identifier.
 */
@property (nonatomic, strong) NSNumber *digitalIdentifier;

/*!
 @property

 This property sets and gets the UPC code the filter use to search for Comics resources by this specified code.
 */
@property (nonatomic, strong) NSString *upc;

/*!
 @property

 This property sets and gets the ISBN code the filter use to search for Comics resources by this specified code.
 */
@property (nonatomic, strong) NSString *isbn;

/*!
 @property

 This property sets and gets the EAN code the filter use to search for Comics resources by this specified code.
 */
@property (nonatomic, strong) NSString *ean;

/*!
 @property

 This property sets and gets the ISSN code the filter use to search for Comics resources by this specified code.
 */
@property (nonatomic, strong) NSString *issn;

/*!
 @property

 This property sets and gets the boolean value the filter use to search for Comics resources which are available digitally only.
 */
@property (nonatomic) RCBooleanValueCodes hasDigitalIssue;

/*!
 @property

 This property sets and gets the list of creator identifiers (represented as NSNumber objects) the filter use to search for Comics resources which feature work by the specified creators.
 */
@property (nonatomic, strong) NSArray *creators;

/*!
 @property

 This property sets and gets the list of character identifiers (represented as NSNumber objects) the filter use to search for Comics resources which feature the specified characters.
 */
@property (nonatomic, strong) NSArray *characters;

/*!
 @property

 This property sets and gets the list of series identifiers (represented as NSNumber objects) the filter use to search for Comics resources which are part of the specified series.
 */
@property (nonatomic, strong) NSArray *series;

/*!
 @property

 This property sets and gets the list of event identifiers (represented as NSNumber objects) the filter use to search for Comics resources which take place in the specified events.
 */
@property (nonatomic, strong) NSArray *events;

/*!
 @property

 This property sets and gets the list of story identifiers (represented as NSNumber objects) the filter use to search for Comics resources which contain the specified stories.
 */
@property (nonatomic, strong) NSArray *stories;

/*!
 @property

 This property sets and gets the list of character identifiers (represented as NSNumber objects) the filter use to search for Comics resources which the specified characters appear together.
 */
@property (nonatomic, strong) NSArray *sharedAppearances;

/*!
 @property

 This property sets and gets the list of creator identifiers (represented as NSNumber objects) the filter use to search for Comics resources which the specified creators worked together.
 */
@property (nonatomic, strong) NSArray *collaborators;

@end
