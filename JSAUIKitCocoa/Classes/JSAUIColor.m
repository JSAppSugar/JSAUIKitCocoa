//
//  JSAUIColor.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/14.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUIColor.h"

@implementation UIColor (JSAppSugar)

+ (UIColor *) colorWithHexStringJSA:(NSString *)color{
    NSString * colorStr = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^#[0-9A-Fa-f]{6}$"];
    
    if (![predicate evaluateWithObject:color]) {
        return [UIColor clearColor];
    }

    colorStr = [colorStr substringFromIndex:1];
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString * redStr = [colorStr substringWithRange:range];
    range.location = 2;
    NSString * greenStr = [colorStr substringWithRange:range];
    range.location = 4;
    NSString * blueStr = [colorStr substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:redStr] scanHexInt:&r];
    [[NSScanner scannerWithString:greenStr] scanHexInt:&g];
    [[NSScanner scannerWithString:blueStr] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:1.0f];
}

@end
