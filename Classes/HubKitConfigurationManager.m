//
//  HubKitConfigurationManager.m
//  HubKit
//
//  Created by Marcus Ramsden on 16/12/2010.
//  Copyright 2010 Accenture. All rights reserved.
//

#import "HubKitConfigurationManager.h"

NSString * const GitHubHTTPURLString = @"http://api.github.com/v2/";
NSString * const GitHubHTTPSURLString = @"https://api.github.com/v2/";

@implementation HubKitConfigurationManager

@synthesize preferredCredential, username, password, apiKey, useSecureConnection;

- (id)init {
	if ((self = [super init])) {
		preferredCredential = HKApiKeyPreferredCredential;
		useSecureConnection = YES;
	}
	
	return self;
}

- (void)dealloc {
	[username release];
	[password release];
	[apiKey release];
	[super dealloc];
}

@end
