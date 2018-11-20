//
//  JSAMyRelativeLayout.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/14.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAMyRelativeLayout.h"
#import "JSAUIView.h"
#import "JSAMyLayoutPos.h"

@implementation MyRelativeLayout(JSAppSugar)

-(instancetype) initWithJSAParam:(NSDictionary *) param{
    if(self = [super initWithJSAParam:param]){
        
        [MyLayoutPos setMyLayoutExtWithView:self Param:param];
        
        NSArray * subviews = [param objectForKey:@"subviews"];
        if(subviews){
            NSMutableDictionary *idViews = [[NSMutableDictionary alloc] initWithCapacity: subviews.count];
            for(NSDictionary* subview in subviews){
                NSString* viewID = [subview valueForKey:@"id"];
                UIView* view = [subview valueForKey:@"view"];
                if(!view){
                    continue;
                }
                if(viewID){
                    [idViews setValue:view forKey:viewID];
                }

#define My_Layout_Pos_Case(_pos)\
id _pos = [subview valueForKey:[NSString stringWithUTF8String:#_pos]];\
if(_pos!=nil){\
    [MyLayoutPos setPos:view._pos JSAValue:_pos Views:idViews];\
}
                My_Layout_Pos_Case(leftPos)
                My_Layout_Pos_Case(topPos)
                My_Layout_Pos_Case(rightPos)
                My_Layout_Pos_Case(bottomPos)
                My_Layout_Pos_Case(centerXPos)
                My_Layout_Pos_Case(centerYPos)
                
                [MyLayoutPos setMyLayoutExtWithView:view Param:param];
                [self addSubview:view];
                
            }
        }
    }
    return self;
}

@end
