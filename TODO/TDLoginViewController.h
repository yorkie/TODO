//
//  TDLoginViewController.h
//  TODO
//
//  Created by Yorkie on 4/25/14.
//  Copyright (c) 2014 Yorkie Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDLoginViewController : UIViewController

// ui elements
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

- (IBAction)inputDidBeginEditing:(UITextField*)sender;
- (IBAction)login:(UIButton*)sender;

@end
