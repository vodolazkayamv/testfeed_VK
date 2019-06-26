//
//  DetailTableViewController.h
//  testfeed
//
//  Created by Мария Водолазкая on 24/06/2019.
//  Copyright © 2019 Tutova Maria. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailTableViewController : UITableViewController

@property (strong, atomic) NSString *username;
@property (strong, atomic) NSString *content;
@property (strong, atomic) NSString *dateAndTime;
@property (strong, atomic) NSURL *photoURL;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (weak, nonatomic) IBOutlet UITableViewCell *contentCell;

@end

NS_ASSUME_NONNULL_END
