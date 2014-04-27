//
//  OCTClient+Feed.h
//  OctoKit
//
//  Created by Yorkie on 4/27/14.
//  Copyright (c) 2014 GitHub. All rights reserved.
//
#import "OCTClient.h"

@class RACSignal;
@class OCTFeed;

@interface OCTClient (Feed)

- (RACSignal *)listFeeds;

@end
