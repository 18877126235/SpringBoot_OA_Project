	<!--盒子身体-->
		<div class="box-body no-padding">
			<div style="padding: 5px;"><#--  bac chec -->
				<a  id="btn_quanxuan" class="btn btn-sm btn-default bac" href="##" title="全选/反选"><span
					class="glyphicon glyphicon-unchecked"></span>全选</a>
				<div class="btn-group">
					<a class="btn btn-sm btn-default bac sdelete" title="删除">
						<span class="glyphicon glyphicon-trash"></span>删除</a>
					<a class="btn btn-sm btn-default bac looked" title="标为已读">
						<span class="glyphicon glyphicon-eye-open"></span>标记已读</a> 
					<a class="btn btn-sm btn-default bac star"  title="星标">
						<span class="glyphicon glyphicon-star"></span>星标</a>
					<#if mess="垃圾箱">
						<a class="btn btn-sm btn-default bac reh"  title="恢复删除">
						<span class="glyphicon glyphicon-retweet"></span>恢复删除</a>
					<#else>
					</#if>
				</div>
				<a class="btn btn-sm btn-default bac" href="" title="刷新"><span
					class="glyphicon glyphicon-refresh"></span>刷新</a>
			</div>
			<div class="table-responsive">
				<table class="table table-hover table-striped">
					<tr>
						<th scope="col">选择</th>
						<th scope="col">标记</th>
						<th scope="col">类型</th>
						<th scope="col">发件人</th>
						<th scope="col">收件者</th>
						<th scope="col">主题</th>
						<th scope="col">时间</th>
						<th scope="col">附件</th>
						<th scope="col">状态</th>
						<th scope="col">已读</th>
						<th scope="col">操作</th>
					</tr>
					<#if (maillist?size gte 0) >
					<#list maillist as mail>
					<tr>
						<td >
						<span class="labels"><label><input name="items" type="checkbox"><i>✓</i></label></span>
						</td>
						
						
						<#if mail.star==true>			
							<td class="em"><span class="glyphicon glyphicon-star"
								style="width: 25px;"></span></td>
							<#else>
								<td>&nbsp;</td>
						</#if>
						
						
						<#if mail.typename=="公告">
						<td><span style="color:red;">${(mail.typename)!''}</span></td>
						<#else>
						<td><span>${(mail.typename)!''}</span></td>
						</#if>
						
						
						<#-- 发件人 -->
						<td><span>${(mail.sender)!''}</span></td>
						<#-- 收件人 -->
						<td><span>${(mail.reciver)!''}</span></td>
						
						<#-- 邮件标题 -->
						<#if mail.read==true>
						<td><span>${(mail.title)!''}</span></td>
						<#else>
						<td><span><strong class="read">${(mail.title)!''}</strong></span></td>
						</#if>
						
						
						
						<td><span>${(mail.time)!''}</span></td>
						<#if mail.fileid??>
						<td><span class="glyphicon glyphicon-ok"></span></td>
						<#else>
						<td><span></span></td>
						</#if>
						<td>
							<div class="label ${mail.statuscolor}">${(mail.statusname)!''}</div>
						</td>
						<td class="mailid" style="display:none;"><span>${mail.mailid}</span></td>
						
						
						<td>
							<#if mail.read==true>
								<span class="label label-success">已读</span>
								<#else>
								<span class="label label-warning">未读</span>
							</#if>
							
						</td>
						
						<td><a href="##" class="label xiugai lab"><span
								class="glyphicon glyphicon-search"></span> 查看</a>
							<#if mess=="草稿箱">
							<a href="##" class="label xinzeng edit"><span
								class="glyphicon glyphicon-pencil"></span> 编辑</a>
							</#if>	
							
							<#if mess=="发件箱">
								
								<#else>
									<a href="##" class="label shanchu"><span
									class="glyphicon glyphicon-remove"></span> 删除</a>
							</#if>
							
							
						</td>
					</tr>
					</#list>
					</#if>
				</table>
			</div>
		</div>
		<!--盒子尾-->
		<#include "/common/paging.ftl">
