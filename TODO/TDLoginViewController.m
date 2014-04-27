//
//  TDLoginViewController.m
//  TODO
//
//  Created by Yorkie on 4/25/14.
//  Copyright (c) 2014 Yorkie Neil. All rights reserved.
//

#import "Octokit/Octokit.h"
#import "TDLoginViewController.h"
#import "TDFeedsViewController.h"

@interface TDLoginViewController ()

@end

@implementation TDLoginViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.password.secureTextEntry = YES;
  self.loginButton.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (IBAction)inputDidBeginEditing:(UITextField*)sender
{
  CGRect frame = sender.frame;
  int offset = frame.origin.y + 75 - (self.view.frame.size.height - 216.0);
  
  NSTimeInterval animationDuration = 0.30f;
  [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
  [UIView setAnimationDuration:animationDuration];
  
  if (offset > 0) {
    self.view.frame = CGRectMake(0.0f, -offset,
                                 self.view.frame.size.width,
                                 self.view.frame.size.height);
  }
  [UIView commitAnimations];
}

- (IBAction)login:(UIButton*)sender
{
  TDFeedsViewController * feedsViewController = [[TDFeedsViewController alloc] init];
  [self loginFadeOut];
  
  NSString * username = self.username.text;
  NSString * password = self.password.text;
  [OCTClient setClientID:@"c8027b11c34571e54dea"
            clientSecret:@"358fdaf2d9882b078b72143fe8d658c8170a4dcf"];
  OCTUser *user = [OCTUser userWithRawLogin:username server:OCTServer.dotComServer];
  [[OCTClient
    signInAsUser:user password:password oneTimePassword:nil scopes:OCTClientAuthorizationScopesUser]
    subscribeNext:^(OCTClient *authenticatedClient) {
      // Authenticated successfully
      RACSignal * listFeeds = [authenticatedClient listFeeds];
      [listFeeds subscribeNext:^(OCTFeed *feed) {
        NSLog(@"timeline url: %@", [feed.timelineURL absoluteString]);
        NSLog(@"user url: %@", [feed.userURL absoluteString]);
        NSLog(@"current user url: %@", [feed.currentUserURL absoluteString]);
        NSLog(@"current user public url: %@", [feed.currentUserPublicURL absoluteString]);
        NSLog(@"current user actor url: %@", [feed.currentUserActorURL absoluteString]);
        NSLog(@"current user org url: %@", [feed.currentUserOrgURL absoluteString]);
      }];
      
      dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:feedsViewController animated:YES completion:NULL];
      });
      
    } error:^(NSError *error) {
      NSLog(@"Failed");
      dispatch_async(dispatch_get_main_queue(), ^{
        [self loginFadeIn];
      });
    }];
}

- (void)loginFadeOut {
  NSTimeInterval animationDuration = 0.75f;
  [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
  [UIView setAnimationDuration:animationDuration];
  self.logo.frame = CGRectMake(self.logo.frame.origin.x,
                               self.logo.frame.origin.y + 50,
                               self.logo.frame.size.width,
                               self.logo.frame.size.height);
  self.username.alpha = 0.0f;
  self.password.alpha = 0.0f;
  self.loginButton.alpha = 0.0f;
  [UIView commitAnimations];
}

- (void)loginFadeIn {
  NSTimeInterval animationDuration = 0.75f;
  [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
  [UIView setAnimationDuration:animationDuration];
  self.logo.frame = CGRectMake(self.logo.frame.origin.x,
                               self.logo.frame.origin.y - 50,
                               self.logo.frame.size.width,
                               self.logo.frame.size.height);
  self.username.alpha = 1.0f;
  self.password.alpha = 1.0f;
  self.loginButton.alpha = 1.0f;
  [UIView commitAnimations];
}

@end
