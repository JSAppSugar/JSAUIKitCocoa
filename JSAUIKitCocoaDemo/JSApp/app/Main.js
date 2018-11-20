$import(
	"jsa.cocoa.UIViewController"
	);

$class("app.Main",{
	$extends : "jsa.cocoa.UIViewController",
	getView : function(viewController){
		viewController = new jsa.NativeObject(viewController);
		this.viewController = viewController.weakObject();
		var me = this;

		var relative =  $new("MyRelativeLayout","initWithJSAParam:",{
			wrapContentHeight:true,
			subviews:[
			{
				id:"1",
				view:$new("UIView","initWithJSAParam:",{
					width:100,
					height:100,
					backgroundColor:"#00FF00",
					onClick : function(view){
						console.log("click in function onClick");
						var responder = new jsa.NativeObject(view);
						responder.invoke("dispatchJSAUIActionEventWithName:Object:UserInfo:","onClick",null,null);
						me.myClick();
					},
				}),
				centerXPos : 0,
				topPos : {
					value : "safeAreaMargin",
					offset : 20
				}
			},
			{
				view:$new("UIView","initWithJSAParam:",{
					width:50,
					height:50,
					backgroundColor:"#0000FF",
				}),
				topPos :{
					id : "1",
					pos : "bottomPos",
					offset : 10,
				},
				leftPos : "1",
			}
			]
		});

		var linear = $new("MyLinearLayout","initWithJSAParam:",{
			orientation : "Vert",
			padding:10,
			myHorzMargin:0,
			subviews:[
			{
				view:$new("UIView","initWithJSAParam:",{
					width:100,
					height:100,
					backgroundColor:"#FF0000",
				}),
			},
			{
				view:$new("UILabel","initWithJSAParam:",{
					text:"This is a can automatically wrap text.To realize this function, you need to set the clear width, and set the wrapContentHeight to YES.",
					fontSize:16,
					textColor:"#1F6FB5",
				}),
				myTop:20,
				myHorzMargin:0,
				wrapContentHeight:true,
				numberOfLines:0,
			},
			{
				view:$new("UIView","initWithJSAParam:",{
					height:200,
					backgroundColor:"#00FF00",
				}),
				myTop:10,
				myLeft:10,
				myRight:10,
			},
			{
				view:relative,
				myHorzMargin:0,
			},
			{
				view:$new("UIView","initWithJSAParam:",{
					height:200,
					backgroundColor:"#0000FF",
				}),
				myTop:10,
				myLeft:10,
				myRight:10,
			}
			],
		});
		var scrollView = $new("UIScrollView","initWithJSAParam:",{
			backgroundColor:"#CCCCCC",
			subviews:[
			linear
			]
		});
		return scrollView;
	},
	onClick:function(){
		console.log("click in app.Main onClick");
	},
	myClick:function(){
		console.log("click in app.Main myClick");
	}
});
