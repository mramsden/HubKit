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

#import "HubKit.h"

NSString *HKErrorDomain = @"HubKitErrorDomain";

static NSString *_username = nil;
static NSString *_password = nil;
static NSString *_apiKey = nil;
static HKGithubAPI *gitHubAPI = nil;

BOOL useSecureAPI = YES;

void HKSetUseSecureAPI(BOOL secureAPI) {
	useSecureAPI = secureAPI;
}

BOOL HKUseSecureAPI() {
	return useSecureAPI;
}

void HKSetUsername(NSString *username) {
	[_username release];
	_username = [username retain];
}

void HKSetPassword(NSString *password) {
	[_password release];
	_password = [password retain];
}

void HKSetApiKey(NSString *apiKey) {
	[_apiKey release];
	_apiKey = [apiKey retain];
}

HKGithubAPI * HKGetGithubAPI(NSError **error) {
	if (gitHubAPI == nil) {
		if (_username != nil) {
			if (_apiKey != nil) {
				gitHubAPI = [[HKGithubAPI alloc] initWithUsername:_username apiKey:_apiKey];
			} else if (_password != nil) {
				gitHubAPI = [[HKGithubAPI alloc] initWithUsername:_username password:_password];
			} else {
				if (error != NULL) {
					NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:
											   NSLocalizedString(@"NO_API_KEY_OR_PASSWORD_SUPPLIED", @"No apiKey or password was supplied for HubKit to use."), NSLocalizedDescriptionKey,
											   nil];
					*error = [NSError errorWithDomain:HKErrorDomain code:HKNoApiKeyOrPasswordSupplied userInfo:errorInfo];
				}
			}
		} else {
			if (error != NULL) {
				NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:
										   NSLocalizedString(@"NO_USERNAME_SUPPLIED", @"No username was supplied for HubKit to use."), NSLocalizedDescriptionKey,
										   nil];
				*error = [NSError errorWithDomain:HKErrorDomain code:HKNoUsernameSupplied userInfo:errorInfo];
			}
		}
	}
	
	return gitHubAPI;
}

void HKGithubAPIFree() {
	[gitHubAPI release];
	gitHubAPI = nil;
}