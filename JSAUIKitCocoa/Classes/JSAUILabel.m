//
//  JSAUILabel.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/20.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUILabel.h"
#import "JSAUIColor.h"
#import "JSAUIView.h"

@implementation UILabel(JSAppSugar)

-(instancetype) initWithJSAParam:(NSDictionary *) param{
    if(self = [super initWithJSAParam:param]){
        NSString* text = [param objectForKey:@"text"];
        if(text){
            self.text = text;
        }
        NSString* textColor = [param objectForKey:@"textColor"];
        if(textColor){
            self.textColor = [UIColor colorWithHexStringJSA:textColor];
        }
        NSNumber* fontSize = [param objectForKey:@"fontSize"];
        if(fontSize!=nil){
            float size = [fontSize floatValue];
            if([param objectForKey:@"bold"]){
                self.font = [UIFont boldSystemFontOfSize: size];
            }else if([param objectForKey:@"italic"]){
                self.font = [UIFont italicSystemFontOfSize: size];
            }else{
                self.font = [UIFont systemFontOfSize: size];
            }
        }
        NSNumber* numberOfLines = [param objectForKey:@"numberOfLines"];
        if(numberOfLines!=nil){
            self.numberOfLines = [numberOfLines integerValue];
        }
        NSString* textAlignment = [param objectForKey:@"textAlignment"];
        if(textAlignment){
            if([@"center" isEqualToString:textAlignment]){
                self.textAlignment = NSTextAlignmentCenter;
            }
            else if([@"right" isEqualToString:textAlignment]){
                self.textAlignment = NSTextAlignmentRight;
            }
        }
        NSNumber* sizeToFit = [param objectForKey:@"sizeToFit"];
        if(sizeToFit){
            [self sizeToFit];
        }
    }
    return self;
}

@end
