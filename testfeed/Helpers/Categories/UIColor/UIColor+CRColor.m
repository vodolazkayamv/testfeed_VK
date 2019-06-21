//
//  UIColor+CRColor.m
//
//  Generated on Zeplin. (by mariavv on 27.09.2017).
//  Copyright © 2017 CROC Inc. All rights reserved.
//

#import "UIColor+CRColor.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >>  8))/255.0 \
blue:((float)((rgbValue & 0x0000FF) >>  0))/255.0 \
alpha:1.0]

@implementation UIColor (CRColor)

+ (UIColor * _Nonnull)MGS_darkBlueColor {
    return UIColorFromRGB(0x385c73);
    
}
+ (UIColor * _Nonnull)MGS_floorBlueColor {
    return UIColorFromRGB(0xe6edf4);
}
+ (UIColor * _Nonnull)MGS_wallsBlueColor {
    return UIColorFromRGB(0xc2d8ef);
}
+ (UIColor * _Nonnull)MGS_windowBlueColor {
    return UIColorFromRGB(0xe2f4fd);
}
+ (UIColor * _Nonnull)MGS_brownColor {
    return UIColorFromRGB(0x925f53);
}


@end

