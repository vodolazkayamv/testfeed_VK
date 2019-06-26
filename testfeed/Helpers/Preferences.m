//
//  Preferences.m
//  testfeed
//
//  Created by Мария Водолазкая on 20/06/2019.
//  Copyright © 2019 Tutova Maria. All rights reserved.
//

#import "Preferences.h"

@interface Preferences () {
    NSUserDefaults *prefs;
}

@end

NSString * const PREF_showAvatar  =  @"CR001";
NSString * const PREF_screenName  =  @"CR002";

@implementation Preferences

+ (Preferences *) sharedPreferences
{
    static Preferences *_Preferences;
    if (_Preferences == nil) {
        _Preferences = [[Preferences alloc] init];
    }
    return _Preferences;
}


/**
 *  @brief Init set of data for case when actual preference file is not created yet
 */
+ (void)initialize
{
    NSMutableDictionary  *defaultValues = [NSMutableDictionary dictionary];
    
    // set up default parameters
    [defaultValues setObject:@(NO) forKey:PREF_showAvatar];
    [defaultValues setObject:@"-1" forKey:PREF_screenName];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults: defaultValues];
    
}

- (id) init
{
    if (self = [super init]) {
        prefs = [NSUserDefaults standardUserDefaults];
        
    }
    return self;
}


- (void) flush
{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark -

- (BOOL) showAvatar
{
    return [prefs boolForKey:PREF_showAvatar];
}

- (void) setShowAvatar:(BOOL)showAvatar
{
    [prefs setBool:showAvatar forKey:PREF_showAvatar];
}

- (NSString*) screenName
{
    return [prefs objectForKey:PREF_screenName];
}

- (void) setScreenName:(NSString *)screenName
{
    [prefs setObject:screenName forKey:PREF_screenName];
}

@end
