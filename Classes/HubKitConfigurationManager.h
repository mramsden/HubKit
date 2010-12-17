//
//  HubKitConfigurationManager.h
//  HubKit
//
//  Created by Marcus Ramsden on 16/12/2010.
//  Copyright 2010 Accenture. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 GitHub API HTTP URL string.
 */
extern NSString * const GitHubHTTPURLString;

/*!
 GitHub API HTTPS URL string.
 */
extern NSString * const GitHubHTTPSURLString;

typedef enum {
	HKApiKeyPreferredCredential,
	HKPasswordPreferredCredential
} HKPreferredCredential;

@interface HubKitConfigurationManager : NSObject {
	HKPreferredCredential preferredCredential;
	NSString *username;
	NSString *password;
	NSString *apiKey;
	BOOL useSecureConnection;
}

@property (nonatomic,assign) HKPreferredCredential preferredCredential;
@property (nonatomic,retain) NSString *username;
@property (nonatomic,retain) NSString *password;
@property (nonatomic,retain) NSString *apiKey;
@property (nonatomic,assign) BOOL useSecureConnection;

@end
