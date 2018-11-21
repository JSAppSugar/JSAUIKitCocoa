//
//  JSAUIButton.h
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/21.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton(JSAppSugar)

+(instancetype) buttonWithJSAParam:(NSDictionary *) param;

-(void) setJSAParam:(NSDictionary *) param;

@end
