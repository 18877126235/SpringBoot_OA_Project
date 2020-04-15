
<#include "/common/commoncss.ftl"> 
<script type="text/javascript" src="js/common/iconfont.js"></script> 
<script charset="utf-8" src="plugins/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="plugins/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="js/mail/mail.js" ></script>
<link rel="stylesheet" href="plugins/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="css/mail/mail.css" />
<link rel="stylesheet" href="css/common/iconfont.css" />

<style>
	a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}

.c {
	font-weight: 600;
}

.paixu:HOVER {
	cursor: pointer;
	color: #337ab7;
}


</style>


<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">通知列表
			<!--  -->
			<a href="" class="label xinzeng" style="padding: 5px;margin-left:5px;">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</a>
		</h1>
		
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">通知列表</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-3">
		
		
		
		<#if hasrole??>
			<a href="informedit" class="btn btn-info write"
				style="width: 100%; margin-bottom: 20px;"> <span
				class="glyphicon glyphicon-pencil"></span> 新增公告
			</a>
			<#else>
				<a class="btn btn-default"
					style="width: 100%; margin-bottom: 20px;"> <span
					class="glyphicon glyphicon-pencil"></span> 新增公告
				</a>
		</#if>
		
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">全部通知</h3>
				<span class="btn btn-xs btn-default pull-right des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked files emailtypename">
				<li style="border-left: 3px solid blue;" class="infoall ischeck"><span
					class="glyphicon glyphicon-th  le"> 全部公告 </span>
					<input class="yincangzhi" type="hidden" value="all">
				</li>
				<li  class="infocompny"><span
					class="glyphicon glyphicon-inbox le"> 公司公告 </span>
					<input class="yincangzhi" type="hidden" value="company">
				</li>
				<li  class="infomdep"><span
					class="glyphicon glyphicon-inbox le"> 部门公告 </span>

					<input class="yincangzhi" type="hidden" value="dept">
				</li>
			</ul>
		</div>

		<div class="bgc-w box box-solid">
		
			<div class="box-header">
				<b><h3 class="box-title">通知状态</h3></b>
				<span class="btn btn-xs btn-default pull-right des"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked fff shoujianleixing">
				
				
				<li style="" class="gonggao"><svg class="icon le " aria-hidden="true" style="color: red;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">重要</span></li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: #eb9316;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">紧急</span></li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: #337ab7;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">一般</span></li>
				
			</ul>
			
			<!-- 发件类型(从邮箱界面copy过来的，就不做改变了呢) -->
			<div class="box-header">
				<h3 class="box-title">已读状态</h3>
				<span class="btn btn-xs btn-default pull-right des"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked fff fajianleixing">
				<!-- 
				<li class="mail"><svg class="icon le " aria-hidden="true">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;邮件</li>
				<li class="tongzhi"><svg class="icon le " aria-hidden="true">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;通知</li>
				<li class=""><svg class="icon le " aria-hidden="true" style="color: red;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;公告</li>
				 -->
			
				<li class=""><svg class="icon le " aria-hidden="true" style="color: green;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">  已读 
							<input type="hidden" class="yincangzhi" value="isRead" >
							</span></li>
				<li class=""><svg class="icon le " aria-hidden="true" style="color: red;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname" >  未读
							<input type="hidden" class="yincangzhi" value="notRead" >
							</span></li>
			</ul>
		</div>
	</div>
	
	<div  class="col-md-9 set">
	
		
		<div class="row" style=" padding-top: 0px;">
			<div class="col-md-12 thistable">
				<!--id="container"-->
				<#include "informlistpaging.ftl"/>
			</div>
		</div>

	</div>
	
</div>

<!-- 弹窗提示 -->
<#include "/common/modalTip.ftl"/> 

<script>
	//删除左边框颜色的函数
	function removeliclass(){
		$(".fajianleixing li").each(function(){
			
			$(this).css('border-left-color','');
			
			
		});$(".shoujianleixing li").each(function(){
			
			$(this).css('border-left-color','');
			
		});
	}
	
	//删除上方全部、公司、部门的选中状态
	function remocheck(){
		
		$(".emailtypename li").each(function(){

			
			if( $(this).hasClass('ischeck') ){
				$(this).removeClass("ischeck");
			}
			
		});
		
		
	}
	
	
	
	$(function(){
		//点击相应主题显示相关公告
		
		//点击全部公告
		$('.infoall').on('click',function(){
			$('.thistable').load('infolist3',{title:"all"});
			remocheck();
			$(this).addClass("ischeck");
			removeliclass();
		});	
		//点击公司公告
		$('.infocompny').on('click',function(){
			$('.thistable').load('infolist1',{title:"company"});
			remocheck();
			$(this).addClass("ischeck");
			removeliclass();
		});	
		//点击部门公告
		$('.infomdep').on('click',function(){
			$('.thistable').load('infolist2',{title:"dept"});
			remocheck();
			$(this).addClass("ischeck");
			removeliclass();
		});
		
		
		 //点击发件类型条目
		$(".shoujianleixing li").click(function(){
			
			//alert("你大爷");
			
			removeliclass(); //清除其他选项的左边框
			//再为当前元素赋值
			$(this).css('border-left-color','#3c8dbc');

		});
		
		//点击收件类型条目（这里是已读和未读公告，主要实现这里）
		$(".fajianleixing li").click(function(){
			
			
			//先遍历删除li标签的所有的样式
			removeliclass();
			//再为当前元素赋值
			$(this).css('border-left-color','#3c8dbc');
			
			//获取上面选中的是全部、还是公司、还是部门
			var type = $(".ischeck").find(".yincangzhi").val();
			//alert( type );
			var isRead = $(this).find(".tiaomuname").find(".yincangzhi").val();
			//alert(isRead);
			
			//发送load请求后台显示
		
			//alert(type + isRead );
			if( type == 'all' ){
				
				if( isRead == 'notRead' ){
					$('.thistable').load('quanbuweidu');
				}else{
					$('.thistable').load('quanbuyidu');
				}
			}else if( type == 'company' ){
				if( isRead == 'notRead' ){
					$('.thistable').load('infomCompanyNotRead');
				}else{
					$('.thistable').load('infomCompanyIsRead');
				}
			}else if( type == 'dept' ){
				if( isRead == 'notRead' ){
					$('.thistable').load('infomDeptNotRead');
				}else{
					$('.thistable').load('infomDeptIsRead');
				}
			}
			
			
		});
		
	});
	
	
	
</script>
