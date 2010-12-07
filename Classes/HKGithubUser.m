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

#import "HKGithubUser.h"


@implementation HKGithubUser

@synthesize userId = _userId, publicGistCount = _publicGistCount, publicRepoCount = _publicRepoCount, totalPrivateRepoCount = _totalPrivateRepoCount, collaborators = _collaborators, ownedPrivateRepoCount = _ownedPrivateRepoCount, privateGistCount = _privateGistCount; 
@synthesize login = _login, name = _name, company = _company, location = _location, email = _email, blog = _blog;
@synthesize diskUsage = _diskUsage;
@synthesize authenticated = _authenticated;

#pragma mark -
#pragma mark Initialisation methods

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if ((self = [super init])) {
		_userId = [[dictionary objectForKey:@"id"] copy];
		_login = [[dictionary objectForKey:@"login"] copy];
		_name = [[dictionary objectForKey:@"name"] copy];
		_company = [[dictionary objectForKey:@"company"] copy];
		_location = [[dictionary objectForKey:@"location"] copy];
		_email = [[dictionary objectForKey:@"email"] copy];
		_blog = [[dictionary objectForKey:@"blog"] copy];
		_diskUsage = [[dictionary objectForKey:@"diskUsage"] copy];
		_publicGistCount = [[dictionary objectForKey:@"public_gist_count"] integerValue];
		_publicRepoCount = [[dictionary objectForKey:@"public_repo_count"] integerValue];
		_totalPrivateRepoCount = [[dictionary objectForKey:@"total_private_repo_count"] integerValue];
		_collaborators = [[dictionary objectForKey:@"collaborators"] integerValue];
		_ownedPrivateRepoCount = [[dictionary objectForKey:@"owned_private_repo_count"] integerValue];
		_privateGistCount = [[dictionary objectForKey:@"private_gist_count"] integerValue];
		_authenticated = [[dictionary objectForKey:@"authenticated"] boolValue];
	}
	
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@: %@", [self class], _login];
}

#pragma mark -
#pragma mark Memory management methods

- (void)dealloc {
	[_login release];
	[_name release];
	[_company release];
	[_location release];
	[_email release];
	[_blog release];
	[_userId release];
	[_diskUsage release];
	[super dealloc];
}

@end
