<div class="bgc-w box box-primary">
	<!--盒子头-->
	<div class="box-header">
		<h3 class="box-title">
			<a href="informedit" class="label label-success"
				style="padding: 5px;"> <span class="glyphicon glyphicon-plus"></span>
				新增
			</a>
			<a href="" class="label label-success" style="padding: 5px;margin-left:5px;">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</a>
			
			<#if userId!=1> 
								<#--  -->
								<#else> 
								<a  href="#" id="quanxuan1" class="label label-warning" style="padding: 5px;margin-left:5px;">
									<span class="glyphicon glyphicon-ok"></span> 全选
								</a>
							
								<a href="#" id="deleteAll1" class="label label-danger" style="padding: 5px;margin-left:5px;">
									<span class="glyphicon glyphicon-remove"></span> 删除选中
								</a>
						</a></#if>
			
			
		</h3>
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm baseKey" placeholder="按标题查找" value="${(baseKey)!''}"/>
				<div class="input-group-btn">
					<a class="btn btn-sm btn-default baseKetsubmit"><span
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
						
					<#if userId!=1> 
								<#--  -->
								<#else> 
								<th style="display: none;" scope="col"><span class="paixu thistype">
									选中
								</th>
							
						</a></#if>
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
					<th scope="col">链接</th>
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
											<input type="checkbox" class="dianji1" >
											<i>✓</i>
										</label>
									</span>
								</td>
							
						</a></#if>
					
					
				
					<td>${(this.typename)!''}</td>
					<td><span class="label ${(this.statuscolor)!''}">${(this.statusname)!''}</span></td>
					<td><span>${(this.title)!''}</span></td>
					<td><span>${(this.noticeTime)!''}</span></td>
					<td><span>${(this.username)!''}</span></td>
					<td><span>${(this.deptname)!''}</span></td>
					<#if this.top==true>
					<td><span class="labels"><label><input
								type="checkbox" checked disabled><i>✓</i></label></span></td>
					<#else>
					<td><span class="labels"><label><input
								type="checkbox" disabled><i>✓</i></label></span></td></#if>
					<#if this.url!=''>
					<td><span class="glyphicon glyphicon-link"></span></td>
					<#else>
					<td><span class="labels"></span></td></#if>
					<td><a href="informedit?id=${this.noticeId}"
						class="label xiugai"><span class="glyphicon glyphicon-edit"></span>
							修改</a> 
							<a href="informshow?id=${this.noticeId}&isnew=mind" class="label xiugai "><span
							class="glyphicon glyphicon-search"></span> 查看</a> 
							<a onclick="{return confirm('删除该记录将不能恢复，确定删除吗？');};"
						href="infromdelete?id=${this.noticeId}" class="label shanchu"><span
							class="glyphicon glyphicon-remove"></span> 删除</a></td> 
				</tr>
				</#list>
			</table>
		</div>
	</div>
	
	
	
	<!--盒子尾-->
	<#include "/common/paging.ftl"/>
</div>

<!-- <script type="text/javascript" src="js/common/sort.js" charset='utf-8'></script> -->
<script>
	$(function(){
		//alert("哈哈哈");
		var count = 0;
		<#-- 点击全选按钮 -->
		$("#quanxuan1").click(function(){
			 count++;
			 //标记点击次数
			 
			 //alert("你大爷");
			 
             if(count == 10) count = 0;
			 //遍历
                if(count % 2 !=0){  //奇数次点击
                  
                    $("input[class='dianji1']").each(function(){

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
		$("#deleteAll1").click(function(){
			
			 //如果当前无任何选中
                var flag = 0;
                //遍历所有的checkbox
                $("input[class='dianji1']").each(function(){
                    if(this.checked == true){
                        flag = 1;  //说明有选中的了
                        return ;
                    }
                });
                if(flag == 1){
                    if(confirm("妈的智障")){
                        //获取出所有的checkbox输入框//遍历删除
                        $("input[class='dianji1']").each(function(){
                            //如果这个checkbox是被选中的
                            if(this.checked==true){
                                //先获取公告的id
                                var td_id = $(this).parent().parent().parent().parent().find("td").eq(1); //获取id
                                var id = td_id.text();
                                //alert(id);
                                td_id.parent().remove(); //删除父元素tr自身及其所有子元素td(就是一整行)
                                //然后再使用ajax异步删除后台数据
                               	/*$.ajax({
                                    url:"deleteAll?noticeId="+id,
                                    dataType:"String",
                                    type:"get",
                                    data:null,
                                    success:function(data){},
                                    error:function(){}
                                });*/
  
                            }
                        });

                    }
                }
                //alert("你大爷");
		});
		
		
		
	});
	</script>
	