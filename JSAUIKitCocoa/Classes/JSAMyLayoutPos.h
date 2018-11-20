//
//  JSAMyLayoutPos.h
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/14.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import <MyLayout/MyLayout.h>

@interface MyLayoutPos(JSAppSugar)

/*
 通过JS Object设置MyLayoutPos
 {
 id:"",//指定参照View的ID
 centerXPos:0,
 topPos:0,
 rightPos:0,
 bottomPos:0,
 centerXPos:0,
 centerYPos:0,
 }
 xxPos允许设置为以下值：
 数字
 等同于将pos设置为数字
 
 字符串
 safeAreaMargin：表示设置为使用安全边距
 其他值：在设置过ID的subviews中查找对应的view
 
 对象
 {
 id:"",//参照view的ID
 pos:仅在设置了ID时有效，可选，设置参照view的对应pos位置
 value : 0，与id设置互斥，可设置为数字或字符串，对应直接设置为数字或字符串的含义
 offset : 0,设置offset值
 min : 0,设置min值
 max : 0,设置max值
 }
 */
+(void) setPos:(MyLayoutPos*) pos JSAValue:(id) value Views:(NSDictionary*) views;

+(void) setMyLayoutExtWithView:(UIView*) view Param:(NSDictionary *)param;

@end

