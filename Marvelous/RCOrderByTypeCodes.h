//
//  RCOrderByTypeCodes.h
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

 RCOrderByTypeCodes enumeration.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.
 
 @version 0.7.3
 */

/*!
 @enum

 This enumeration defines the order by code types to use with any RCFilter object.
 
 @constant RCOrderByTypeCodeUndefined Undefined order by type
 @constant RCOrderByTypeCodeIdentifierAscending Order by identifier in ascending order
 @constant RCOrderByTypeCodeIdentifierDescending Order by identifier in descending order
 @constant RCOrderByTypeCodeFirstNameAscending Order by first name in ascending order
 @constant RCOrderByTypeCodeFirstNameDescending Order by first name in descending order
 @constant RCOrderByTypeCodeMiddleNameAscending Order by middle name in ascending order
 @constant RCOrderByTypeCodeMiddleNameDescending Order by middle name in descending order
 @constant RCOrderByTypeCodeLastNameAscending Order by last name in ascending order
 @constant RCOrderByTypeCodeLastNameDescending Order by last name in descending order
 @constant RCOrderByTypeCodeSuffixAscending Order by suffix in ascending order
 @constant RCOrderByTypeCodeSuffixDescending Order by suffix in descending order
 @constant RCOrderByTypeCodeNameAscending Order by name in ascending order
 @constant RCOrderByTypeCodeNameDescending Order by name in descending order
 @constant RCOrderByTypeCodeTitleAscending Order by title in ascending order
 @constant RCOrderByTypeCodeTitleDescending Order by title in descending order
 @constant RCOrderByTypeCodeDateModifiedAscending Order by the modified date in ascending order
 @constant RCOrderByTypeCodeDateModifiedDescending Order by the modified date in descending order
 @constant RCOrderByTypeCodeStartDateAscending Order by start date in ascending order
 @constant RCOrderByTypeCodeStartDateDescending Order by start date in descending order
 @constant RCOrderByTypeCodeStartYearAscending Order by start year in ascending order
 @constant RCOrderByTypeCodeStartYearDescending Order by start year in descending order
 @constant RCOrderByTypeCodeFinalOrderCutoffDateAscending Order by final order cutoff date in ascending order
 @constant RCOrderByTypeCodeFinalOrderCutoffDateDescending Order by final order cutoff date in descending order
 @constant RCOrderByTypeCodeOnSaleDateAscending Order by onsale date in ascending order
 @constant RCOrderByTypeCodeOnSaleDateDescending Order by onsale date in descending order
 @constant RCOrderByTypeCodeIssueNumberAscending Order by issue number in ascending order
 @constant RCOrderByTypeCodeIssueNumberDescending Order by issue number in descending order
 */
typedef enum {
	RCOrderByTypeCodeUndefined = 0,
	RCOrderByTypeCodeIdentifierAscending,
	RCOrderByTypeCodeIdentifierDescending,
	RCOrderByTypeCodeFirstNameAscending,
	RCOrderByTypeCodeFirstNameDescending,
	RCOrderByTypeCodeMiddleNameAscending,
	RCOrderByTypeCodeMiddleNameDescending,
	RCOrderByTypeCodeLastNameAscending,
	RCOrderByTypeCodeLastNameDescending,
	RCOrderByTypeCodeSuffixAscending,
	RCOrderByTypeCodeSuffixDescending,
	RCOrderByTypeCodeNameAscending,
	RCOrderByTypeCodeNameDescending,
	RCOrderByTypeCodeTitleAscending,
	RCOrderByTypeCodeTitleDescending,
	RCOrderByTypeCodeDateModifiedAscending,
	RCOrderByTypeCodeDateModifiedDescending,
	RCOrderByTypeCodeStartDateAscending,
	RCOrderByTypeCodeStartDateDescending,
	RCOrderByTypeCodeStartYearAscending,
	RCOrderByTypeCodeStartYearDescending,
	RCOrderByTypeCodeFinalOrderCutoffDateAscending,
	RCOrderByTypeCodeFinalOrderCutoffDateDescending,
	RCOrderByTypeCodeOnSaleDateAscending,
	RCOrderByTypeCodeOnSaleDateDescending,
	RCOrderByTypeCodeIssueNumberAscending,
	RCOrderByTypeCodeIssueNumberDescending,
} RCOrderByTypeCodes;