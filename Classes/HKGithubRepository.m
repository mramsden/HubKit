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

#import "HKGithubRepository.h"


@implementation HKGithubRepository

@synthesize name = _name, owner = _owner, homepage = _homepage, repositoryUrl = _repositoryUrl, description = _description, source = _source, parent = _parent, pushedAt = _pushedAt, createdAt = _createdAt;
@synthesize openIssuesCount = _issuesCount, watchersCount = _watchersCount, forkCount = _forkCount;
@synthesize private = _private, fork = _fork, hasWiki = _wiki, hasIssues = _hasIssues, hasDownloads = _hasDownloads;

- (id)initWithDictionary:(NSDictionary *)dictionary {
	if ((self = [super init])) {
		
	}
	
	return self;
}

- (void)dealloc {
	[_name release];
	[_owner release];
	[_homepage release];
	[_repositoryUrl release];
	[_description release];
	[_source release];
	[_parent release];
	[_pushedAt release];
	[_createdAt release];
	[super dealloc];
}

@end
