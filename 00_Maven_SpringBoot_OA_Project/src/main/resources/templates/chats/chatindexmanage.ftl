<#include "/common/commoncss.ftl"/>
<link rel="stylesheet" type="text/css" href="css/common/iconfont.css" />
<link rel="stylesheet" type="text/css" href="css/common/checkbox.css" />
<link rel="stylesheet" type="text/css" href="css/common/tanchuang.css" />
<style type="text/css">
.icon {
	width: 1em;
	height: 1em;
	vertical-align: -0.15em;
	fill: currentColor;
	overflow: hidden;
}

a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}

.box .nav-stacked>li {
	border-bottom: 1px solid #f4f4f4;
	margin: 0;
}

.nav-stacked>li>a {
	border-radius: 0;
	border-top: 0;
	border-left: 3px solid transparent;
	color: #444;
}

li.activee>a {
	border-left-color: #3c8dbc;
}

.des {
	border: none;
	color: #9e9e9e;
}
#thisul li a{
	padding:10px;
}
.thisbox-header:HOVER{
	background-color: #eee;
	color:#337ab7;
}
#thispills:HOVER{
	cursor: pointer;
}
#thispills li{
	border:1px solid #ccc;
	border-left: none;
}
#thispills li a:HOVER{
	background-color: #337ab7;
	color:#fff;
}
#thispills li a{
	padding:8px;
}
.ulfather .collapsed{
	cursor: pointer;
}
.nav>li>a {
	padding:15px;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">聊天室
		<a href="" class="label xinzeng" style="padding: 5px;margin-left:5px;">
						<span class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
		</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">聊天室</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-3">
		  
		<a class="btn btn-info addaddress" id="danliao"  href="javascript:void(0);"
			style="width: 45%; margin-left:16px; margin-bottom: 20px;"><span
			class="glyphicon glyphicon-edit"></span> 单聊</a>
			<a class="btn btn-default addaddress" id="qunliao" href="javascript:void(0);"
			style="width: 45%; margin-bottom: 20px;"><span
			class="glyphicon glyphicon-edit"></span> 群聊</a>
		
		<!-- <a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
            
			<a class="switch_btn" id="switch_login" href="javascript:void(0);" tabindex="8">快速注册</a> -->
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">部门列表</h3>
				<span class="btn btn-default pull-right btn-xs des mm"> <i
					class="glyphicon glyphicon-chevron-down" style="color: #5cb85c;" ></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked mm" id="navpills">
				<#if deplist??>
					<#list deplist as list>
						<li class="activee notfather tongxunluleixing depitem">
							<a href="##" > <span class="glyphicon glyphicon-user"> ${list.deptName}</span>
								<i class="glyphicon pull-right glyphicon-menu-left collapsed" href="##"  data-toggle="collapse" ></i>
							</a>
							<input type="hidden" class="detidchat" value="${list.deptId}">
						</li>
						
					</#list>
				</#if>
			</ul>
			
			
			<div class="box-header">
				<h3 class="box-title">部门成员</h3>
				<span class="btn btn-default pull-right btn-xs des mm"> <i
					class="glyphicon glyphicon-chevron-down" style="color: #5cb85c;" ></i>
				</span>
				<hr>
				<!-- 搜索框 -->
				<div class="input-group" style="width: 150px;">
					<input type="text" class="form-control input-sm baseKey" 
						placeholder="按部门/角色/用户名/电话号码/拼音" value="${(baseKey)!''}" style="width: 220px;"/>
					<div class="input-group-btn">
						<a class="btn btn-sm btn-default baseKeySumbit"> 
							<span class="glyphicon glyphicon-search"></span>
						</a>
					</div>
				</div>
			</div>
			<!-- 显示部门成员 (初始默认显示总经办的成员)-->
			<ul id="thisulnext" style="display: block;" class="nav nav-pills nav-stacked panel-collapse collapse">
				<#include "chatuser.ftl"/>
			</ul>
			
		</div>

		

		
	</div>
	<div class="col-md-9">
		
		<!-- 右侧显示联系人列表 -->
		<div class="bgc-w box box-primary thistable">
			<!-- 右侧显示聊天内容主体 -->
			<iframe id="iframeId" frameborder="no" height="100%" width="100%" src="testController02">
			
			
			
			</iframe>
			
		</div>
		
		<input type="hidden" class="sharehidden"/>
	</div>
	
	
</div>
<!-- 弹窗提示 -->
<#include "/common/modalTip.ftl"/>

<script src="js/common/iconfont.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		
		//点击单聊按钮
		$("#danliao").click(function(){
			
			//自己的样式设置
			$(this).addClass("btn-info");
			$(this).removeClass("btn-default");
			
			//隔壁样式设置
			$("#qunliao").addClass("btn-default");
			$("#qunliao").removeClass("btn-info");
			
		});
		
		//点击群聊按钮
		$("#qunliao").click(function(){
			
			//自己的样式设置
			$(this).addClass("btn-info");
			$(this).removeClass("btn-default");
			
			//隔壁样式设置
			$("#danliao").addClass("btn-default");
			$("#danliao").removeClass("btn-info");
			
		});
		
		
		//点击部门列表条目
		$(".depitem").click(function(){
			//alert($(this).next().text());
			
			//获取部门id
			var depid = $(this).find(".detidchat").val();
			
			//alert(depid);
			
			//重新加载部门列表内容
			$("#thisulnext").load("testController03",{depid:depid});
			
		});
		
	})
		
		
		
</script>