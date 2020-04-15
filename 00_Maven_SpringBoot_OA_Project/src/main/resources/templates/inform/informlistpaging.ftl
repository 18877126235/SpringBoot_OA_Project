<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="" class="label label-success" style="padding: 5px;margin-left:5px;">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</a>
			
			
			<#if userId!=1> 
								<#--  -->
								<#else> 
								<a  href="##" id="quanxuan" class="label label-warning" style="padding: 5px;margin-left:5px;">
									<span class="glyphicon glyphicon-ok"></span> 全选
								</a>
							
								<a href="#" id="deleteAll" class="label label-danger" style="padding: 5px;margin-left:5px;">
									<span class="glyphicon glyphicon-remove"></span> 删除选中
								</a>
						</a></#if>
			
			
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm baseKey" placeholder="按标题查找"  value="${(baseKey)!''}"/>
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default baseKetsubmit inputsearch "><span
						class="glyphicon glyphicon-search"></span></a>
				</div>
			</div>
		</div>
	</div>
	<!--盒子身体-->
	<div class="box-body no-padding">
		<div class="table-responsive">
			<table class="table table-hover">
				<tr>
					
					<#if userId != 1> 
								<#--  -->
								<#else> 
								<th scope="col"><span class="paixu thistype">
									选中
								</th>
							
						</#if>
					<#-- 隐藏的一列id用来处理删除全操作的 -->
					<th style="display: none;" >id</th>
					
					<th scope="col"><span class="paixu thistype">类型
						<#if type?? && icon??>
						<span class="glyphicon ${icon}"></span>
						</#if>
						</span></th>
					<th scope="col"><span class="paixu thisstatus">状态
						<#if status?? && icon??>
							<span class="glyphicon ${icon}"></span>
						</#if>
						</span></th>
					<th scope="col">标题</th>
					<th scope="col"><span class="paixu thistime">发布时间
						<#if time?? && icon??>
							<span class="glyphicon ${icon}"></span>
						</#if>
						</span></th>
					<th scope="col">发布人</th>
					<th scope="col">部门</th>
					<th scope="col">置顶</th>
					
					
					<th scope="col">已读</th>
					
					
					<th scope="col">操作</th>
				</tr>
				<#list list as this>
				<tr>
				
					<#if userId!=1> 
								<#--  -->
								<#else> 
								<td>
									<span class="labels">
										<label>
											<input type="checkbox" class="dianji" >
											<i>✓</i>
										</label>
									</span>
								</td>
							
						</a></#if>
				
					<td style="display: none;" >${this.notice_id}</td>
					<td>
						${this.type} 
					</td>
					<td><span class="label ${(this.statusColor)!''}">${this.status}</span></td>
					<#if this.is_read==0>
					<td class="c"><span>${(this.title)!''}</span></td>
					<#else>
					<td><span>${(this.title)!''}</span></td>
					</#if>
					<td><span>${this.notice_time}</span></td>
					<td><span>${this.userName}</span></td>
					<td><span>${this.deptName}</span></td>
					<#-- 以下是置顶 -->
					<#if this.is_top==1>
						<td><span class="labels"><label><input
								type="checkbox" checked disabled><i>✓</i></label></span></td>
					<#else>
						<td><span class="labels"><label><input
								type="checkbox" disabled><i>✓</i></label></span></td>
					</#if>
					<#-- 以下是显示连接 
					<#if this.url!=''>
						<td><span class="glyphicon glyphicon-link"></span></td>
						<#else>
							td><span class="labels"></span>
								哈哈哈
							</td>
					</#if>
					-->
					<#-- 以下是显示是否已读 -->
					<#if this.is_read!=0>
						<td style="color: green;" >
							已读
						</td>
						<#else>
							<td style="color: red;" >
								未读
							</td>
					</#if>
					
					<td>
						<a href="informshow?id=${this.notice_id}&read=${this.is_read}&relationid=${this.relatin_id}&isnew=not"
						class="label xiugai chakan"><span class="glyphicon glyphicon-search"></span>
							查看</a> 
							<#--<#if this.contain!=1>
								<#if this.contain==3>
									<a href="forwardother?noticeId=${this.notice_id}" onclick="{return confirm('确定转发给自己的下属吗？');};" class="label xinzeng chakan forwardthis"><span class="glyphicon glyphicon-log-out"></span>
									转发</a> 
								<#else>
									<a href="javascript:void(0);" class="label sheding chakan"><span class="glyphicon glyphicon-log-out"></span>
									已转发</a> 
								</#if>
							</#if>-->
							
							<#if this.is_read==0> 
								<#-- 
								<#else> 
								<a onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};"
								href="informlistdelete?id=${this.notice_id}" class="label shanchu  "> 
								<span class="glyphicon glyphicon-remove"></span> 删除
							 -->
						</a></#if>
						
						<#if userId!=1> 
								
							<#else> 
								<a 
								href="##" class="label shanchu yibushanchu"> 
								<span class="glyphicon glyphicon-remove"></span> 删除
								<input type="hidden" class="yincangzhi" value="${this.notice_id}">
								</a>
						</#if>
						</td>
				</tr>
				</#list>
			</table>
		</div>
	</div>
	<!--盒子尾-->
	<#include "/common/pagingmybatis.ftl">
