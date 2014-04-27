//
//  OCTFeed.h
//  OctoKit
//
//  Created by Yorkie on 4/27/14.
//  Copyright (c) 2014 GitHub. All rights reserved.
//

#import <OctoKit/OctoKit.h>

// A git commit.
@interface OCTFeed : OCTObject

// The commit URL for this commit.
@property (nonatomic, copy, readonly) NSURL *timelineURL;

// The commit message for this commit.
@property (nonatomic, copy, readonly) NSURL *userURL;

// The commit message for this commit.
@property (nonatomic, copy, readonly) NSURL *currentUserURL;

// The commit message for this commit.
@property (nonatomic, copy, readonly) NSURL *currentUserPublicURL;

// The commit message for this commit.
@property (nonatomic, copy, readonly) NSURL *currentUserActorURL;

// The commit message for this commit.
@property (nonatomic, copy, readonly) NSURL *currentUserOrgURL;

@end
