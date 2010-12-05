# HubKit

## Introduction

HubKit is an Objective-C library for connecting to the Github API.

## Installation

To follow.

## Usage

    HKSetUsername(@"Github username");
    // You must either set an apiKey or a password for use.
    HKSetPassword(@"Github password");
    HKSetApiKey(@"Github apiKey");

    NSError *error;
    HKGithubUser *authenticatedUser = [HKGetGithubAPI(&error) authenticatedUser];
    // Do something with the user you just retrieved or handle the error.
