<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="newdaymanage" class="label label-success" style="padding: 5px;">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</a>
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm"
					placeholder="查找..." />
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default"><span
						class="glyphicon glyphicon-search"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover table-striped">
				<tr>
					
					<th scope="col">类型</th>
					<th scope="col">标题</th>
					<th scope="col">发布时间</th>
					<th scope="col">发布人</th>
					<th scope="col">部门</th>
					<th scope="col">状态</th>
					<!-- 是否有操作权限 -->
					<#if ismyday??>
						<th scope="col">操作</th>
					</#if>
				</tr>
				<#list schedules as schedule>
					<tr>
						<td>
							<!-- 遍历类型表看看当前日程的类型是什么 -->
							<span>
								<#list types as type>
									<#if schedule.typeId == type.typeId>
										<span>${type.typeName} </span>
									</#if>
								</#list>
							</span>
						</td>
						<td><span>${(schedule.title)!''}</span></td>
						<td><span>${(schedule.createTime?string("yyyy-MM-dd HH:mm:ss"))!''}</span></td>
						<td><span>${(schedule.user.userName)!''}</span></td>
						<td><span>${(schedule.user.dept.deptName)!''}</span></td>
						<td>
							<!-- 遍历状态表，显示当前日程的状态 -->
							<#list statuses as status>
								<#if schedule.statusId == status.statusId>
									<div class="label ${status.statusColor}">${status.statusName}</div>
								</#if>
							</#list>
						</td>
						<!-- 是否有操作权限 -->
						<#if ismyday??>
							<td>
							
								<a  href="dayedit_chakan?rcid=${schedule.rcId}" class="label xiugai"><span
									class="glyphicon  glyphicon-eye-open"></span> 
									查看
								</a>
								<#if user.userName == schedule.user.userName>
								
									<a  href="dayedit?rcid=${schedule.rcId}" class="label xiugai"><span
										class="glyphicon glyphicon-edit"></span> 
										修改
									</a> 
									
									<!-- onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');}; " href="dayremove?rcid=${schedule.rcId}" -->
									<a
										onclick="return querenshanchu('${schedule.rcId}')" 
										href="#" class="label shanchu"><span
										class="glyphicon glyphicon-remove shanchu"></span> 删除
										
										
									</a>
									<!-- 否则无法点击修改和删除 -->
									<#else> 
										<a style="background:#C0C0C0 ; width: ;"
											class="label"><span
											class="glyphicon glyphicon-edit"></span> 
											修改
										</a> 
										<a style="background:#C0C0C0 ;"
											 class="label"><span
											class="glyphicon glyphicon-remove"></span> 
											删除
										</a>
									
								</#if>
								
							</td>
						</#if>
						
					</tr>
				</#list>
			</table>
		</div>
	</div>
	<!--盒子尾  分页用-->
	<#include "/common/paging.ftl"/>
	
	<script type="text/javascript">
	
		function querenshanchu(rcid){
			
			//alert(rcid);
			
			//sweet弹窗
			swal({ 
				title: "确定删除吗？", 
				text: "你将无法恢复该日程记录！", 
				type: "warning",
				showCancelButton: true, 
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "确定删除！", 
				cancelButtonText: "取消删除！",
				closeOnConfirm: false, 
				closeOnCancel: false	
				},
				function(isConfirm){ 
				if (isConfirm) { 
					
					
					swal.close();
					
					window.location.href="dayremove?rcid="+rcid; //刷新页面地址
					
				} else { 
					swal.close();
				} 
			});
			
			return false;
		}

	
	</script>
	
</div>
