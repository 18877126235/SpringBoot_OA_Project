<#include "/common/commoncss.ftl">
<link rel="stylesheet" href="css/common/tanchuang.css" />
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
.reciver{
	position: relative;
    float: right;
    margin-top: -25px;
    right: 5px;
    cursor: pointer;
}
</style>
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">日程查看</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> > <a
			disabled="disabled">日程查看</a>
	</div>
</div>
<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box">
			<!--盒子头-->
			
				<!-- 如果是编辑日程的话就保存日程id -->
				<input name="rcId" type="hidden" value="${(rc.rcId)!''}"/>
				<div class="box-header">
					<h3 class="box-title">
						<a href="javascript:history.back();" class="label label-default" style="padding: 5px;">
							<i class="glyphicon glyphicon-chevron-left"></i> <span>返回</span>
						</a>
					</h3>
				</div>
				<!--盒子身体-->
				<div class="box-body no-padding">
					<div class="box-body">
						
						<div class="row">
							<div class="col-md-6 form-group">
								<label class="control-label"> <span> 发布人</span>
								</label> 
								<select  class="form-control">
									<option value="">${rc.user.userName}</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"> <span> 类型</span>
								</label> <select  class="form-control">
										<option >${map.type}</option>
								</select>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label"> <span>状态</span>
								</label> <select  class="form-control">
										<option value="${map.statuse}">${map.statuse}</option>
								
								</select>
							</div>
	
							<div class="col-md-6 form-group">
								<label class="control-label">开始日期</label>
								<input  class="form-control" id="starTime" 
									value="${(rc.startTime?string('yyyy-MM-dd HH:mm:ss'))!''}"/>
							</div>
							<div class="col-md-6 form-group">
								<label class="control-label">结束日期</label> <input
									 class="form-control" id="endTime" 
									value="${(rc.endTime?string('yyyy-MM-dd HH:mm:ss'))!''}"/>
							</div>
	
							<div class="col-md-6 form-group">
								<label class="control-label"><span>标题</span></label> <input
									 class="form-control" value="${(rc.title)!''}"/>
							</div>
							
							<div class="col-md-6 form-group">
								<label class="control-label"> <span> 接收者名单</span>
								</label>
								<select  class="form-control">
									
									<#list map.users as userslist >
	
										<option value="">${userslist.userName}</option>
	
									</#list> 
								</select>
							</div>
								
							
	
	
	
	
							<div class="col-md-6 form-group">
								<label class="control-label"><span>日程描述</span></label>
								<textarea rows="5" cols="20" class="form-control"
									name="describe" style="margin: 0px -0.5px 0px 0px; height: 114px; width: 522px;">${(rc.describe)!''}</textarea>
							</div>
	
							<div class="col-md-6 form-group">
								<label class="control-label"><span>是否提醒</span></label> <br> 
								<#if rc??>
									<#if rc.isRemind>
										<span class="labels"><label><input    type="checkbox" checked/><i>✓</i></label></span>
									</#if>
								<#else>
									<span class="labels"><label><input  type="checkbox"/><i></i></label></span>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				<!--盒子尾-->
				<div class="box-footer">
					
					<input class="btn btn-default" id="cancel" type="submit" value="关闭"
						onclick="window.history.back();" />
				</div>
	
		</div>
	</div>
</div>


