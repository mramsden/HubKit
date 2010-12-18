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
#import "HubKitInternals.h"

NSString *HKErrorDomain = @"HubKitErrorDomain";

@implementation HubKit 

static HubKitConfigurationManager *_hkConfigurationManager = nil;

+ (void)setDefaultUsername:(NSString *)defaultUsername {
	[[HubKit sharedConfigurationManager] setUsername:defaultUsername];
}

+ (void)setDefaultPassword:(NSString *)defaultPassword {
	[[HubKit sharedConfigurationManager] setPassword:defaultPassword];
}

+ (void)setDefaultApiKey:(NSString *)defaultApiKey {
	[[HubKit sharedConfigurationManager] setApiKey:defaultApiKey];
}

+ (HKPreferredCredential)preferredCredential {
	return [[HubKit sharedConfigurationManager] preferredCredential];
}

+ (void)setPreferredCredential:(HKPreferredCredential)preferredCredential {
	[[HubKit sharedConfigurationManager] setPreferredCredential:preferredCredential];
}

+ (BOOL)useSecureAPI {
	return [[HubKit sharedConfigurationManager] useSecureConnection];
}

+ (void)setUseSecureAPI:(BOOL)useSecureAPI {
	[[HubKit sharedConfigurationManager] setUseSecureConnection:useSecureAPI];
}

#pragma mark -
#pragma mark Internal helper methods

#ifndef DOXYGEN_IGNORE

+ (HubKitConfigurationManager *)sharedConfigurationManager {
	if (_hkConfigurationManager == nil) {
		_hkConfigurationManager = [[HubKitConfigurationManager alloc] init];
	}
	
	return _hkConfigurationManager;
}

#endif /* DOXYGEN_IGNORE */
@end