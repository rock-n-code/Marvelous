//
//  RCSeriesFilter.h
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

 RCSeriesFilter class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCFilter.h"
#import "RCIssueFormatCodes.h"
#import "RCFrequencyTypeCodes.h"

/*!
 @class

 This class defines the properties a filter could use to filter Series resources.
 */
@interface RCSeriesFilter : RCFilter

/*!
 @property

 This property sets and gets the series title the filter use to search for Series resources which match this specified title.
 */
@property (nonatomic, strong) NSString *title;

/*!
 @property

 This property sets and gets the series title the filter use to search for Series resources that begin with this specified string.
 */
@property (nonatomic, strong) NSString *titleStartsWith;

/*!
 @property

 This property sets and gets the series year the filter use to search for Series resources which match this specified start year.
 */
@property (nonatomic, strong) NSNumber *startYear;

/*!
 @property

 This property sets and gets the list of comic identifiers (represented as NSNumber objects) the filter use to search for Series resources which contain the specified comics.
 */
@property (nonatomic, strong) NSArray *comics;

/*!
 @property

 This property sets and gets the list of story identifiers (represented as NSNumber objects) the filter use to search for Series resources which contain the specified stories.
 */
@property (nonatomic, strong) NSArray *stories;

/*!
 @property

 This property sets and gets the list of event identifiers (represented as NSNumber objects) the filter use to search for Series resources that take place during the specified events.
 */
@property (nonatomic, strong) NSArray *events;

/*!
 @property

 This property sets and gets the list of creator identifiers (represented as NSNumber objects) the filter use to search for Series resources which feature work by the specified creators.
 */
@property (nonatomic, strong) NSArray *creators;

/*!
 @property

 This property sets and gets the list of character identifiers (represented as NSNumber objects) the filter use to search for Series resources which feature the specified characters.
 */
@property (nonatomic, strong) NSArray *characters;

/*!
 @property

 This property sets and gets the series frequency type value the filter use to search for Series resources by this issue frequency type.
 */
@property (nonatomic) RCFrequencyTypeCodes seriesType;

/*!
 @property

 This property sets and gets the list of RCIssueFormatCodes values (represented as NSNumber objects) the filter use to search for Series resources which contain one or more comics with the specified formats.
 */
@property (nonatomic, strong) NSArray *contains;

@end
