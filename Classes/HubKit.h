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

#if 1

#import "HubKitConfigurationManager.h"
#import "HKGithubAPI.h"
#import "HKGithubUser.h"
#import "HKGithubConnection.h"

#else

#import <HubKitConfigurationManager.h>
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

@interface HubKit : NSObject {
	
}

/*!
 Sets the default username which is injected into any created
 GithubAPI objects.
 
 @param defaultUsername The default username to use.
 */
+ (void)setDefaultUsername:(NSString *)defaultUsername;

/*!
 Sets the default password which is injected into any created
 GithubAPI objects. You must define either a password or a apiKey.
 If both are defined then the apiKey is used in preference over
 the password. This behaviour can be changed by setting the
 preferredCredential option.
 
 @param defaultPassword The default password to use.
 @see preferredCredential
 @see setPreferredCredential:
 */
+ (void)setDefaultPassword:(NSString *)defaultPassword;

/*!
 Sets the default apiKey which is injected into any created
 GithubAPI objects. You must define either a password or a apiKey.
 If both are defined then the apiKey is used in preference over
 the password. This behaviour can be changed by setting the
 preferredCredential option.
 
 @param defaultApiKey The default apiKey.
 @see preferredCredential
 @see setPreferredCredential:
 */
+ (void)setDefaultApiKey:(NSString *)defaultApiKey;

/*!
 Returns what HubKit is currently using as the preferred credential.
 
 @return The preferred credential type.
 @see HKPreferredCredential
 */
+ (HKPreferredCredential)preferredCredential;

/*!
 Sets the preferred credential for HubKit to use. By default HubKit will
 use the apiKey if available.
 
 @param preferredCredential The credential you would prefer HubKit to use
 first.
 @see HKPreferredCredential
 */
+ (void)setPreferredCredential:(HKPreferredCredential)preferredCredential;

/*!
 Returns whether HubKit is using the secure api to connect to GitHub.
 
 @return Returns YES if it is using the secure api, NO otherwise.
 */
+ (BOOL)useSecureAPI;

/*!
 Sets whether HubKit should use the secure api to connect to GitHub. By default
 HubKit will use the secure API.
 
 @param useSecureAPI Set this to YES to instruct HubKit to use the secure api.
 */
+ (void)setUseSecureAPI:(BOOL)useSecureAPI;

@end
