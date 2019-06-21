//
//  UILabel+FormattedText.h
//  UILabel+FormattedText
//
//  Created by Joao Costa on 3/1/13.
//  Copyright (c) 2013 none. All rights reserved.
//
// 15/06/18 MTutova: got it from https://github.com/joaoffcosta/UILabel-FormattedText

#import <UIKit/UIKit.h>

@interface UILabel (FormattedText)

- (void)setTextColor:(UIColor *)textColor range:(NSRange)range;
- (void)setFont:(UIFont *)font range:(NSRange)range;

- (void)setTextColor:(UIColor *)textColor beforeOccurenceOfString:(NSString*)separator;
- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font beforeOccurenceOfString:(NSString*)separator;
- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator;

- (void)setTextUnderLine:(UIColor *)lineColor range:(NSRange)range;
- (void)setTextWithoutUnderLineInRange:(NSRange)range;
- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString;
- (void)setTextColor:(UIColor *)textColor String:(NSString*)searchString underLineColor:(UIColor*)underlineColor;
- (void)setTextColor:(UIColor *)textColor fromOccurenceOfString:(NSString*)separator1 toOccurenceOfString:(NSString*)separator2;

- (void)setTextColorforNumbers:(UIColor *)textColor;
- (void)setFontForNumbers:(UIFont *)font;

@end
