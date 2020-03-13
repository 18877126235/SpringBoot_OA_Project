
<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="addtask" class="label " style="padding: 5px;"> <span
				class="glyphicon glyphicon-plus"></span>
			</a>
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm cha"
					placeholder="查找..." />
				<div class="input-group-btn chazhao">
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
				<thead>
					<tr>

						<th scope="col">类型</th>
						<th scope="col">标题</th>
						<th scope="col">发布时间</th>
						<th scope="col">发布人</th>
						<th scope="col">部门</th>
						<th scope="col">状态</th>
						<th scope="col">操作</th>
					</tr>
				</thead>
				<tbody >
					<#list tasklist as task>
					<tr>

						<td><span>${task.typename}</span></td>

						<td><span>${task.title}</span></td>
						<td><span>${task.publishtime}</span></td>

						<td><span>${task.username}</span></td>
						<td><span>${task.deptname}</span></td>
						<#if task.cancel==true>
						<td><span class="label label-default">已取消</span></td>
						<#else>
						<td class="zhuangtai"><span class="label ${(task.statuscolor)!''}">${(task.statusname)!''}</span></td></#if>

						<td>
						
							<a href="myseetasks?id=${task.taskid}"
								class="label xiugai"><span class="glyphicon glyphicon-search"></span>
								查看与反馈
							</a> 
								<!-- 判断任务是否已经撤销 -->
								<#if task.cancel==true> 
								<a
									href="myshanchu?id=${task.taskid}"
									onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};"
									class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除
								</a> <#else>
								</#if>
							<!-- <a  href="myseetasks?id=${task.taskid}" -->	
							
							<!-- 如果是新任务，则显示接收按钮 -->
							<#if task.statusid==3>
							
								<a class="label label-info jieshourenwu">
									<span class=" glyphicon glyphicon-play"></span>
										接收
									<input type="hidden" class="renwuid" value="${task.taskid}">
								</a> 
							<#else>
								<a style="background: #D8D8D8 ;" class="label label-info">
									<span class=" glyphicon glyphicon-play"></span>
										接收
									<input type="hidden" class="renwuid" value="${task.taskid}">
								</a> 
							
								
								
							</#if>
							

							<a style="margin-left: 2px;" 
								class="label label-success tijiaorenwu"><span class="  glyphicon glyphicon-check"></span>
								提交
							</a> 
							
						</td>
						
					</tr>
					</#list>
				</tbody>

			</table>
		</div>
	</div>
	<!--盒子尾-->
	<#include "/common/paging.ftl">
</div>


<!-- 点击提交弹出模态框有点难了（搞两个隐藏的input来存储任务id数据） -->



<script>

	

	$(function() {
		
		
		//点击提交弹出模态框
		$(".tijiaorenwu").click(function(){
			
			alert("哈哈哈哈哈");
			
		});
		
		//点击接受任务执行
		$(".jieshourenwu").click(function(){
			
			
			//$(this).removeClass("jieshourenwu");  pointer-events:none;     css("background","pink")
			

			//获取任务id
			var taskid = $(this).find(".renwuid").val();
			//当前a标签对象
			var thisjieshou = $(this);		
			
			//用于修改任务状态
			var zhuangtainame = $(this).closest("tr").find(".zhuangtai").find("span");
			
			
			swal({
				  title: '任务接收提示',
				  text: "你确定接收并开始任务吗？",
				  type: 'warning',
					showCancelButton: true, 
					confirmButtonColor: "#3085d6",
					confirmButtonText: "确定开始！", 
					cancelButtonText: "延迟取消！",
					closeOnConfirm: false, 
					closeOnCancel: false	
					},
					function(isConfirm) {
					  if (isConfirm) {
						
							//使用ajax异步的方式修改任务状态
							$.ajax({
								type:'post',
								url:'xiugairenwuzhuangtai?id='+taskid,
								dataType:"text",
								success:function(data){
									
									if(data == 'success'){
										swal("操作成功！","任务已经开始，请按时完成","success");
										//修改相关样式
										thisjieshou.css("background","#D8D8D8");
										thisjieshou.css("pointer-events","none");
										//修改状态名称显示和背景颜色
										zhuangtainame.text("进行中");
										zhuangtainame.removeClass();//清空所有的样式class
										zhuangtainame.addClass("label label-primary");
										//自动消失
										setTimeout(function(){
											//alert("Hello");
											swal.close();
										},1500);
										
										
										
										
									}else{
										swal("操作失败！","权限不足");
										
									}
								},
								error:function(){
									alert("失败了");
								}
							});

						//swal.close();
					  } else { 
						
						  swal.close();
					  } 
				});
			
			
		});
		
		
		/* 分页插件按钮的点击事件 */
		
		$('.baseKetsubmit').on('click',function(){
			var baseKey=$('.baseKey').val();
			$('.thistable').load('mychaxun?baseKey=baseKey');
		});
		
		$(".chazhao").click(function() {
			var con = $(".cha").val();
			$(".thistable").load("mychaxun", {title : con});
		});
	})
</script>
