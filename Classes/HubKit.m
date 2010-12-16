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

@interface HubKit ()

+ (HubKitConfigurationManager *)configurationManager;

@end

@implementation HubKit 

static HubKitConfigurationManager *_hkConfigurationManager = nil;

+ (void)setDefaultUsername:(NSString *)defaultUsername {
	[[HubKit configurationManager] setUsername:defaultUsername];
}

+ (void)setDefaultPassword:(NSString *)defaultPassword {
	[[HubKit configurationManager] setPassword:defaultPassword];
}

+ (void)setDefaultApiKey:(NSString *)defaultApiKey {
	[[HubKit configurationManager] setApiKey:defaultApiKey];
}

+ (HKPreferredCredential)preferredCredential {
	return [[HubKit configurationManager] preferredCredential];
}

+ (void)setPreferredCredential:(HKPreferredCredential)preferredCredential {
	[[HubKit configurationManager] setPreferredCredential:preferredCredential];
}

#pragma mark -
#pragma mark Private helper methods

+ (HubKitConfigurationManager *)configurationManager {
	if (_hkConfigurationManager == nil) {
		_hkConfigurationManager = [[HubKitConfigurationManager alloc] init];
	}
	
	return _hkConfigurationManager;
}

@end