</div>
<script>
	$(function(){
		
		//点击搜索框后设置全部
		$(".inputsearch").click(function(){
			
			//alert("哈哈哈");
			
		});
		
		$(".yibushanchu").click(function(){
			
			//先获取要删除的公告的id
			var infoid = $(this).find(".yincangzhi").val();
			
			var deletr = $(this).closest("tr");
			
			//alert(infoid);
			swal({ 
				
				title: "确定删除该条公告吗？", 
				text: "删除后您将无法恢复！", 
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
					
					

					//修改成ajax方式  后台删除
					$.ajax({
						url:"deleteInfombyAjax?id="+infoid,
						dataType:"text", //预期服务器返回的数据类型
						type:"post",
						data:null, //发送到服务器的数据
						success:function(data){
							if(data == 'success'){
								swal("删除成功！","小O在此祝您今日工作顺利","success");
								//在页面中删除先
								deletr.remove();
								setTimeout(function(){
									swal.close();

								},1000);
							}

							return false;
						},
						error:function(data){
							swal("删除失败！","权限不匹配","warning");
							
							setTimeout(function(){
								swal.close();

							},1000);
						}
						
					});
					
					
				} else { 
					swal.close();
				} 
			});
			
			
		});
		
		
		$(".chakan").click(function(){
			var $information=$(this).parents("td").siblings(".c").find("span").text();
			if( $information!=""){
				parent.changeinformation();
			}
		});
		
		var count = 0;
		<#-- 点击全选按钮 -->
		$("#quanxuan").click(function(){
			 count++;
			 //标记点击次数
             if(count == 10) count = 0;
			 //遍历
                if(count % 2 !=0){  //奇数次点击
                  
                    $("input[class='dianji']").each(function(){

                        this.checked=true;
                        //设置样式
                       // $(this).parent().parent().addClass("dianji");

                    });
                }else{

                    $("input[type='checkbox']").each(function(){

                    this.checked=false;
                    //移除样式
                    $(this).parent().parent().removeClass("dianji");

                });

                }
			
		});
		
		<#-- 点击删除选中按钮 -->
		$("#deleteAll").click(function(){
			
			 //如果当前无任何选中
                var flag = 0;
                //遍历所有的checkbox
                $("input[class='dianji']").each(function(){
                    if(this.checked == true){
                        flag = 1;  //说明有选中的了
                        return ;
                    }
                });
                if(flag == 1){
                	
                	swal({ 
        				title: "确定删除全部选中的公告吗？", 
        				text: "删除后您将无法恢复！", 
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
        					
        					//获取出所有的checkbox输入框//遍历删除
                            $("input[class='dianji']").each(function(){
                                //如果这个checkbox是被选中的
                                if(this.checked==true){
                                    //先获取公告的id
                                    var td_id = $(this).parent().parent().parent().parent().find("td").eq(1); //获取id
                                    var id = td_id.text();
                                    //alert(id);
                                    
                                    //然后再使用ajax异步删除后台数据
                                   	$.ajax({
                                        url:"deleteAll?noticeId="+id,
                                        dataType:"text",
                                        type:"get",
                                        data:null,
                                        success:function(data){
                							if(data == 'success'){
                								swal("删除成功！","小O在此祝您今日工作顺利","success");
                								td_id.parent().remove(); //删除父元素tr自身及其所有子元素td(就是一整行)
                								setTimeout(function(){
                									swal.close();

                								},1000);
                							}else{
                								swal("删除失败！","权限不匹配","warning");
                								
                								setTimeout(function(){
                									swal.close();

                								},1000);
                							}

                							return false;
                						},
                						error:function(data){
                							
                						}
                                    });
      
                                }
                            });
        					
        					
        				} else { 
        					swal.close();
        				} 
        			});
                }

		});
		
		<#-- 单机选中某一条公告 -->
		$(".dianji").click(function(){
			
		});
		
		<#--  -->
		
	});
</script>