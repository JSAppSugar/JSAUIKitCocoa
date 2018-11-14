$import(
	"jsa.cocoa.ControllerModel"
	);

$class("app.Main",{
	$extends : "jsa.cocoa.ControllerModel",
	getView : function(){
		return $new("MyRelativeLayout","initWithJSAParam:",{
			subviews:[
			{
				id:"1",
				view:$new("UIView","initWithJSAParam:",{
					width:100,
					height:100,
					backgroundColor:"#00FF00",
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
	}
});
