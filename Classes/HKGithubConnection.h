/*!
 @file
 
 @author Marcus Ramsden
 @date 04/12/2010
 
 Copyright 2010 Marcus Ramsden
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/license/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "HubKit.h"


/*!
 This class is responsible for handling requests and responses from
 the Github API.
 */
@interface HKGithubConnection : NSObject {

}

/*!
 Make a request to the Github API.
 
 @param apiQuery This is the specifics of the API query you want to make
 including the method to call and any parameters.
 @param error Any errors 
 */
+ (NSDictionary *)makeAPIRequest:(NSString *)apiQuery error:(NSError **)error;

@end
