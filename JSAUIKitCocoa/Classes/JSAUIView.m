//
//  JSAUIView.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/14.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUIView.h"
#import "JSAUIColor.h"
#import <JSA4Cocoa/JSA4Cocoa.h>
#import <objc/runtime.h>

static const char ASSOCIATEDOBJECT_KEY_JSA_ONCLICK;

@implementation UIView(JSAppSugar)

- (void) onJSAClick{
    id<JSAFunction> onClick = (id<JSAFunction>)objc_getAssociatedObject(self, &ASSOCIATEDOBJECT_KEY_JSA_ONCLICK);
    [onClick callWithArguments:@[self]];
}

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
            id<JSAFunction> onClick = [param objectForKey:@"onClick"];
            if(onClick){
                objc_setAssociatedObject(self, &ASSOCIATEDOBJECT_KEY_JSA_ONCLICK, onClick, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onJSAClick)];
                [self addGestureRecognizer:tap];
                self.userInteractionEnabled = YES;
            }
            
            NSArray * subviews = [param objectForKey:@"subviews"];
            if(subviews){
                for(id subview in subviews){
                    if([subview isKindOfClass: UIView.class]){
                        [self addSubview:subview];
                    }
                }
            }
        }
    }
    return self;
}

@end
