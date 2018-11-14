//
//  JSAUIViewController.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/13.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAUIViewController.h"
#import <objc/runtime.h>

const char * const ASSOCIATEDOBJECT_KEY_JSA_CONTROLLER = "ASSOCIATEDOBJECT_KEY_JSA_CONTROLLER";

@implementation UIViewController(JSAppSugar)

-(instancetype) initWithJSClass:(NSString*) jsClassName Arguments:(NSArray*) arguments{
    if(self = [self init]){
        objc_setAssociatedObject(self, ASSOCIATEDOBJECT_KEY_JSA_CONTROLLER, [[JSAUIViewController sharedJSA] newClass:jsClassName Arguments:arguments], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return self;
}

-(id<JSAObject>) controllerModel{
    return objc_getAssociatedObject(self, ASSOCIATEDOBJECT_KEY_JSA_CONTROLLER);
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    id<JSAObject> jsaVC = [self controllerModel];
    if(jsaVC){
        UIView* v = [jsaVC invokeMethod:@"getView"];
        if(v){
            v.frame = self.view.frame;
            [self.view addSubview:v];
        }
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
