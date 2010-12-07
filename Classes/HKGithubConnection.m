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

#import "HKGithubConnection.h"
#import "JSON.h"

static NSString * const GithubAPIHTTPURLString = @"http://github.com/api/v2/";
static NSString * const GithubAPIHTTPSURLString = @"https://github.com/api/v2/";
static NSString * const GithubAPIFormatString = @"json";

@implementation HKGithubConnection

+ (NSDictionary *)makeAPIRequest:(NSString *)apiQuery error:(NSError **)error {
	NSDictionary *apiData = nil;
	NSMutableString *urlString = [[NSMutableString alloc] init];
	if (HKUseSecureAPI()) {
		[urlString appendString:GithubAPIHTTPSURLString];
	} else {
		[urlString appendString:GithubAPIHTTPURLString];
	}
	[urlString appendFormat:@"%@", GithubAPIFormatString];
	[urlString appendString:apiQuery];
	
	NSURL *apiQueryURL = [NSURL URLWithString:urlString];
	
	HKGithubAPI *githubApi = HKGetGithubAPI(NULL);
	NSURLCredential *credential = [NSURLCredential credentialWithUser:githubApi.username 
															 password:githubApi.apiKey != nil ? [githubApi passwordWithToken] : githubApi.password
														  persistence:NSURLCredentialPersistenceForSession];
	NSURLProtectionSpace *protectionSpace = [[NSURLProtectionSpace alloc] initWithHost:[apiQueryURL host] 
																				  port:0
																			  protocol:[apiQueryURL scheme]
																				 realm:nil
																  authenticationMethod:NSURLAuthenticationMethodHTTPBasic];
	[[NSURLCredentialStorage sharedCredentialStorage] setDefaultCredential:credential 
														forProtectionSpace:protectionSpace];
	
	NSURLRequest *request = [NSURLRequest requestWithURL:apiQueryURL];
	NSURLResponse *response;
	NSError *connectionError;
	NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&connectionError];
	if (responseData != nil) {
		NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
		SBJsonParser *jsonParser = [[SBJsonParser alloc] init];
		apiData = [jsonParser objectWithString:responseString];
		[responseString release];
		[jsonParser release];
		
		if ([apiData objectForKey:@"error"]) {
			NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:[apiData objectForKey:@"error"] forKey:NSLocalizedFailureReasonErrorKey];
			if (error != NULL) {
				*error = [NSError errorWithDomain:HKErrorDomain code:HKApiErrorOccurred userInfo:errorInfo];
			}
		}
	}
	
	
	[urlString release];
	[protectionSpace release];
	
	return apiData;
}

@end
