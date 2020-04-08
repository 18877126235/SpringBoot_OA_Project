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
		<h1 style="font-size: 24px; margin: 0;" class="">用户管理
		<a href="" class="label xinzeng" style="padding: 5px;margin-left:5px;">
						<span class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
		</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">用户管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-3">
		<a class="btn btn-primary addaddress" href="javascript:void(0);"
			style="width: 100%; margin-bottom: 20px;"><span
			class="glyphicon glyphicon-edit"></span> 新建部门分组</a>
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">组织机构</h3>
				<span class="btn btn-default pull-right btn-xs des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked mm" id="navpills">
				<li  style="margin-left: 20px;" class="activee notfather tongxunluleixing">
					<a href="##"  > <span class="glyphicon glyphicon-th "> 部门列表</span>
						<i class="glyphicon pull-right glyphicon-menu-left collapsed" href="##"  data-toggle="collapse" ></i>
					</a>
				</li>
				<!-- 部门下拉菜单 -->
				<ul id="thisul1" class="nav nav-pills nav-stacked panel-collapse ">
					<#if deplist??>
						<#list deplist as list>
	
							<li style="margin-left: 40px;" class="notfather tongxunluleixing depitem">
								<a href="##" > <span class="glyphicon glyphicon-user"> ${list.deptName}</span>
									<i class="glyphicon pull-right glyphicon-menu-left collapsed" href="##"  data-toggle="collapse" ></i>
								</a>
								<input type="hidden" class="detidchat" value="${list.deptId}">
							</li>								
						</#list>
					</#if>
					
				</ul>
				
				
			</ul>
		</div>

		
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">状态类型</h3>
				<span class="btn btn-default pull-right btn-xs des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked mm">
				<li class="activee">
					<a href="javascript:void(0);" class="meshareother"> 
						<span style="color: #00CC66;" class="glyphicon glyphicon-ok"> </span> 在线用户
					</a>
				</li>
				<li>
					<a href="javascript:void(0);" class="sharewithme">
						<span style="color: #eb9316;" class="glyphicon glyphicon-exclamation-sign"> </span> 禁用名单
					<#-- <#if count gt 0>
						<span class="badge pull-right showcount" style="background-color: #286090;">${count}</span>
					</#if> -->
					
					</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="col-md-9">
		<!--id="container"-->
		<ul class="nav nav-pills nav-justified" id="thispills" style="margin-bottom: 14px;">
		  <li role="presentation" class="active" style="border-left:1px solid #ccc;border-radius: 10px 10px 10px 10px;">
		  <a href="javascript:void(0);">ALL</a></li>
		  <li role="presentation"><a href="javascript:void(0);">A</a></li>
		  <li role="presentation"><a href="javascript:void(0);">B</a></li>
		  <li role="presentation"><a href="javascript:void(0);">C</a></li>
		  <li role="presentation"><a href="javascript:void(0);">D</a></li>
		  <li role="presentation"><a href="javascript:void(0);">E</a></li>
		  <li role="presentation"><a href="javascript:void(0);">F</a></li>
		  <li role="presentation"><a href="javascript:void(0);">G</a></li>
		  <li role="presentation"><a href="javascript:void(0);">H</a></li>
		  <li role="presentation"><a href="javascript:void(0);">I</a></li>
		  <li role="presentation"><a href="javascript:void(0);">J</a></li>
		  <li role="presentation"><a href="javascript:void(0);">K</a></li>
		  <li role="presentation"><a href="javascript:void(0);">L</a></li>
		  <li role="presentation"><a href="javascript:void(0);">M</a></li>
		  <li role="presentation"><a href="javascript:void(0);">N</a></li>
		  <li role="presentation"><a href="javascript:void(0);">O</a></li>
		  <li role="presentation"><a href="javascript:void(0);">P</a></li>
		  <li role="presentation"><a href="javascript:void(0);">Q</a></li>
		  <li role="presentation"><a href="javascript:void(0);">R</a></li>
		  <li role="presentation"><a href="javascript:void(0);">S</a></li>
		  <li role="presentation"><a href="javascript:void(0);">T</a></li>
		  <li role="presentation"><a href="javascript:void(0);">U</a></li>
		  <li role="presentation"><a href="javascript:void(0);">V</a></li>
		  <li role="presentation"><a href="javascript:void(0);">W</a></li>
		  <li role="presentation"><a href="javascript:void(0);">X</a></li>
		  <li role="presentation"><a href="javascript:void(0);">Y</a></li>
		  <li role="presentation" style="border-radius: 0px 5px 5px 0px;"><a href="javascript:void(0);">Z</a></li>
		</ul>
		
		<!-- 右侧显示联系人列表 -->
		<div class="bgc-w box box-primary thistable">
			<!-- 一开始默认加载全部用户 -->
			<#include "usermanage.ftl"/>
		</div>
		
		<input type="hidden" class="sharehidden"/>
	</div>
</div>
<!-- 弹窗 -->
<#include "/common/modalTip.ftl"/>

<script src="js/common/iconfont.js"></script>
<script type="text/javascript">

		$(function() {
			
			
		});
		
		
		
	</script>