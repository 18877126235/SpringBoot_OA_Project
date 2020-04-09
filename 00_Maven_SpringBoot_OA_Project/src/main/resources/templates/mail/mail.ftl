
<#include "/common/commoncss.ftl"> 
<script type="text/javascript" src="js/common/iconfont.js"></script> 
<script charset="utf-8" src="plugins/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="plugins/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="js/mail/mail.js" ></script>
<link rel="stylesheet" href="plugins/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="css/mail/mail.css" />
<link rel="stylesheet" href="css/common/iconfont.css" />

<style>
	


</style>


<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">系统邮件
			<a href="" class="label xinzeng" style="padding: 5px;margin-left:5px;">
						<span class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
		</h1>
		
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">系统邮件管理</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-3">
		<a class="btn btn-info write"
			style="width: 100%; margin-bottom: 20px;"> <span
			class="glyphicon glyphicon-pencil"></span> 写信
		</a>
		<div class="bgc-w box box-solid">
			<div class="box-header">
				<h3 class="box-title">全部邮件</h3>
				<span class="btn btn-xs btn-default pull-right des mm"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked files emailtypename">
				<li style="border-left: 3px solid blue;" class="getmail"><span
					class="glyphicon glyphicon-inbox le"> 收件箱 </span>
					<#if noread==0>
					<#else>
					 <span class="pull-right uncheck"><i class="btn btn-xs btn-primary">${noread}</i></span>
					</#if>
					<input class="yincangzhi" type="hidden" value="shoujianxiang">
				</li>
				<li class="setmail"><span class="glyphicon glyphicon-envelope le"> 发件箱</span>
					<#if push==0>
					<#else>
					<#-- 显示邮件条目数字 -->
					<span class="pull-right uncheck"><i class="btn btn-xs btn-primary">${push}</i></span>
					</#if>
					<input class="yincangzhi" type="hidden" value="fajianxiang">
				</li>
				<li class="caogao"><span class="glyphicon glyphicon-list-alt le"> 草稿箱</span> 
					<#if nopush==0>
					<#else>
					<span class="pull-right uncheck"><i class="btn btn-xs btn-primary">${nopush}</i></span>
					</#if>
					<input class="yincangzhi" type="hidden" value="caogaoxiang">
				</li >	
				<li class=" rubbish"><span class="glyphicon glyphicon-trash le"> 垃圾箱</span>
					<#if rubbish==0>
					<#else>
					<span class="pull-right uncheck"><i class="btn btn-xs btn-primary">${rubbish}</i></span>
					</#if>
					<input class="yincangzhi" type="hidden" value="lajixiang">
				</li>
			</ul>
		</div>

		<div class="bgc-w box box-solid">
		
			<div class="box-header">
				<b><h3 class="box-title">收件类型</h3></b>
				<span class="btn btn-xs btn-default pull-right des"> <i
					class="glyphicon glyphicon-minus"></i>
				</span>
			</div>
			<ul class="nav nav-pills nav-stacked fff shoujianleixing">
				<!-- 
				<li class="mail"><svg class="icon le " aria-hidden="true">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;邮件</li>
				<li class="tongzhi"><svg class="icon le " aria-hidden="true">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;通知</li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: red;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;公告</li>
				 -->
				
				<li style="" class="gonggao"><svg class="icon le " aria-hidden="true" style="color: green;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">已读</span></li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: red;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">未读</span></li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: #eb9316;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">星标</span></li>
				<li class="gonggao"><svg class="icon le " aria-hidden="true" style="color: #337ab7;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">有附件</span></li>
			</ul>
			
			<!-- 发件类型 -->
			<div class="box-header">
				<h3 class="box-title">发件类型</h3>
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
			
				<li class=""><svg class="icon le " aria-hidden="true" style="color: #eb9316;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname">星标</span></li>
				<li class=""><svg class="icon le " aria-hidden="true" style="color: #337ab7;">
								<use xlink:href="#icon-kongxinquan"></use>
							</svg>&nbsp;&nbsp;&nbsp;<span class="tiaomuname" >有附件</span></li>
			</ul>
		</div>
	</div>
	<div class="col-md-9 set">
	
		<#-- 右侧显示邮件列表 -->
		<#include "/mail/allmail.ftl">
		
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
	
	$(function(){
		//点击相应主题显示相关邮件
		$('.getmail').on('click',function(){
			$('.set').load('amail',{title:"收件箱"});
			removeliclass();
		});	
		$('.setmail').on('click',function(){
			$('.set').load('amail',{title:"发件箱"});
			removeliclass();
		});
		$('.caogao').on('click',function(){
			$('.set').load('amail',{title:"草稿箱"});
			removeliclass();
		});
		$('.rubbish').on('click',function(){
			$('.set').load('amail',{title:"垃圾箱"});
			removeliclass();
		});
		
		//写信
		$('.write').on('click',function(){
		
			//alert("哈哈");
			$('.set').load('wmail');
			
		});
		
		 /*$(".mail").click(function(){
				var title=$(".titles").text();
			   $(".thistable").load("mailtitle",{val:"邮件",title:title});
		   });
		 $(".tongzhi").click(function(){
			   var title=$(".titles").text();
			  $(".thistable").load("mailtitle",{val:"通知",title:title});
		   });
		 $(".gonggao").click(function(){
			 	var title=$(".titles").text();
			  $(".thistable").load("mailtitle",{val:"公告",title:title});
		   });*/
		 
		 //点击发件类型条目
		$(".fajianleixing li").click(function(){
			
			//alert("你大爷");
			//$(this).css('border-left-color','#3c8dbc');
			//遍历上面的几个模块菜单，为对应的名称设置左边框颜色
			$(".yincangzhi").each(function(){
				
				//alert( $(this).val() );
				if( $(this).val() == 'fajianxiang' ){
					//alert("jjj");
					typeli=$(this).parent();
					
				}
				$(this).parent().css('border-left-color','')
				
			});
			typeli.css('border-left-color','#3c8dbc');
			
			
			//先遍历删除所有的样式
			removeliclass();
			//再为当前元素赋值
			$(this).css('border-left-color','#3c8dbc');
			
			//最后发送ajax方法加载邮件列表
			//先获取当前类型名称
			var typename = $(this).find(".tiaomuname").text();
			//alert(typename);
		});
		
		//点击收件类型条目
		$(".shoujianleixing li").click(function(){
			
			var typeli;
			//遍历上面的几个模块菜单，为对应的名称设置左边框颜色
			$(".yincangzhi").each(function(){
				
				//alert( $(this).val() );
				if( $(this).val() == 'shoujianxiang' ){
					//alert("jjj");
					typeli=$(this).parent();
					
				}
				$(this).parent().css('border-left-color','')
				
			});
			typeli.css('border-left-color','#3c8dbc');
		
			
			
			//alert("你大爷");
			//先遍历删除所有的样式
			removeliclass();
			//再为当前元素赋值
			$(this).css('border-left-color','#3c8dbc');
			
			var typename = $(this).find(".tiaomuname").text();
			//alert(typename);
			$('.set').load('amail2',{title:"收件箱",typename:typename});
			
		}); 
		
	});
</script>
