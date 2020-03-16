
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
			<table class="table table-hover table-striped  tablebodyxxx">
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
							
							<!-- 当且仅当任务状态为进行中时才显示提交按钮 -->
							<#if task.statusid==5 >
								<a style="margin-left: 2px;" 
									class="label label-success tijiaorenwu"><span class="  glyphicon glyphicon-check"></span>
									提交   
									<input type="hidden" class="renwuid" value="${task.taskid}">
								</a> 
								<#else>
								<a style="margin-left: 2px; background: #D8D8D8;" 
									class="label"><span class="  glyphicon glyphicon-check"></span>
									提交
									<input type="hidden" class="renwuid" value="${task.taskid}">
								</a>
								
							</#if>
							
							
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
		
		
		//点击提交
		//$(".tijiaorenwu").click(function(){
			
		$(".tablebodyxxx").on("click",".tijiaorenwu",function(){
			

			//alert("哈哈哈哈哈");
			
			//获取任务id
			var taskid = $(this).find(".renwuid").val();
			
			//指向当前a标签
			var thistijiao = $(this);
			
			//用于修改任务状态
			var zhuangtainame = $(this).closest("tr").find(".zhuangtai").find("span");
			

			//alert( taskid );
			
			//弹出确认提交任务
			swal({
				
				title: "确定提交任务吗？", 
				text: "提交后将由管理员审核后才能完成任务！", 
				type: "warning",
				showCancelButton: true, 
				confirmButtonColor: "#337ab7",
				confirmButtonText: "确定提交！", 
				cancelButtonText: "取消提交！",
				closeOnConfirm: false, 
				closeOnCancel: false	
				},
				function(isConfirm){ 
				if (isConfirm) {
					
					//通过ajax方式修改任务状态
					$.ajax({
						type:'post',
						url:'yitijiao?id='+taskid,  //访问地址
						dataType:"text",
						success:function(data){
							
							if(data == 'success'){
								
								//修改界面样式
								//修改相关样式
								thistijiao.css("background","#D8D8D8");
								thistijiao.css("pointer-events","none"); //设置当前按钮不可点击
								//修改状态名称显示和背景颜色
								zhuangtainame.text("已提交");
								zhuangtainame.removeClass();//清空所有的样式class
								zhuangtainame.addClass("label label-danger"); //新增样式

								swal("操作成功！","任务已提交，请等候审核","success");
								
							}else{
								
								swal("操作失败！","权限不足");
								
							}
						},
						error:function(){
							swal("操作失败！","权限不足");
							//alert("失败了");
						}
					});

				
					
				} else { 
					
					swal.close();
				} 
			});
			
			
			
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
			
			//alert("哈哈哈");
			
			//thisjieshou.next().css("background","#D8D8D8");
			//thisjieshou.next().css("pointer-events","block");
			
			var tijiaoanniu = $(this).next();
			
			//alert( tijiaoanniu.text() );
			
			
			//tijiaoanniu.removeClass(); //先删除所有样式
			tijiaoanniu.addClass("label label-success tijiaorenwu");
			tijiaoanniu.css("background","#5cb85c");
			
		
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
										
										//然后设置提交按钮可以提交
										
										
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
