$import(
	"jsa.cocoa.JSAUIViewController",
	"jsa.cocoa.UIButton",
	"jsa.cocoa.UIResponder",
	"app.UserManagerModel",
	"app.AvatarView"
	);

$class("app.LoginView",{
	$init : function(lastloginUser){
		this.avatarView = new app.AvatarView({
			width:80,height:80
		});
		this.avatarView.setName(lastloginUser.username);
		this.userNameInput = $new("UITextField","initWithJSAParam:",{
			width:200,height:30,borderStyle:"RoundedRect",
			placeholder:"用户名",
			text:lastloginUser.username,
			onEditingDidEnd:function(view){
				jsa.cocoa.UIResponder.fromNative(view).dispatch("onEditingDidEnd",null,null);
			}
		});
		this.passwordInput = $new("UITextField","initWithJSAParam:",{
			width:200,height:30,borderStyle:"RoundedRect",secureTextEntry : true,
			placeholder:"密码",
			text:lastloginUser.password,
		});
		var loginView = $new("MyRelativeLayout","initWithJSAParam:",{
			subviews:[
			{
				id : "avatar",
				view:this.avatarView,
				topPos :{value : "safeAreaMargin",offset : 20},
				centerXPos : 0,
			},
			{
				id:"username",
				view:this.userNameInput,
				topPos :{id : "avatar",pos : "bottomPos",offset : 10,},
				centerXPos : 0,
			},
			{
				id:"password",
				view:this.passwordInput,
				topPos :{id : "username",pos : "bottomPos",offset : 10,},
				centerXPos : 0,
			},{
				view:jsa.cocoa.UIButton.button({
					type:"System",
					width:50,
					height:30,
					title:"登录",
					onClick:function(view){
						jsa.cocoa.UIResponder.fromNative(view).dispatch("onLoginClicked",null,null);
					}
				}),
				topPos :{id : "password",pos : "bottomPos",offset : 10,},
				centerXPos : 0,
			}
			]
		});
		jsa.cocoa.UIResponder.fromNative(loginView.$this).setObserver(this);
		this.$this = loginView.$this;
	},
	onEditingDidEnd:function(){
		var username = this.userNameInput.invoke("text");
		this.avatarView.setName(username);
	},
	onLoginClicked:function(){
		var username = this.userNameInput.invoke("text");
		var password = this.passwordInput.invoke("text");
		jsa.cocoa.UIResponder.fromNative(this.$this).dispatch("onLogin",null,{
			username:username,
			password:password
		});
	}
});

$class("app.Main",{
	$extends : "jsa.cocoa.JSAUIViewController",
	getView : function(viewController){
		viewController = new jsa.NativeObject(viewController);
		this.viewController = viewController.weakObject();
		var lastloginUser = app.UserManagerModel.lastloginUser();
		this.loginView = new app.LoginView(lastloginUser);
		return this.loginView;
	},
	onLogin:function(object,userInfo){
		console.log("User:"+userInfo.username+" Password:"+userInfo.password);
	}
});
