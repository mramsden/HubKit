/*!
 @file
 
 @author Marcus Ramsden
 @date 04/12/2010
 
 Copyright 2010 Marcus Ramsden
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import <Foundation/Foundation.h>
#import "HKGithubUser.h"


/*!
 This is the main object for communicating with the Github API.
 */
@interface HKGithubAPI : NSObject {
	@private
	NSString *_username;
	NSString *_password;
	NSString *_apiKey;
	HKGithubUser *authenticatedUser;
}

/*!
 The username being used by this GitHubAPI object.
 */
@property (nonatomic,readonly) NSString *username;

/*!
 The password being used by this GitHubAPI object.
 */
@property (nonatomic,readonly) NSString *password;

/*!
 The apiKey being used by this GitHubAPI object.
 */
@property (nonatomic,readonly) NSString *apiKey;

/*!
 Initialise the GitHubAPI object with the supplied username and password.
 
 @param username The username to use.
 @param password The password to use.
 @return The initialised GitHubAPI object.
 */
- (id)initWithUsername:(NSString *)username password:(NSString *)password;

/*!
 Initialise the GitHubAPI object with the supplied username and apiKey.
 
 @param username The username to use.
 @param apiKey The apiKey to use.
 @return The initialised GitHubAPI object.
 */
- (id)initWithUsername:(NSString *)username apiKey:(NSString *)apiKey;

- (HKGithubUser *)authenticatedUser;

- (NSString *)passwordWithToken;

@end
