//
//  JSAUIView.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/14.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUIView.h"
#import "JSAUIColor.h"

@implementation UIView(JSAppSugar)

-(instancetype) initWithJSAParam:(NSDictionary *) param{
    if(self = [self init]){
        if(param != nil || param.count>0){
            CGPoint origin = self.frame.origin;
            CGSize size = self.frame.size;
            
            NSNumber *x = [param objectForKey:@"x"];
            if(x){
                origin.x = x.floatValue;
            }
            NSNumber *y = [param objectForKey:@"y"];
            if(y){
                origin.y = y.floatValue;
            }
            NSNumber *width = [param objectForKey:@"width"];
            if(width){
                size.width = width.floatValue;
            }
            NSNumber *height = [param objectForKey:@"height"];
            if(height){
                size.height = height.floatValue;
            }
            self.frame = CGRectMake(origin.x, origin.y, size.width, size.height);
            
            NSString* backgroundColor = [param objectForKey:@"backgroundColor"];
            if(backgroundColor){
                self.backgroundColor = [UIColor colorWithHexStringJSA:backgroundColor];
            }
        }
    }
    return self;
}

@end
