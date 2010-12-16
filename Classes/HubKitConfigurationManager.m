//
//  HubKitConfigurationManager.m
//  HubKit
//
//  Created by Marcus Ramsden on 16/12/2010.
//  Copyright 2010 Accenture. All rights reserved.
//

#import "HubKitConfigurationManager.h"


@implementation HubKitConfigurationManager

@synthesize preferredCredential, username, password, apiKey;

- (void)dealloc {
	[username release];
	[password release];
	[apiKey release];
}

@end
