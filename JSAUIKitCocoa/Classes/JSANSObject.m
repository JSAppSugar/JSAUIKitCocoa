//
//  JSANSObject.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/20.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSANSObject.h"
#import <objc/runtime.h>

static const char ASSOCIATEDOBJECT_KEY_JSA_OBJECT;

@implementation NSObject(JSAppSugar)

- (void) setJSAObject:(id<JSAObject>) jsaObject{
    objc_setAssociatedObject(self, &ASSOCIATEDOBJECT_KEY_JSA_OBJECT, jsaObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<JSAObject>) jsaObject{
    return objc_getAssociatedObject(self, &ASSOCIATEDOBJECT_KEY_JSA_OBJECT);
}

@end
