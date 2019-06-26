//
//  SettingsTableViewController.h
//  testfeed
//
//  Created by Мария Водолазкая on 20/06/2019.
//  Copyright © 2019 Tutova Maria. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISwitch *showAvatarSwitch;

@property (weak, nonatomic) IBOutlet UITextField *screenNameTextField;


- (IBAction)showAvatarSwitchValueChanged:(id)sender;

- (IBAction)saveAndQuitButtonTouched:(id)sender;

@end

NS_ASSUME_NONNULL_END
