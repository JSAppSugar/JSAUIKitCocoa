//
//  JSAUIButton.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/21.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUIButton.h"
#import "JSAUIView.m"

@implementation UIButton(JSAppSugar)

+(instancetype) buttonWithJSAParam:(NSDictionary *) param{
    UIButton* button;
    NSString* type = [param valueForKey:@"type"];
    if([@"System" isEqualToString:type]){
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }else{
        button = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    [button setJSAParam:param];
    return button;
}

-(void) setJSAParam:(NSDictionary *) param{
    [super setJSAParam:param];
    NSString* title = [param valueForKey:@"title"];
    if(title){
        [self setTitle:title forState:UIControlStateNormal];
    }
}

@end
