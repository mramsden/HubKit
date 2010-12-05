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

#if 1

#import "HKGithubAPI.h"
#import "HKGithubUser.h"
#import "HKGithubConnection.h"

#else

#import <HKGithubAPI.h>
#import <HKGithubUser.h>
#import <HKGithubConnection.h>

#endif

extern NSString *HKErrorDomain;

typedef enum {
	HKNoUsernameSupplied,
	HKNoApiKeyOrPasswordSupplied,
	HKApiErrorOccurred
} HKErrorCode;

/*!
 Set this to YES for all requests to the API to be made over HTTPS. If
 set to NO then all requests will be made over HTTP.
 
 @param secureAPI This is the desired setting.
 */
void HKSetUseSecureAPI(BOOL secureAPI);

/*!
 Indicates whether requests to the API should be made using HTTPS or
 just HTTP.
 
 @return YES indicates HTTPS should be used, NO indicates to use HTTP.
 */
BOOL HKUseSecureAPI();

/*!
 Sets the username that all requests will use. This is not necessarily
 required to run requests as some do not require authentication.
 
 @param username This is the username to use.
 */
void HKSetUsername(NSString *username);

/*!
 Sets the password that all requests will use. This is not necessarily
 requiired to run requests as some do not require authentication.
 
 @param password This is the password to use.
 */
void HKSetPassword(NSString *password);

/*!
 Sets the apikey that all requests will use. This is not necessarily
 required to run requests as some do not require authentication. If you
 set both the password and the apikey then the apikey will be used in
 preference to the password.
 
 @param apiKey This is the apiKey to use.
 */
void HKSetApiKey(NSString *apiKey);

/*!
 Retrieves the initialised GitHubAPI object using the supplied username
 and password or apiKey. Preference will be given to the apiKey over the
 password if both are supplied.
 
 @param error This is a pointer to an NSError object which will have a
 message and error code if there was a problem initialising the GitHubAPI
 object.
 @return The initialised GithubAPI object.
 */
HKGithubAPI * HKGetGithubAPI(NSError **error);
