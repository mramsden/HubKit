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

#import "HKGithubAPI.h"
#import "HKGithubConnection.h"
#import "HubKitInternals.h"


static HKGithubAPI *_SharedGithubAPI = nil;

@implementation HKGithubAPI

@synthesize username = _username, password = _password, apiKey = _apiKey;

#pragma mark -
#pragma mark Initialisation methods

+ (HKGithubAPI *)sharedGithubAPI {
	return _SharedGithubAPI;
}

+ (HKGithubAPI *)sharedGithubAPIWithUsername:(NSString *)username apiKey:(NSString *)apiKey {
	[_SharedGithubAPI release];
	_SharedGithubAPI = [[HKGithubAPI alloc] init];
	_SharedGithubAPI.username = username;
	_SharedGithubAPI.apiKey = apiKey;
	
	return _SharedGithubAPI;
}

+ (HKGithubAPI *)sharedGithubAPIWithUsername:(NSString *)username password:(NSString *)password {
	[_SharedGithubAPI release];
	_SharedGithubAPI = [[HKGithubAPI alloc] init];
	_SharedGithubAPI.username = username;
	_SharedGithubAPI.password = password;
	
	return _SharedGithubAPI;
}

- (id)init {
	if ((self = [super init])) {
		_useSecureAPI = [[HubKit sharedConfigurationManager] useSecureConnection];
	}
	
	return self;
}

#pragma mark -
#pragma mark Accessor methods

- (BOOL)usingSecureAPI {
	return _useSecureAPI;
}

#pragma mark -
#pragma mark Public methods

- (HKGithubUser *)authenticatedUser:(NSError **)error {
	if (authenticatedUser == nil) {
		NSDictionary *userData = [[HKGithubConnection makeAPIRequest:[NSString stringWithFormat:@"/user/show/%@", _username] error:nil] objectForKey:@"user"];
		if (userData != nil) {
			authenticatedUser = [[HKGithubUser alloc] initWithDictionary:userData];
		}
	}
	
	return authenticatedUser;
}

- (NSString *)passwordWithToken {
	NSString *passwordWithToken = nil;
	if (_apiKey != nil) {
		passwordWithToken = [NSString stringWithFormat:@"token/%@", _apiKey];
	}
	
	return passwordWithToken;
}

#pragma mark -
#pragma mark Memory management methods

- (void)dealloc {
	[_username release];
	[_password release];
	[_apiKey release];
	[super dealloc];
}

@end
