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
 @enum RCImageSizeCodes
 This enumeration defines the available image sizes use by a @p RCImageObject object to produce a URL to a customised image.
 @constant RCImageSizeCodeSmall Size on portrait mode: 50x75px, on standard mode: 65x45px, on landscape mode: 120x90px
 @constant RCImageSizeCodeMedium Size on portrait mode: 100x150px, on standard mode: 100x100px, on landscape mode: 175x130px
 @constant RCImageSizeCodeLarge Size not supported on portrait mode, on standard mode: 140x140px, on landscape: 190x140px
 @constant RCImageSizeCodeXLarge Size on portrait mode: 150x225px, on standard mode: 200x200px, on landscape mode: 270x200px
 @constant RCImageSizeCodeAmazing Size not supported on portrait mode, on standard mode: 180x180px, on landscape: 250x156px
 @constant RCImageSizeCodeFantastic Size on portrait mode: 168x252px, on standard: 250x250px, not supported on landscape mode
 @constant RCImageSizeCodeUncanny Size on portrait mode: 300x450px, not supported on standard and landscape modes
 @constant RCImageSizeCodeIncredible Size on portrait mode: 216x324px, not supported on standard mode, on landscape: 464x261px
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