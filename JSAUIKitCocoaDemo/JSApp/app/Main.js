$import(
	"jsa.cocoa.ControllerModel"
	);

$class("app.Main",{
	$extends : "jsa.cocoa.ControllerModel",
	getView : function(uiController){
		uiController = new jsa.NativeObject(uiController);
		this.uiController = uiController.weakObject();
		var me = this;
		return $new("MyRelativeLayout","initWithJSAParam:",{
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
	},
	onClick:function(){
		console.log("click in app.Main onClick");
	},
	myClick:function(){
		console.log("click in app.Main myClick");
	}
});
