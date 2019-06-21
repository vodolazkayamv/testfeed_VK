//
//  ViewController.h
//  testfeed
//
//  Created by Мария Водолазкая on 14/06/2019.
//  Copyright © 2019 Tutova Maria. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const TOKEN_KEY = @"my_application_access_token";
static NSString *const NEXT_CONTROLLER_SEGUE_ID = @"START_WORKING";
static NSArray *SCOPE = nil;

@interface ViewController : UIViewController <UIAlertViewDelegate, VKSdkDelegate, VKSdkUIDelegate>


@end

