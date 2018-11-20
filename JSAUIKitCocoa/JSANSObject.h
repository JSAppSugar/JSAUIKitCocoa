//
//  JSANSObject.h
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/20.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import <JSA4Cocoa/JSA4Cocoa.h>

@interface NSObject(JSAppSugar)

- (void) setJSAObject:(id<JSAObject>) jsaObject;

- (id<JSAObject>) jsaObject;

@end
