<div class="col-md-12 green" >
	<!--导航栏左侧按钮，-->
	
	<ul class="nav navbar-nav navbar-left" style="margin-left: -15px;">
	
		<li><a href="#" class="green-none white"><span
				class="glyphicon glyphicon-menu-hamburger"></span>
				展开/隐藏
			</a></li>
	</ul>
	
	<!--右侧导航栏-->
	<ul class="nav navbar-nav navbar-right moredeep">
		
		<!-- 公告通知图标 -->
		<li>
			<!-- <a href="javascript:changepath('/infromlist');" class="green-none white"><span -->
			<a href="javascript:changepath('/nitifyall');" class="green-none white"><span
				class="glyphicon glyphicon-bell"></span>
				<#if notice==0>
					<span class="badge blue-badge badge-notice"></span>
				<#else>
					<span class="badge blue-badge badge-notice">${(notice)!''}</span>
				</#if>
			</a>
		</li>
		
		<!-- 邮件通知图标 -->
		<li><a href="javascript:changepath('/mail');" class="green-none white"><span
				class="glyphicon glyphicon-envelope"></span>
				<#if mail==0>
					<span class="badge yellow-badge badge-mail"></span>
				<#else>
					<span class="badge yellow-badge badge-mail">${(mail)!''}</span>
				</#if>
				</a>
		</li>
		
		<!-- 任务通知图标 -->
		<li><a href="javascript:changepath('/mytask');" class="green-none white"><span
				class="glyphicon glyphicon-flag"></span>
				<#if task==0>
					<span class="badge red-badge"></span>
				<#else>
					<span class="badge red-badge">${(task)!''}</span>
				</#if>
				</a>
		</li>
		
		
		<li class="dropdown">
		<!--设置导航栏头像面板--> 
		<a href="#" class="green-none white" data-toggle="dropdown">
				<!-- 头像 -->
				<img src="/image/${(user.imgPath)!'/timg.jpg'}" class="user-image" /> 
				<!-- 用户名 -->
				<span>${user.userName}</span>
		</a> 
		<!--设置点击按钮弹出用户面板层-->
			<ul class="dropdown-menu" style="padding:0;">
				<li class="user-header" style="background:#00c0ef ;"><img src="/image/${(user.imgPath)!'/timg.jpg'}"
					class="img-circle" style="width: 100px;height:100px;" />
					<p class="white" style="">
						<span>${user.dept.deptName} </span> / <span> ${user.role.roleName}</span><br> <small>${user.position.name}</small>
					</p></li>
				<li class="user-footer">
					<div class="pull-left">
						<a href="javascript:changepath('userpanel');" class="btn btn-default">用户面板</a>
					</div>
					<div class="pull-right">
						<a href="#" class="btn btn-danger tuichudenglu">退出登录</a>
					</div>
				</li>
			</ul>
			
		</li>

		<li style="position: relative;"><a  id="history" class="green-none white" data-toggle="dropdown"><span
				class="glyphicon glyphicon-time"></span></a>
				
		<ul id="historypanel" class="dropdown-menu"
				style="position: absolute; background-color: #222d32;">
				
				<!-- 用户历史记录表 -->
				<#include "/user/userlog.ftl"/>
				
		</ul>
	</li>
</ul>
</div>
<script>


	$(".tuichudenglu").click(function(){
		
		  swal({ 
				title: "确定退出登录吗？", 
				text: "若在考勤时间内退出，半小时后不上线将被视为早退处理！", 
				type: "warning",
				showCancelButton: true, 
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "确定退出！", 
				cancelButtonText: "取消退出！",
				closeOnConfirm: false, 
				closeOnCancel: false	
				},
				function(isConfirm){ 
				if (isConfirm) { 
					
					
					swal.close();
					
					//使用定时器延时一段时间，达到更好的用户体验
					setTimeout(function(){
						window.location.href="loginout";
					},200);
					
					
				} else { 
					swal.close();
				} 
			}); 
		
		
		
		return false;
	});

	//新邮件图标提示
	function changeemail(){
		//alert("来了老弟");
		var email=$('.badge-mail').text().trim();
		var emailNum=parseInt(email);
		if(emailNum>1){
			$('.badge-mail').text((emailNum-1));
		}else{
			$('.badge-mail').text("");
		}
	}
	
	
	function changeinformation(){
		var email=$('.badge-notice').text().trim();
		var emailNum=parseInt(email);
		if(emailNum>1){
			$('.badge-notice').text((emailNum-1));
		}else{
			$('.badge-notice').text("");
		}
	}
	//从右往左滑动效果（点击了历史记录）
	$(function() {
		var num = 1;
		$("#history").click(function() {
			num++;
			if (num % 2 == 0) {
				$("#historypanel").css({ //从右边飞入，使用绝对定位来操作 
					"width" : "230px",
					"right" : "-230px"
				}).show().animate({
					"right" : "0"
				}, "fast");
			} else
				$("#historypanel").animate({
					"width" : "toggle"
				}, "slow");
			$('#historypanel').load('/userlogs');

		})
	})
</script>