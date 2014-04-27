//
//  TDMainViewController.m
//  TODO
//
//  Created by Yorkie on 4/26/14.
//  Copyright (c) 2014 Yorkie Neil. All rights reserved.
//

#import "Octokit/Octokit.h"
#import "TDMainViewController.h"
#import "TDFeedsViewController.h"

@interface TDMainViewController ()

@end

@implementation TDMainViewController

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
  
  // init the view setup
  UIView *view = self.view;
  [view setBackgroundColor:[UIColor whiteColor]];
  
  TDFeedsViewController *feedsView = [[TDFeedsViewController alloc] init];
  [view addSubview:feedsView.view];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
