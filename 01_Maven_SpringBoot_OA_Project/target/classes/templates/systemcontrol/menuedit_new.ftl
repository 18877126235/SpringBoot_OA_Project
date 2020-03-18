<#include "/common/commoncss.ftl">
<style type="text/css">

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
.red{
	color:#d9534f;
	font-weight:100;
	font-size:1px;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h2 style="font-size: 20px; margin: 0;" class="">
			
			<#if biaojishifou?? >
					新建父菜单
					
			</#if> 
			<#if biaojishifouzi?? >
					新建子菜单
					
			</#if>
			
		</h2>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span>首页</a> > <a
			disabled="disabled">新建菜单</a>
	</div>
</div>

<div class="row" style="padding-top: 15px;">

	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box">
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="javascript:history.back();" class="label label-default"
						style="padding: 5px;"> <i
						class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
					</a>
				</h3>
			</div>
			<form action="test111?zuoshangjiaotianjia=1" method="post" id="thisForm" onsubmit="return check();">
				<!--盒子身体-->
				<div class="box-body no-padding">
					<div class="box-body">
						<div class="alert alert-danger alert-dismissable" role="alert"
							style="display: none;">
							错误信息:<button class="close" type="button">&times;</button>
							<span class="error-mess"></span>
						</div>
						<div class="row">
							
							
							<div class="col-md-6 form-group">
								<label class="control-label"><span>名称</span></label> 
								<input  class="form-control mingcheng" value="" name="menuName"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>图标</span> <a href="http://v3.bootcss.com/components/" target="_blank" title="图标参考"><span class="glyphicon glyphicon-list-alt"></span></a></label> 
								<input class="form-control" value="${(menuObj.menuIcon)!'glyphicon-record'}"  name="menuIcon"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>路径</span></label>
								<#if  biaojishifou??> 
										<input disabled="disabled"	class="form-control" value="#" name="menuUrl"/>
									<#else>
										<input	class="form-control" value="${(menuObj.menuUrl)!''}" name="menuUrl"/>
								</#if>
								 
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"><span>排序</span></label>
								 <input type="number" min="0" class="form-control" value="${(menuObj.sortId)!'0'}" name="sortId"/>
							</div>
							
							<div class="col-md-6 form-group">
								<!-- 如果是新建父菜单上级不可编辑 -->
								<label class="control-label"><span>父级</span></label> 
								<#if biaojishifou??>
								
									<input disabled="disabled" 	class="form-control tongbuxianshi" value="默认自己" name="menuUrl"/>

									<#else>
										<select class="form-control" name="parentId">
										 <!-- 显示所有的父菜单选项 -->
										 <#if parentList??>
										 	
										 	 <#list parentList as list>
											 	<option value="${list.menuId}">${list.menuName}</option>
											 </#list>	
										 
										 </#if>
										 
										</select>
								</#if>
	
							</div>
						<div style="padding-top: 30px;" class="col-md-6 form-group">
								
								<!-- 默认显示 -->
								
								<label class="control-label"><span>是否显示</span></label>
								<span class="labels"><label><input name="show" type="checkbox" checked><i>✓</i></label></span>
								
							</div>
						</div>
							
						
					</div>
				
				</div>
				
				<!--盒子尾-->
				<div class="box-footer">
					<input class="btn btn-primary" id="save" type="submit" value="保存" />
					<input class="btn btn-default" id="cancel" type="button" value="取消"
						onclick="window.history.back();" />
				</div>
				
			</form>
		
		
		</div>
		
	</div>
	
	
</div>



<script type="text/javascript">
//返回上个页面
$('.successToUrl').on('click',function(){
	window.location.href='/testsysmenu';
});


	$(".mingcheng").blur(function(){
		
		//alert("hellow");
		$(".tongbuxianshi").val($(this).val());
		
	});
	
//表单提交前执行的onsubmit()方法；返回false时，执行相应的提示信息；返回true就提交表单到后台校验与执行
function check() {

	//提示框可能在提交之前是block状态，所以在这之前要设置成none
	$('.alert-danger').css('display', 'none');
	
	var isRight = 1;
	
	$('.form-control').each(function(index) {
		// 如果在这些input框中，判断是否能够为空
		if ($(this).val() == "") {
			
			//alert("请完善数据填写");
			
			swal("请完善数据填写","","warning");
			isRight = 0;
			return false; //中断循环
		} 
	});
	
	if (isRight == 0) {
		//modalShow(0);
		 return false;
		 
	} else if (isRight == 1) {
		//modalShow(1);
		// return true;
		return true;
	}
	
//	return false;
}

</script>