<script>
	$(function(){


		 <#-- 全选操作 -->
		 //全选操作，点击全选按钮，然后选中所有的checkbox
          var count = 0;
            $("#btn_quanxuan").click(function () {
                count++;
                if(count == 10) count = 0;
                if(count % 2 !=0){  //奇数次点击
                    //$("input[type=checkbox]").prop("checked", "true");  //设置所有的check为选中
                    $("input[type='checkbox']").each(function(){
                        this.checked=true;
                    });
                }else{
                    $("input[type='checkbox']").each(function(){

                    this.checked=false;
                });
                }
            });
		 
		 $(".sdelete").click(function(){
			 
			 var flag = 0;
			 //首先判断有没有被选中的
			  $("[name=items]:checkbox").each(function(){
				 if(this.checked){ //存在选中的
	    			flag = 1;
	    		}
			 });
			 
			 if( flag == 1 ){  //执行删除
				 
				 swal({ 
						title: "您确定删除选中的邮件吗", 
						text: "收件可放入垃圾箱，发件不可恢复哦！", 
						type: "warning",
						showCancelButton: true, 
						confirmButtonColor: "",
						confirmButtonText: "确认删除！", 
						cancelButtonText: "考虑一下！",
						closeOnConfirm: false, 
						closeOnCancel: false	
						},
						function(isConfirm){ 
						if (isConfirm) { 
							 var  arry=new Array();
							 var title=$(".titles").text();
							 $("[name=items]:checkbox").each(function(){
								 if(this.checked){
					    				//获取被选中了的邮件id
									 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
					    				arry.push($mailid);
					    			}
							 })
							 if(arry.length==0){
								 return;
							 }
							 var values=arry.toString();
							 $(".thistable").load("alldelete",{ids:values,title:title}); 
							swal("操作成功！","666","success");
							setTimeout(function(){swal.close();},800);
						} else { 
							swal.close();
						} 
				});
				 
			 }
			 
			 
			 
			 
			/* if(confirm("确定删除么？")){

			 var  arry=new Array();
			 var title=$(".titles").text();
			 $("[name=items]:checkbox").each(function(){
				 if(this.checked){
	    				//获取被选中了的邮件id
					 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
	    				arry.push($mailid);
	    			}
			 })
			 if(arry.length==0){
				 return;
			 }
			 var values=arry.toString();
			 $(".thistable").load("alldelete",{ids:values,title:title}); 
			 }*/
		 });
		 //批量查看
		 $(".looked").click(function(){
			
			 var  arry=new Array();
			 var title=$(".titles").text();
			 $("[name=items]:checkbox").each(function(){
				 if(this.checked){
	    				//获取被选中了的邮件id
					 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
	    				arry.push($mailid);
	    				 var $mail=$(this).parents("td").siblings().find(".read").text();
	    				 if($mail!=""){
	    					 parent.changeemail();
	    				 }
	    			}
			 })
			 if(arry.length==0||title=="发件箱"||title=="草稿箱"){
				 return;
			 }
			 var values=arry.toString();
			 $(".thistable").load("watch",{ids:values,title:title});
			 
		 });
		 //批量标星
		 $(".star").click(function(){
			 
			 var  arry=new Array();
			 var title=$(".titles").text();
			 $("[name=items]:checkbox").each(function(){
				 if(this.checked){
	    				//获取被选中了的邮件id
					 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
	    				arry.push($mailid);
	    			}
			 })
			 if(arry.length==0){
				 return;
			 }
			 var values=arry.toString();
			 $(".thistable").load("star",{ids:values,title:title});
			 
		 });
		 //查看
		 $('.lab').on('click',function(){
		 
			 var pagenum = '${page.number}'; //获取当前是第几页
		 	 //alert(pagenum);
		 	 //获取当前邮件的id值
			 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
			 //alert($mailid);
			 
			 //得到当前查看的邮件是属于哪个邮件模块
			 var title=$(".titles").text();
			 //alert(title);
			 var $mail=$(this).parents("td").siblings().find(".read").text();
			 //alert($mail);
			 
			 if($mail !=""){
				 parent.changeemail(); //暂时不知道这里用来干嘛的
			 }
			
			$('.set').load('smail',{id:$mailid,title:title,pageNum:pagenum});
			/* parent.changeemail(); */
		});
		 //重新编辑
		 $('.edit').on('click',function(){
			 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
				$('.set').load('wmail',{id:$mailid});
			});
		 
		 //批量恢复删除
		 $('.reh').on('click',function(){
			 var  arry=new Array();
			 var title=$(".titles").text();
			 $("[name=items]:checkbox").each(function(){
				 if(this.checked){
	    				//获取被选中了的邮件id
					 var $mailid=$(this).parents("td").siblings(".mailid").children("span").text();
	    				arry.push($mailid);
	    			}
			 })
			 if(arry.length==0){
				 return;
			 }
			 var values=arry.toString();
				$('.thistable').load('refresh',{ids:values,title:title});
			});
		 
	});
</script>