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

## Documentation

Documentation is available with the library and is built and installed if you build the library using the supplied Xcode project. In order to do this you will need to have installed Doxygen.

Assuming you are using a package manager for OS X such as the excellent Homebrew then installation of Doxygen is easy;

    brew install doxygen
