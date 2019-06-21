//
//  Preferences.h
//  testfeed
//
//  Created by Мария Водолазкая on 20/06/2019.
//  Copyright © 2019 Tutova Maria. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Preferences : NSObject

+ (Preferences *) sharedPreferences;
- (void) flush;

@property (nonatomic, readwrite) BOOL showAvatar;

@end

NS_ASSUME_NONNULL_END
