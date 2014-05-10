//
//  RCBooleanValueCodes.h
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

 RCBooleanValueCodes enumeration.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.
 
 @version 0.7.3
 */

/*!
 @enum
 
 This enumeration defines a tri-state boolean value used by the "noVariants" and "hasDigitalIssue" properties of any RCComicsFilter object.

 @constant RCBooleanValueCodeUndefined Undefined state
 @constant RCBooleanValueCodeTrue True state
 @constant RCBooleanValueCodeFalse False state
 */
typedef enum {
	RCBooleanValueCodeUndefined = 0,
	RCBooleanValueCodeTrue,
	RCBooleanValueCodeFalse
} RCBooleanValueCodes;