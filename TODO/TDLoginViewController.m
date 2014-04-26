//
//  TDLoginViewController.m
//  TODO
//
//  Created by Yorkie on 4/25/14.
//  Copyright (c) 2014 Yorkie Neil. All rights reserved.
//

#import "Octokit/Octokit.h"
#import "TDLoginViewController.h"
#import "TDMainViewController.h"

@interface TDLoginViewController ()

@end

@implementation TDLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.loginButton.layer.cornerRadius = 5;
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
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

  NSString * username = self.username.text;
  NSString * password = self.password.text;
  [OCTClient setClientID:@"c8027b11c34571e54dea"
            clientSecret:@"358fdaf2d9882b078b72143fe8d658c8170a4dcf"];
  OCTUser *user = [OCTUser userWithRawLogin:username server:OCTServer.dotComServer];
  [[OCTClient
    signInAsUser:user password:password oneTimePassword:nil scopes:OCTClientAuthorizationScopesUser]
    subscribeNext:^(OCTClient *authenticatedClient) {
      // Authenticated successfully
      NSLog(@"Successfully");
      NSLog(@"token:%@, username:%@", authenticatedClient.token, username);
      
    } error:^(NSError *error) {
      NSLog(@"Failed");
    }];
  TDMainViewController * mainViewController = [[TDMainViewController alloc] init];
  [self presentViewController:mainViewController animated:YES completion:NULL];
}

@end
