<#include "/common/commoncss.ftl">
<link rel="stylesheet" type="text/css" href="css/common/box.css" />
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
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">我的日程</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">我的日程</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12 thistable">
		
		<!--id="container"-->
		<#include "/daymanage/daymanagepaging.ftl"/>
	</div>
	
	
	
	<script type="text/javascript">
	
		
		$(function(){
			
			var succcess = '${(success)!}';
			
			
			
			if( succcess != null && succcess != ''){
				swal(succcess,"后台验证成功","success");	
			}
			
			
		});
	
	</script>
</div>


