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

.text {
	min-height: 114px;
}
</style>
<script>
			$(function(){
				
				
				$(".ddlstatus").each(function(){
					var options=$(".ddlstatus option:selected");
						
					
					if(options.val()=="7"){
						$("#save").prop("disabled",true);
					
					}else{
						$("#save").removeAttr("disabled");
					}
			});
			});
		</script>
</head>

<body>
	<div class="outside">
		<div class="row head">
			<div class="col-md-2">
				<h1 style="font-size: 24px; margin: 0;" class="">任务查看</h1>
			</div>
			<div class="col-md-10 text-right right-me">
				<a href="##"><span class="glyphicon glyphicon-home"></span> 首页</a> >
				<a disabled="disabled">任务查看</a>
			</div>
		</div>
		<div class="containers">

			<button type="button" class="bs btn btn-xs btn-default out">
				<a href="javascript:history.back();"> <span
					class="glyphicon glyphicon-chevron-left back">返回</span></a>
			</button>
			
			<div class="page-header"></div>
			<form action="tasklogger">
				<div class="row">
					<div class="box-body"
						style="margin-left: 20px; margin-right: 20px;">
						<div class=" mailbox-read-info">
							<h3>
								<span id="ctl00_cphMain_lblTitle">任务主题：${task.title}</span>
							</h3>
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
									任务进度（${task.starTime}至 ${task.endTime}） <small
										class="pull-right">${status.statusPrecent}</small>
								</h5>
								<div class="progress xs" style="margin: 10px 0;">
									<div class="progress-bar progress-bar-aqua"
										style="width:${status.statusPrecent}" role="progressbar"
										aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
									</div>
								</div> <#list loggerlist as logger>
								 	<#if logger.loggerStatusid??>
									<#list statuslist as statu>
									<#if logger.loggerStatusid==statu.statusId>
									<div>
										${logger.username}
											<span style="font-size:8pt; color:#999; margin-left:3px;">${logger.createTime}</span>
											：将任务状态改为【${statu.statusName}】
									</div>
									</#if>
									</#list>
									</#if>
									
									<#if logger.loggerTicking??>
									<div>
										${logger.username}
											<span style="font-size:8pt; color:#999; margin-left:3px;">${logger.createTime}</span>
											反馈：${logger.loggerTicking}
									</div>
									</#if>
									</#list>
							</span> <span id="ctl00_cphMain_lblNote"></span>
						</div>
						<div class="page-header page"></div>
						<div class="col-md-6 form-group"
							style="margin-left: -12px; margin-right: 12px;">
							<label> <span id="ctl00_cphMain_Label1">任务总状态</span>
							</label>
							<div class="form-group">
								<select name="loggerStatusid" id="ctl00_cphMain_ddlStatus"
									class="form-control select2 ddlstatus">
									
									<option value="${status.statusId}">${status.statusName}</option>
									<#if status.statusId==5> <#else>
									<option value="5">进行中</option></#if>
									<#if status.statusId==7> <#else>
									<option value="7">已完成</option></#if>

								</select>
							</div>
							<div class=" form-group">
								<label> <span id="ctl00_cphMain_Label2">反馈回复   
								
								<span style=" margin-left: 2px; "  class="btn btn-success"><span class="  glyphicon glyphicon-check"></span>
									提交反馈
								</span>
								
								</span>
								</label> 
								
									<textarea name="loggerTicking" 
										id="ctl00_cphMain_txtPowerValue" class="form-control" rows="10px" cols=""></textarea> 
									
									<input
									name="taskId" type="text" id="ctl00_cphMain_txtPowerValue"
									class="form-control" value="${task.taskId}"
									style="display: none;" />
								
							</div>
						</div>
						
						
						
						
						
						
						
						<div class="col-md-6 form-group" style="margin-left: -12px; margin-right: 12px;">
						
						
							<label> 
								<span id="ctl00_cphMain_Label1">任务接收者状态</span>
							</label>
						
							<div class="dropdown">
							  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
							    	查看各人员任务进度
							    <span class="caret"></span>
							  </button>
							  <ul class="dropdown-menu" aria-labelledby="dropdownMenu4">
							  	<#list taskusers as taskuser >
						  			
						  			<!-- 已提交的就可以点击 -->
						  			<#if  taskuser.statusId == 6 >
						  				<li>
											<a href="#">
												${taskuser.userId.userName}
												<span class="label label-danger">
													已提交
												</span>
										 	</a> 
										</li> 
						  				<!-- 否则只能查看 -->
						  				<#else>
						  				<li class="disabled" >
									
											<a href="#">
												${taskuser.userId.userName}
												
													<#if taskuser.statusId == 5 >
														<span class="label label-primary">
															进行中 
														</span>
													</#if>
													<#if taskuser.statusId == 3 >
														<span class="label label-warning">
															待接收
														</span> 
													</#if>
													
													<#if taskuser.statusId == 6 >
														<span class="label label-danger">
															已提交
														</span> 
													</#if>
													
													<#if taskuser.statusId == 7 >
														<span class="label label-success">
															已完成
														</span>  
													</#if>	
										 	</a>
										</li>  
						  				
						  			</#if>
									

							  	</#list>
							  	
								  
								  <!-- <li ><a href="#">Disabled link</a></li> -->
								  
								 
							   </ul>
							</div>
								
							
						</div>
						
						
						
						
						
					</div>


				</div>

				<div class="box-footer foot">
					<input class="btn btn-primary" id="save" type="submit" value="保存状态" />
					<input class="btn btn-default" id="cancel" type="button" value="取消返回"
						onclick="window.history.back();" />
				</div>

			</form>
		</div>
	</div>