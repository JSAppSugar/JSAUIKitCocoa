# JSAUIKitCocoa
## 使用JavaScript编写iOS应用业务逻辑

JSAUIKitCocoa使你可以使用JavaScript编写对性能要求不高但可能变动性很大的iOS应用的业务逻辑部分，View组件、需要多线程支持的Model等则直接使用原生对象。

编写方式与React Native相似，但你几乎无需学习除了JavaScript语法以外的任何新知识，因为你是直接使用UILabel、UIView这些类，或你自己编写的扩展类，而无需再了解一套全新的React框架体系。

JSAUIKitCocoa推荐使用[MyLayout](https://github.com/youngsoft/MyLinearLayout)进行布局，JSAUIKitCocoaDemo也将使用MyLayout进行页面布局。当然，你也可以自由选择你熟悉的布局框架。配合JSAUIKitCocoa提供的JSAUIViewController，你可以像使用WEBView一样从Server或本地加载显示内容以及交互逻辑：

创建JSAUIViewController：

```objective-c
//获得JSAUIViewController使用的JSA4Cocoa上下文环境
JSA4Cocoa* jsa = [JSAUIViewController sharedJSA];
//启动JSA4Cocoa引擎，该代码全局只应调用一次，建议放在AppDelegate中进行初始化
[jsa startEngine];

//创建一个JSAUIViewController
JSAUIViewController *mainVC = [[JSAUIViewController alloc] initWithJSClass:@"app.Main" Arguments:@[]];
```

这里创建的JSAUIViewController就是UIViewController的子类，与你通常编写一个页面所创建的UIViewController子类是一样的，唯一区别是，原来你写在子类中的代码，现在可以使用JavaScript编写。

app.Main的类定义如下：

```javascript
//引入JS父类
$import("jsa.cocoa.JSAUIViewController");

$class("app.Main",{
	$extends : "jsa.cocoa.JSAUIViewController",
    //与RN的render函数类似，这里返回一个组装好的UIView对象，该view将被赋值到UIViewController.view属性
	getView : function(viewController){
      	//使用JSA语法糖函数$new创建MyRelativeLayout对象作为根视图以实现自动布局
		this.view = $new("MyRelativeLayout","initWithJSAParam:",{
            subviews:[
                {
                  	//创建UILabel视图对象
                    view:$new("UILabel","initWithJSAParam:",{
                      	textAlignment:"center",
                      	text:"HelloWorld",
                      	sizeToFit:true,
                    }),
                  	topPos :{value : "safeAreaMargin",offset : 20},
                  	centerXPos : 0,
                }
            ]
        });
		return this.view;
	}
});
```

当然，你也可以像写原生代码一样先创建类对象，然后再进行属性设置，但考虑到JS与原生系统之间的函数调用时间相对较长，因此建议使用构造器函数一次性赋值，同时JSAUIKitCocoa对一些常用UI组件编写了initWithJSAParam:构造器方法，可按上述方式进行组件的初始化。当然，你也可以编写符合自己习惯的构造器方法。

JSAUIKitCocoa展示了一种使用[JSAppSugar](https://github.com/JSAppSugar/JSAppSugar)编写原生应用业务逻辑的方式，你也可以使用JSAppSugar创造你自己的混合编程方式。

