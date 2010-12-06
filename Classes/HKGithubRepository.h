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
 This object represents a GitHub repository retrieved from the API. For
 definitions of the properties consult the Github API documentation.
 
 @see https://develop.github.com/p/repo.html
 */
@interface HKGithubRepository : NSObject <HKGithubAPIObject> {
	@private
	NSString *_name, *_owner, *_homepage, *_repositoryUrl, *_description, *_source, *_parent, *_pushedAt, *_createdAt;
	NSUInteger _openIssuesCount, _watchersCount, _forkCount;
	BOOL _private, _fork, _hasWiki, _hasIssues, _hasDownloads;
}

@property (nonatomic,retain) NSString *name;
@property (nonatomic,retain) NSString *owner;
@property (nonatomic,retain) NSString *homepage;
@property (nonatomic,retain) NSString *repositoryUrl;
@property (nonatomic,retain) NSString *description;
@property (nonatomic,retain) NSString *source;
@property (nonatomic,retain) NSString *parent;
@property (nonatomic,retain) NSString *pushedAt;
@property (nonatomic,retain) NSString *createdAt;
@property (nonatomic,assign) NSUInteger openIssuesCount;
@property (nonatomic,assign) NSUInteger watchersCount;
@property (nonatomic,assign) NSUInteger forkCount;
@property (nonatomic,assign) BOOL private;
@property (nonatomic,assign) BOOL fork;
@property (nonatomic,assign) BOOL hasWiki;
@property (nonatomic,assign) BOOL hasIssues;
@property (nonatomic,assign) BOOL hasDownloads;

@end
