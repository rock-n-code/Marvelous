//
//  RCImageObject.h
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

 RCImageObject class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCObject.h"
#import "RCImageAspectRatioCodes.h"
#import "RCImageSizeCodes.h"

/*!
 @class

 This class is an image representation for a particular resource.
 */
@interface RCImageObject : RCObject

/*!
 @property

 This property gets the directory path to an image.
 */
@property (nonatomic, readonly, strong) NSString *basePath;

/*!
 @property

 This property gets the file extension for an image.
 */
@property (nonatomic, readonly, strong) NSString *extension;

/*!
 @property

 This property gets the URL to a full size image.
 */
@property (nonatomic, readonly, strong) NSURL *fullSizeURL;

/*!
 @property

 This property gets the URL to a full size image which is constrained to 500px wide.
 */
@property (nonatomic, readonly, strong) NSURL *detailURL;

/*!
 @method

 This method creates a URL to an image based on the given aspect ratio and size.
 
 @param aspectRatio The aspect ratio of the image to retrieve
 @param size The size of the image to retrieve
 
 @return A full URL to an image (including scheme, domain and path)
 */
- (NSURL *)urlForAspectRatio:(RCImageAspectRatioCodes)aspectRatio andSize:(RCImageSizeCodes)size;

@end
