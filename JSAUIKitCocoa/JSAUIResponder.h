//
//  JSAUIResponder.h
//  JSAUIKitCocoa
//
//  Created by Neal on 2018/11/20.
//  Copyright © 2018年 JSAppSugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSA4Cocoa/JSAppSugar.h>

@interface JSAUIActionEvent : NSObject

+ (instancetype)eventWithName:(NSString *)name;
+ (instancetype)eventWithName:(NSString *)name Object:(id)object;
+ (instancetype)eventWithName:(NSString *)name Object:(id)object UserInfo:(NSDictionary *)userInfo;
- (instancetype)initWithName:(NSString *)name Object:(id)object UserInfo:(NSDictionary *)userInfo;

/*!
 @method
 @abstract 获得事件名称.
 @return 事件名称
 */
- (NSString *)name;

/*!
 @method
 @abstract 获得发出事件的UIResponder对象，由事件发出对象决定是否设置
 @return 发出事件的UIResponder对象
 */
- (id)object;

/*!
 @method
 @abstract 获得事件的其他信息，由事件发出对象决定是否设置
 @return 事件的其他信息
 */
- (NSDictionary *)userInfo;

@end


@interface JSAUIActionEventHandleResult : NSObject

@property (nonatomic, readonly) BOOL shouldContinueDispatch;

+ (instancetype)resultWithContinueDispatch:(BOOL)shouldContinueDispatch;

@end


@interface UIResponder (JSAppSugar)



/*!
@method
@abstract 在UIResponder链路中抛出一个事件
@discussion 处理该事件的UIView或UIViewController对象，需要实现函数：
 - (UIActionEventHandleResult *)handle{ActionName}WithActionEvent:(UIActionEvent *)actionEvent;
 返回对象为 nil, 或者返回对象的 continueDispatch 属性为 NO 时，表示该事件处理结束，不再传递该事件
 {ActionName} 建议全局唯一，第一个字母将自动转换为大写字母
@param actionEvent 用户操作事件
*/
- (void)dispatchJSAUIActionEvent:(JSAUIActionEvent *)actionEvent;

/*!
 @method
 @abstract 在UIResponder链路中抛出一个事件
 @param name 事件名称
 @param object 产生事件的对象
 @param userInfo 事件的其他信息
 */
- (void)dispatchJSAUIActionEventWithName:(NSString *)name Object:(id)object UserInfo:(NSDictionary *)userInfo;

/*!
 @method
 @abstract 设置JSAObject为事件监听器
 @discussion UIResponder对象不会对observer对象产生强引用因此调用方应自己确保observer的生命周期与UIResponder一致
 @param observer 监听对象
 */
-(void)setJSAUIActionEventObserver:(id<JSAObject>) observer;

@end

