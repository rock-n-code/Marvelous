//
//  RCIssueFormatCodes.h
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

 RCIssueFormatCodes enumeration.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

/*!
 @enum

 This enumeration defines the issue formats available to use by the "format" property of any RCComicsFilter or RCSeriesFilter object.

 @constant RCIssueFormatCodeUndefined Undefined issue format
 @constant RCIssueFormatCodeComic Comic issue format
 @constant RCIssueFormatCodeMagazine Magazine issue format
 @constant RCIssueFormatCodeTradePaperback Trade paperback issue format
 @constant RCIssueFormatCodeHardcover Hardcover issue format
 @constant RCIssueFormatCodeDigest Digest issue format
 @constant RCIssueFormatCodeGraphicNovel Graphic novel issue format
 @constant RCIssueFormatCodeDigitalComic Digital comic issue format
 @constant RCIssueFormatCodeInfiniteComic Infinite comic issue format
 */
typedef enum {
	RCIssueFormatCodeUndefined = 0,
	RCIssueFormatCodeComic,
	RCIssueFormatCodeMagazine,
	RCIssueFormatCodeTradePaperback,
	RCIssueFormatCodeHardcover,
	RCIssueFormatCodeDigest,
	RCIssueFormatCodeGraphicNovel,
	RCIssueFormatCodeDigitalComic,
	RCIssueFormatCodeInfiniteComic
} RCIssueFormatCodes;