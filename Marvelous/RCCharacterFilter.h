//
//  RCCharacterFilter.h
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

 RCharacterFilter class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCFilter.h"

/*!
 @class

 This class defines the properties a filter could use to filter Characters resources.
 */
@interface RCCharacterFilter : RCFilter

/*!
 @property

 This property sets and gets the character name the filter use to search for Character resources which match this specified name.
 */
@property (nonatomic, strong) NSString *name;

/*!
 @property

 This property sets and gets the character name the filter use to search for Character resources that begin with this specified string.
 */
@property (nonatomic, strong) NSString *nameStartsWith;

/*!
 @property

 This property sets and gets the list of comic identifiers (represented as NSNumber objects) the filter use to search for Character resources which appear in the specified comics.
 */
@property (nonatomic, strong) NSArray *comics;

/*!
 @property

 This property sets and gets the list of series identifiers (represented as NSNumber objects) the filter use to search for Character resources which appear in the specified series.
 */
@property (nonatomic, strong) NSArray *series;

/*!
 @property

 This property sets and gets the list of event identifiers (represented as NSNumber objects) the filter use to search for Character resources which appear in the specified events.
 */
@property (nonatomic, strong) NSArray *events;

/*!
 @property

 This property sets and gets the list of story identifiers (represented as NSNumber objects) the filter use to search for Character resources which appear in the specified stories.
 */
@property (nonatomic, strong) NSArray *stories;

@end
