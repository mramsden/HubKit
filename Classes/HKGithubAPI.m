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

#import "HKGithubAPI.h"
#import "HKGithubConnection.h"


@implementation HKGithubAPI

@synthesize username = _username, password = _password, apiKey = _apiKey;

#pragma mark -
#pragma mark Initialisation methods

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
	if ((self = [super init])) {
		_username = [username retain];
		_password = [password retain];
	}
	
	return self;
}

- (id)initWithUsername:(NSString *)username apiKey:(NSString *)apiKey {
	if ((self = [super init])) {
		_username = [username retain];
		_apiKey = [apiKey retain];
	}
	
	return self;
}

#pragma mark -
#pragma mark Public methods

- (HKGithubUser *)authenticatedUser {
	if (authenticatedUser == nil) {
		NSDictionary *userData = [HKGithubConnection makeAPIRequest:[NSString stringWithFormat:@"/user/show/%@", _username] error:nil];
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
