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
	BOOL _useSecureAPI;
}

/*!
 The username being used by this GitHubAPI object.
 */
@property (nonatomic,retain) NSString *username;

/*!
 The password being used by this GitHubAPI object.
 */
@property (nonatomic,retain) NSString *password;

/*!
 The apiKey being used by this GitHubAPI object.
 */
@property (nonatomic,retain) NSString *apiKey;

/*!
 Indicates whether the secure API should be used or not. By default
 the secure API will be used. Changing this value will affect all
 subsequent requests made.
 */
@property (nonatomic,assign) BOOL useSecureAPI;

+ (HKGithubAPI *)sharedGithubAPI;

+ (HKGithubAPI *)sharedGithubAPIWithUsername:(NSString *)username password:(NSString *)password;

+ (HKGithubAPI *)sharedGithubAPIWithUsername:(NSString *)username apiKey:(NSString *)apiKey;

- (HKGithubUser *)authenticatedUser:(NSError **)error;

- (NSString *)passwordWithToken;

@end
