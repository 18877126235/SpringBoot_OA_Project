
<div class="jichu kaoqin " style="cursor: pointer;">
	<div class="wenzi">
	
			
			<#if alist??>
			
				<!-- 如果已签到 ${alist.attendHmtime}-->	
				<a class="attendce" style="text-decoration: none; color:white;">
					
					<h2 class="">
						
						已签到
						<input class="shifouqiandao" type="hidden" value="yes">
					</h2>
				</a>
				
				<h4>
					点击下班签到
					<span style="color: yellow ;" class="glyphicon glyphicon-hand-right"></span>
				</h4>
				<!-- 否则未签到 -->
				<#else>
					<a class="attendce" style="text-decoration: none; color:white;">
				
						<h2 class="">
							未签到
							<input class="shifouqiandao" type="hidden" value="not">
						</h2>
					</a>
					<h4>
						点击上班签到
						<span style="color: yellow;" class="glyphicon glyphicon-hand-right"></span>

					</h4>
			</#if>
			
	</div>
	<!-- 点击签到的图标 -->
	<div class="iconfont">
		<span style="color: #ffffff;" class="glyphicon glyphicon-time dianjiqiandao"></span>
	</div>
	
	<a href="attendcelist" class="moreduo"> 更多 <span
		class="glyphicon glyphicon-circle-arrow-right"></span>
	</a>
</div>

<#if error??>
<#if error=='1'>
	<script>
	
		
		$(function(){
			
			
			//alert("亲 不能签到，不在正常签到时间内！");
			
			//swal.close();
		})
		
	</script>

</#if>
<#if error=='2'>
	<script>
	$(function(){
		//alert("亲 还没有到签到时间哦");
	})
</script>

</#if>
</#if>


<script>


	$(".attendce").on('click',function(){
		
		
		

	});
    
	
	$(".dianjiqiandao").click(function(){
		//alert("点你妹");
		
		//获取某个参数，判断是上班签到还是下班签到
		var qiandao = $(this).closest(".jichu").find(".shifouqiandao").val(); 
		
		//如果是未签到
		if( qiandao == 'not' ){
			
			swal({ 
				title: "您确定开始签到上班吗？", 
				text: "下班时间记得进行下班签到哦！", 
				type: "info",
				showCancelButton: true, 
				confirmButtonColor: "#info",
				confirmButtonText: "确认签到！", 
				cancelButtonText: "再等一会！",
				closeOnConfirm: false, 
				closeOnCancel: false	
				},
				function(isConfirm){ 
				if (isConfirm) { 
					//$("#refresh").load('singin');
					//修改成ajax方式
					$.ajax({
						url:"singin",
						dataType:"text", //预期服务器返回的数据类型
						type:"get",
						data:null, //发送到服务器的数据
						success:function(data){
							//alert("成功"+data);
							
							if(data == 'success'){
								
								
								
								swal("签到成功！","小O在此祝您今日工作顺利","success");
								
								setTimeout(function(){
									swal.close();
									
									//嵌套定时器，使得视觉体验感更佳
									setTimeout(function(){
										window.location.href="test2";
									},200);
									
								},900);
								return false;
							}else if(data == '1'){
								//alert("","","warning");
								swal("不能签到，不在正常签到时间内！","签到时间为每天上午6点-8点","warning");
							}else if(data == '2'){
								swal("亲 还没有到签到时间哦！","签到时间为上午6点-8点","warning");
							}

							
						}, //success括号
						error:function(data){
							alert("失败"+data);
						}
						
					}); //ajax括号
					
				} else { 
					swal.close();
				} 
			});//sweet弹窗
			
		}else{ //否则是点击下班签到的
			//先发送ajax请求去后台判断是否处于下班时间
			$.ajax({
				url:"isxiaban",
				dataType:"text", //预期服务器返回的数据类型
				type:"get",
				data:null, //发送到服务器的数据
				success:function(data){
					
					alert("下班签到成功"+data);
					
					
					return false;
					

					
				}, //success括号
				error:function(data){
					alert("失败"+data);
				}
				
			});//ajax括号
			
		}
		
		
		
	});
	
</script>