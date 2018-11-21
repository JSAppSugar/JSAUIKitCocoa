//
//  JSAUITextfield.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/21.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUITextfield.h"
#import "JSAUIColor.h"
#import "JSAUIView.h"

@implementation UITextField(JSAppSugar)

-(instancetype) initWithJSAParam:(NSDictionary *) param{
    if(self = [super initWithJSAParam:param]){
        NSString* borderStyle = [param valueForKey:@"borderStyle"];
        if(borderStyle){
            if([@"RoundedRect" isEqualToString:borderStyle]){
                self.borderStyle = UITextBorderStyleRoundedRect;
            }
            else if([@"Bezel" isEqualToString:borderStyle]){
                self.borderStyle = UITextBorderStyleBezel;
            }
            else if([@"Line" isEqualToString:borderStyle]){
                self.borderStyle = UITextBorderStyleLine;
            }
        }
        NSString* placeholder = [param valueForKey:@"placeholder"];
        if(placeholder){
            self.placeholder = placeholder;
        }
        NSNumber* secureTextEntry = [param valueForKey:@"secureTextEntry"];
        if(secureTextEntry){
            self.secureTextEntry = [secureTextEntry boolValue];
        }
    }
    return self;
}

@end
