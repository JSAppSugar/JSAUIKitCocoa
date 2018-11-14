//
//  JSAMyLayoutPos.m
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/14.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import "JSAMyLayoutPos.h"

@implementation MyLayoutPos(JSAppSugar)

+(void) setPos:(MyLayoutPos*) pos JSAValue:(id) value Views:(NSDictionary*) views{
    
    if([value isKindOfClass:NSNumber.class]){
        pos.equalTo(value);
    }
    else if([value isKindOfClass:NSString.class]){
        UIView* view = [views valueForKey:value];
        if(view){
            pos.equalTo(view);
        }else if([@"safeAreaMargin" isEqualToString:value]){
            pos.equalTo(@(MyLayoutPos.safeAreaMargin));
        }
    }
    else if([value isKindOfClass:NSDictionary.class]){
        NSDictionary* params = (NSDictionary*) value;
        NSString* viewID = [params valueForKey:@"id"];
        if(viewID){
            UIView* view = [views valueForKey:viewID];
            id toPos = nil;
            if(view){
                NSString* pos = [params valueForKey:@"pos"];
                if([@"leftPos" isEqualToString:pos]){
                    toPos = view.leftPos;
                }else if([@"topPos" isEqualToString:pos]){
                    toPos = view.topPos;
                }else if([@"rightPos" isEqualToString:pos]){
                    toPos = view.rightPos;
                }else if([@"bottomPos" isEqualToString:pos]){
                    toPos = view.bottomPos;
                }else if([@"centerXPos" isEqualToString:pos]){
                    toPos = view.centerXPos;
                }else if([@"centerYPos" isEqualToString:pos]){
                    toPos = view.centerYPos;
                }else{
                    toPos = view;
                }
            }
            if(toPos){
                pos.equalTo(toPos);
            }
        }else{
            id posValue = [params valueForKey:@"value"];
            if(posValue!=nil){
                if([posValue isKindOfClass:NSString.class]){
                    pos.equalTo(@(MyLayoutPos.safeAreaMargin));
                }else{
                    pos.equalTo(posValue);
                }
            }
        }
        {
            NSNumber* offset = [params valueForKey:@"offset"];
            if(offset != nil){
                pos.offset(offset.floatValue);
            }
        }
        {
            NSNumber* min = [params valueForKey:@"min"];
            if(min != nil){
                pos.min(min.floatValue);
            }
        }
        {
            NSNumber* max = [params valueForKey:@"max"];
            if(max != nil){
                pos.max(max.floatValue);
            }
        }
    }
}

@end
