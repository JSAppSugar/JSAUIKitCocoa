//
//  JSAMyLinearLayout.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/20.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAMyLinearLayout.h"
#import "JSAUIView.h"
#import "JSAMyLayoutPos.h"

@implementation MyLinearLayout(JSAppSugar)

-(instancetype) initWithJSAParam:(NSDictionary *) param{
    if(self = [super initWithJSAParam:param]){
        NSString* orientation = [param objectForKey:@"orientation"];
        if(orientation){
            if([@"Vert" isEqualToString:orientation]){
                self.orientation = MyOrientation_Vert;
                self.wrapContentHeight = YES;
            }else if ([@"Horz" isEqualToString:orientation]){
                self.orientation = MyOrientation_Horz;
                self.wrapContentWidth = YES;
            }
        }
        id padding = [param objectForKey:@"padding"];
        if(padding != nil){
            if([padding isKindOfClass: NSNumber.class]){
                float paddingNum = [padding floatValue];
                self.padding = UIEdgeInsetsMake(paddingNum, paddingNum, paddingNum, paddingNum);
            }else{
                NSArray* paddingArray = padding;
                float top = [paddingArray[0] floatValue];
                float left = [paddingArray[1] floatValue];
                float bottom = [paddingArray[2] floatValue];
                float right = [paddingArray[3] floatValue];
                self.padding = UIEdgeInsetsMake(top, left, bottom, right);
            }
            
        }
        
        [MyLayoutPos setMyLayoutExtWithView:self Param:param];
        
        NSArray * subviews = [param objectForKey:@"subviews"];
        if(subviews){
            for(NSDictionary* subview in subviews){
                UIView* view = [subview valueForKey:@"view"];
                if(!view){
                    continue;
                }
                
                [MyLayoutPos setMyLayoutExtWithView:view Param:subview];
                
                [self addSubview:view];
            }
        }
    }
    return self;
}

@end
