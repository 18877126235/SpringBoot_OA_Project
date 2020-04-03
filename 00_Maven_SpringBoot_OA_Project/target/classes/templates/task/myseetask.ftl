<#include "/common/commoncss.ftl">
<link rel="stylesheet" href="css/task/seetask.css" />

	<style type="text/css">
a {
	color: #fff;
}

a:hover {
	text-decoration: none;
	color: #fff;
}

.text{
	min-height: 114px;
}
</style>
		
	<script>
		$(function(){
			$(".ddlstatus").each(function(){
			var options=$(".ddlstatus option:selected");
			
			if(options.val()=="6"||options.val()=="7"){
				$("#save").prop("disabled",true);
			
			}else{
				$("#save").removeAttr("disabled");
			}
		});
			
			
	})
	</script>

	<body>
		<div class="outside">
			<div class="row head">
					<div class="col-md-2">
						<h1 style="font-size:24px;margin: 0;" class="">任务查看</h1>
					</div>
					<div class="col-md-10 text-right right-me">
						<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a>
						>
						<a disabled="disabled">任务查看</a>
					</div>
				</div>
			<div class="containers">
			
				<button type="button" class="bs btn btn-xs btn-default out">
				<a href="javascript:history.back();">
					<span class="glyphicon glyphicon-chevron-left back">返回</span></a>
				</button>
				
				
				<div class="page-header"></div>
				<form action="uplogger"  class="ajaxformsend" >
					<div class="row">
						<div class="box-body" style="margin-left:20px;margin-right: 20px;">
							<div class=" mailbox-read-info">
								<h3>
									<span id="ctl00_cphMain_lblTitle">任务主题：${task.title}</span></h3>
								<#if task.reciverlist??>
								<h5 class="fonts">
								
									<span id="ctl00_cphMain_lblFrom" class="mailbox-read-time">发布人：<i>${user.userName}</i> &nbsp;&nbsp;参加人员：<i>${task.reciverlist}</i></span>
								
									<span id="ctl00_cphMain_lblDate" class="mailbox-read-time pull-right">${task.publishTime}</span>
								</h5>
								</#if>
							</div>
							<div class="mailbox-read-message">
								<span id="ctl00_cphMain_lblDescription">任务描述：${task.taskDescribe}</span>
								<span id="ctl00_cphMain_lblFeedback">
									<h5 style="margin-top: 20px;">
										任务进度（${task.starTime}至 ${task.endTime}）
										<small class="pull-right">${status.statusPrecent}</small>
									</h5>
									<div class="progress xs" style="margin: 10px 0;">
										<div class="progress-bar progress-bar-aqua" style="width: ${status.statusPrecent}" role="progressbar" 
											aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
											</div>
									</div>
									<#list loggerlist as logger>
									<#if logger.loggerStatusid??>
									<!-- 遍历输出修改日志 -->
									
									<#list statuslist as statu>
										<!-- 先要判断状态是否相等 -->
										   <#if logger.loggerStatusid==statu.statusId>
											<div>
												${logger.username}
													<span style="font-size:10pt; color:#CC00CC; margin-left:3px;">${logger.createTime?string('yyyy-MM-dd HH:mm:ss')}</span>
													：将任务状态改为【${statu.statusName}】
											</div>
										</#if>
									
										</#list>
										</#if>
										<!-- 如果有反馈哦内容，就输出 -->
										<#if logger.loggerTicking??>
											<div>
												${logger.username}
													<span style='font-size:10pt; color: #00c0ef; margin-left:3px;'>${logger.createTime?string('yyyy-MM-dd HH:mm:ss')}</span>
													 <font color='red'>反馈：</font>${logger.loggerTicking}
											</div>
										</#if>
									</#list>
									
									
								</span>
								<span id="ctl00_cphMain_lblNote"></span>
							</div>
							<div class="page-header page"></div>
							<div class="col-md-6 form-group" style="margin-left: -12px;margin-right: 12px;">
								<label>
										<span id="ctl00_cphMain_Label1">状态</span>
								</label>
								<div class="form-group">
									<!-- name对应着任务日志表的状态id -->
									<select name="loggerStatusid" id="ctl00_cphMain_ddlStatus" class="form-control select2 ddlstatus">
										<option value="${status.statusId}">${status.statusName}</option>
										
										<#--
										<#if status.statusId == 3>
										<#else>
										<option value="3">新任务</option>
										</#if>
										<#if status.statusId == 4>
										<#else>
										<option value="4">已接收</option>
										</#if>
										<#if status.statusId == 5>
										<#else>
										<option value="5">进行中</option>
										</#if>
										<#if status.statusId == 6>
										<#else>
										<option value="6">已提交</option>
										</#if>
										-->
										
										
									</select>
								</div>
								
								<div class=" form-group">
								<label>
										<span id="ctl00_cphMain_Label2">反馈</span>
								</label>
								<!-- name对应对应任务日志实体类的 loggerTicking属性-->
								<textarea name="loggerTicking"  id="ctl00_cphMain_txtPowerValue" class="form-control fankuidewenbenyu" 
								rows="10px" cols=""></textarea>
								<!-- <input name="loggerTicking" type="text" id="ctl00_cphMain_txtPowerValue" class="form-control" />
								 -->
								<!-- 下面这个隐藏掉 -->
								<input name="taskId" type="text" id="ctl00_cphMain_txtPowerValue" class="form-control" value="${task.taskId}" style="display:none;"/>
								
								</div>
								
							</div>
							
						</div>

					
				</div>
				<!--  
				<div style="display: none ;" class="box-footer foot">
					<input class="btn btn-primary"   id="save" type="submit" value="提交反馈" />
					
				</div>
				-->
			</form>	
			<div class="box-footer foot">
				<input class="btn btn-primary tijianfankui " id="save" type="button" value="提交反馈" />
					<input class="btn btn-default" id="cancel" type="button" value="返回关闭"
					onclick="window.location.href='mytask' " />		
			</div>
			
			</div>
	</div>
	
