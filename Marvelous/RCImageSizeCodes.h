//
//  RCImageSizeCodes.h
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

 RCImageSizeCodes enumeration.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.
 
 @version 0.7.3
 */

/*!
 @enum

 This enumeration defines the available image sizes use by an RCImageObject object to produce a URL to a customised image.
 
 Please notice that the size definition varies depending the select aspect ratio.
 
 = RCImageSizeCodeSmall:

 --> on portrait: 50x75px

 --> on standard/square: 65x45px

 --> on landscape: 120x90px
 


 = RCImageSizeCodeMedium:

 --> portrait: 100x150px

 --> standard/square: 100x100px

 --> landscape: 175x130px


 
 = RCImageSizeCodeLarge:

 --> portrait: not supported

 --> standard/square: 140x140px

 --> landscape: 190x140px


 
 = RCImageSizeCodeXLarge:

 --> portrait: 150x225px

 --> standard/square: 200x200px

 --> landscape: 270x200px


 
 = RCImageSizeCodeAmazing:

 --> portrait: not supported

 --> standard/square: 180x180px

 --> landscape: 250x156px


 
 = RCImageSizeCodeFantastic:

 --> portrait: 168x252px

 --> standard/square: 250x250px

 --> landscape: not supported


 
 = RCImageSizeCodeUncanny:

 --> portrait: 300x450px

 --> standard/square: not supported

 --> landscape: not supported

 
 = RCImageSizeCodeIncredible:

 --> portrait: 216x324px

 --> standard/square: not supported

 --> landscape: 464x261px


 
 @constant RCImageSizeCodeSmall Small size code
 @constant RCImageSizeCodeMedium Medium size code
 @constant RCImageSizeCodeLarge Large size code
 @constant RCImageSizeCodeXLarge Extra large size code
 @constant RCImageSizeCodeAmazing Amazing size code
 @constant RCImageSizeCodeFantastic Fantastic size code
 @constant RCImageSizeCodeUncanny Uncanny size code
 @constant RCImageSizeCodeIncredible Incredible size code
 */
typedef enum {
	RCImageSizeCodeSmall = 0,
	RCImageSizeCodeMedium,
	RCImageSizeCodeLarge,
	RCImageSizeCodeXLarge,
	RCImageSizeCodeAmazing,
	RCImageSizeCodeFantastic,
	RCImageSizeCodeUncanny,
	RCImageSizeCodeIncredible
} RCImageSizeCodes;