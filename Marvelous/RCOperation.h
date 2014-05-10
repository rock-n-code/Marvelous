//
//  RCOperation.h
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

 RCOperation class.

 @author Javier Cicchelli (\@monsieur_rock)

 @copyright 2014, Rock & Code released under MIT License. See the LICENSE file for more information.

 @version 0.7.3
 */

#import <Foundation/Foundation.h>

#import "RCOperationErrors.h"
#import "RCOperationErrorCodes.h"

/*!
 @class

 This class is an base class that extends the NSOperation abstract class and it is capable to handle its execution in an either concurrent and non-concurrent manner.
 */
@interface RCOperation : NSOperation

/*!
 @property

 This property sets and gets the boolean value which indicates whether the operation runs asynchronously.
 */
@property (nonatomic) BOOL isConcurrent;

/*!
 @property

 This property sets and gets the boolean value which indicates whether the operation is currently executing.
 */
@property (nonatomic) BOOL isExecuting;

/*!
 @property

 This property sets and gets the boolean value which indicates whether the operation has been cancelled.
 */
@property (nonatomic) BOOL isCancelled;

/*!
 @property

 This property sets and gets the boolean value which indicates whether the operation is done executing.
 */
@property (nonatomic) BOOL isFinished;

/*!
 @property

 This property gets an error object which was returned by the operation if any.
 */
@property (nonatomic, readonly, strong) NSError *error;

/*!
 @method
 
 This method performs a non-concurrent task.
 */
- (void)main;

/*!
 @method

 This method begins the execution of a concurrent task.
 */
- (void)start;

/*!
 @method

 This method advices the operation object that it should stop executing the task.
 */
- (void)cancel;

/*!
 @method

 This method finish the execution of the task.
 */
- (void)finish;

/*!
 @method

 This method define an error object with a given error code and a dictionary containing relevant information about this error.
 
 @param code An integer value that represent the error code
 @param userInfo A dictionary that contains relevant information about the error
 */
- (void)errorWithCode:(NSInteger)code andUserInfo:(NSDictionary *)userInfo;

@end
