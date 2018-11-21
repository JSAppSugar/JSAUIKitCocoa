
$class("app.AvatarView",{
	$init : function(param){
		this.textView = $new("UILabel","initWithJSAParam:",{
			fontSize:12,
			textColor:"#FFFFFF",
			textAlignment:"center"
		});
		var avatarView = $new("MyRelativeLayout","initWithJSAParam:",Object.assign(param,{
			backgroundColor:"#03A9F4",
			subviews:[
			{
				view:this.textView,
				leftPos:5,
				topPos:5,
				rightPos:5,
				bottomPos:5,
			}
			]
		}));
		this.$this = avatarView.$this;
	},
	setName:function(name){
		name = name.trim();
		if(name == ""){
			name = "Unknown";
		}
		this.textView.invoke("setText:",name);
	}
});
