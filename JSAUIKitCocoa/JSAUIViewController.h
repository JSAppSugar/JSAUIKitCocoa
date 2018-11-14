//
//  JSAUIViewController.h
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/13.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSA4Cocoa/JSA4Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController(JSAppSugar)

-(instancetype) initWithJSClass:(NSString*) jsClassName Arguments:(NSArray*) arguments;

-(id<JSAObject>) controllerModel;

@end


@interface JSAUIViewController : UIViewController

+(JSA4Cocoa*) sharedJSA;

@end

NS_ASSUME_NONNULL_END
