//
//  TDFeedsViewController.m
//  TODO
//
//  Created by Yorkie on 4/27/14.
//  Copyright (c) 2014 Yorkie Neil. All rights reserved.
//

#import "TDFeedsViewController.h"

@interface TDFeedsViewController ()

@end

@implementation TDFeedsViewController {
  NSData *photo;
  NSArray *feeds;
}

- (id)init
{
  NSURL *photoURL = [NSURL URLWithString:@"https://avatars0.githubusercontent.com/u/238531?s=140"];
  photo = [NSData dataWithContentsOfURL:photoURL];
  feeds = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  float offset = 25.0f;
  self.tableView = [[UITableView alloc]
                    initWithFrame:CGRectMake(0, offset, self.view.frame.size.width, self.view.frame.size.height-offset)];
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.rowHeight = 80;
  
  [self.view setBackgroundColor:[UIColor whiteColor]];
  [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [feeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *simpleTableIdentifier = @"FeedsTableCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
  }
  
  cell.textLabel.text = [feeds objectAtIndex:indexPath.row];
  cell.imageView.image = [UIImage imageWithData:photo];
  cell.imageView.layer.cornerRadius = 25;
  cell.imageView.clipsToBounds = YES;
  
  CGSize size = CGSizeMake(50, 50);
  UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
  [cell.imageView.image drawInRect:CGRectMake(0.0, 0.0, size.width, size.height)];
  cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return cell;
}

@end
