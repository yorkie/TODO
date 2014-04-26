//
//  TDAuthenticate.h
//  TODO
//
//  Created by Yorkie on 4/26/14.
//  Copyright (c) 2014 Yorkie Neil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OctoKit/OctoKit.h"

@interface TDAuthenticate : NSObject

@property (copy) NSString *clientId;
@property (copy) NSString *clientSecret;

+ (NSString*)getAuthorizationUri {
  
  return @"redirect";
}

@end
