//
//  JSAUIViewController.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/13.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUIViewController.h"
#import "JSANSObject.h"
#import "JSAUIResponder.h"


@implementation UIViewController(JSAppSugar)

-(instancetype) initWithJSClass:(NSString*) jsClassName Arguments:(NSArray*) arguments{
    if(self = [self init]){
        [self setJSAObject:[[JSAUIViewController sharedJSA] newClass:jsClassName Arguments:arguments]];
    }
    return self;
}

@end

@interface JSAUIViewController ()

@end

static JSA4Cocoa* _jsa;

@implementation JSAUIViewController

+(JSA4Cocoa*) sharedJSA{
    if(_jsa == nil){
        _jsa = [[JSA4Cocoa alloc] init];
        [_jsa addJSClassLoader: [[JSADefaultClassLoader alloc] initWithNSBundle:[NSBundle bundleForClass: [JSAUIViewController class]]]];
    }
    return _jsa;
}

- (void)loadView {
    // Do any additional setup after loading the view.
    id<JSAObject> jsaVC = self.jsaObject;
    [self setJSAUIActionEventObserver: jsaVC];
    if(jsaVC){
        UIView* v = [jsaVC invokeMethod:@"getView" Arguments:@[self]];
        if(v){
            self.view = v;
        }
    }else{
        [super loadView];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
