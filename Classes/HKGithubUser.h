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
#import "HKGithubAPIObject.h"

/*!
 This object represents a GitHub user retrieved from the API. For
 definitions of the properties consult the Github API documentation.
 
 @see https://develop.github.com/p/users.html
 */
@interface HKGithubUser : NSObject <HKGithubAPIObject> {
	@private
	NSUInteger _publicGistCount, _publicRepoCount, _totalPrivateRepoCount, _collaborators, _ownedPrivateRepoCount, _privateGistCount;
	NSString *_login, *_name, *_company, *_location, *_email, *_blog;
	NSNumber *_userId, *_diskUsage;
	BOOL _authenticated;
}

/*!
 This property holds the value of the id field returned from
 the user API.
 */
@property (nonatomic,readonly) NSNumber *userId;

/*!
 This property indicates if this is the user authenticated with
 through the API.
 */
@property (nonatomic,readonly) BOOL authenticated;

@property (nonatomic,readonly) NSString *login;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *company;
@property (nonatomic,retain) NSString *location;
@property (nonatomic,retain) NSString *email;
@property (nonatomic,retain) NSString *blog;
@property (nonatomic,readonly) NSUInteger publicGistCount;
@property (nonatomic,readonly) NSUInteger publicRepoCount;
@property (nonatomic,readonly) NSUInteger totalPrivateRepoCount;
@property (nonatomic,readonly) NSUInteger collaborators;
@property (nonatomic,readonly) NSNumber *diskUsage;
@property (nonatomic,readonly) NSUInteger ownedPrivateRepoCount;
@property (nonatomic,readonly) NSUInteger privateGistCount;

@end
