<#include "/common/commoncss.ftl">
<#include "/common/modalTip.ftl"/> 
<style type="text/css">
a {
	color: black;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
</style>

	
	<!-- 用户信息面板 -->
	<div class="row" style="padding-top: 15px;">
		<div class="col-md-12 thistable">
			<!--id="container"-->
			<#include "/user/usermanagepaging.ftl"/>
		</div>
	</div>
	
	
<script type="text/javascript">

	//查找用户
	$(".thistable").on("click",".usersearchgo",function(){
		var usersearch = $(".thistable .usersearch").val();
		console.log(usersearch);
		$(".thistable").load("usermanagepaging",{usersearch:usersearch});
	});
	
</script>