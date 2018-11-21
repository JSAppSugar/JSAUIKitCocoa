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
#import <JSA4Cocoa/JSA4Cocoa.h>
#import <objc/runtime.h>

static const char ASSOCIATEDOBJECT_KEY_JSA_EDITINGDIDEND;

@implementation UITextField(JSAppSugar)

-(instancetype) initWithJSAParam:(NSDictionary *) param{
    if(self = [super init]){
        [self setJSAParam:param];
    }
    return self;
}

-(void) setJSAParam:(NSDictionary *) param{
    [super setJSAParam:param];
    if(param != nil || param.count>0){
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
        NSString* text = [param valueForKey:@"text"];
        if(text){
            self.text = text;
        }
        
        NSString* placeholder = [param valueForKey:@"placeholder"];
        if(placeholder){
            self.placeholder = placeholder;
        }
        NSNumber* secureTextEntry = [param valueForKey:@"secureTextEntry"];
        if(secureTextEntry){
            self.secureTextEntry = [secureTextEntry boolValue];
        }
        id<JSAFunction> onEditingDidEnd = [param objectForKey:@"onEditingDidEnd"];
        if(onEditingDidEnd){
            objc_setAssociatedObject(self, &ASSOCIATEDOBJECT_KEY_JSA_EDITINGDIDEND, onEditingDidEnd, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            [self addTarget:self action:@selector(onEditingDidEnd) forControlEvents:UIControlEventEditingDidEnd];
        }
    }
}

-(void) onEditingDidEnd{
    id<JSAFunction> onEditingDidEnd = (id<JSAFunction>)objc_getAssociatedObject(self, &ASSOCIATEDOBJECT_KEY_JSA_EDITINGDIDEND);
    [onEditingDidEnd callWithArguments:@[self]];
}

@end