<script type="text/javascript">
	
	
	
	
	
	$(function(){
		
		//任务反馈方法（点击后使用ajax方式提交表单）
		$(".tijianfankui").click(function(){
			
			//先判断有没有填写反馈
			if( $(".fankuidewenbenyu").val() == '' || $(".fankuidewenbenyu").val() == null ){
				
				swal("请填写反馈内容！","反馈内容不能为空","warning");
	
				return false;
				
			}

			 $.ajax({
					//几个参数需要注意一下
					type: "POST",//提交方式
					contentType:"application/x-www-form-urlencoded", //编码格式
					dataType: "json",//预期服务器返回的数据类型
					url: "ajaxformsend",//url
					data: $(".ajaxformsend").serialize(), //这里提交form表单  .ajaxformsend
					success: function ( taskLogUtil ) {
						
						//清空文本域数据
						$(".fankuidewenbenyu").val('');
						
						//alert("请求成功" + logger );
						//alert( taskLogUtil.username + taskLogUtil.date + taskLogUtil.content );
						//使用jquery的apend添加元素显示
						
						//alert( $("#ctl00_cphMain_lblFeedback").text() );
						
						$("#ctl00_cphMain_lblFeedback").append(
										
								"<div>" + 
										taskLogUtil.username +  
									"	<span style='font-size:10pt; color: #00c0ef; margin-left:3px;'>" + taskLogUtil.date + "</span>\n" + 
									"	<font color='red'>反馈：</font>" + taskLogUtil.content + 
								"</div> "
								
						);
						
						swal("操作成功！","成功新增反馈记录","success");
						
						setTimeout(function(){
							//alert("Hello");
							swal.close();
						},1000);
						
						
					},
					error: function(data) {
						
					}
					
			 	});
			
			
			
		});
		
		
	});

</script>
