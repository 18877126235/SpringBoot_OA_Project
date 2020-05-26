

<#list catalogs as ca>

	<!-- 设置不显示自己 -->
	<#if ca.userId == userId>
		
		<#else>
			<li class="chatyonghutiaomu dropdown">
				<!--设置导航栏头像面板--> 
				<a href="#" class="green-none white" data-toggle="dropdown" aria-expanded="false">
						<!-- 头像 -->
						<img style="width: 30px;height: 30px;float: left;border-radius: 50%;margin-right: 10px;margin-top: -5px;" src="/image/${(ca.imgPath)!'/timg.jpg'}" class="user-image"> 
						<!-- 用户名 -->
						<span> ${ca.userName}<br></span>
						<small style="color: green;" ><span class="glyphicon glyphicon-record" style="color: #00a65a;">
						</span> 
						
						 
						<#list UserLists as useridtr>
						
							<#if useridtr?eval = ca.userId>
								在线
							</#if>
							
							
						</#list>
						
						
						
						</small>
				</a> 
				<input class="duixiangidzhi" type="hidden" value="${ca.userId}">	
			
			</li>	
		
	</#if>

	
</#list> 



<#--
<#list catalogs as ca>
	<li>
		<a href="javascript:void(0);" style="padding-left: 60px;"><span class="glyphicon glyphicon-list-alt"> </span> ${ca.userName}
			<span class="pull-right" style="display: none;">
				<span class="glyphicon glyphicon-edit xiugai thisxiugai" style="margin-right:5px;padding: 3px;"></span>
				<span class="glyphicon glyphicon-remove shanchu thisshanchu" style="padding: 3px;"></span>
			</span>
		</a>
	</li>
</#list> 
-->











<!-- 测试专属 -->
<#--
	<li>
		<a href="javascript:void(0);" style="padding-left: 60px;"><span class="glyphicon glyphicon-list-alt"> </span> 你妹的
			<span class="pull-right" style="display: none;">
				<span class="glyphicon glyphicon-edit xiugai thisxiugai" style="margin-right:5px;padding: 3px;"></span>
				<span class="glyphicon glyphicon-remove shanchu thisshanchu" style="padding: 3px;"></span>
			</span>
		</a>
	</li>
	<li>
		<a href="javascript:void(0);" style="padding-left: 60px;"><span class="glyphicon glyphicon-list-alt"> </span> 刘大庆
			<span class="pull-right" style="display: none;">
				<span class="glyphicon glyphicon-edit xiugai thisxiugai" style="margin-right:5px;padding: 3px;"></span>
				<span class="glyphicon glyphicon-remove shanchu thisshanchu" style="padding: 3px;"></span>
			</span>
		</a>
	</li>
	<li>
		<a href="javascript:void(0);" style="padding-left: 60px;"><span class="glyphicon glyphicon-list-alt"> </span> 神经病
			<span class="pull-right" style="display: none;">
				<span class="glyphicon glyphicon-edit xiugai thisxiugai" style="margin-right:5px;padding: 3px;"></span>
				<span class="glyphicon glyphicon-remove shanchu thisshanchu" style="padding: 3px;"></span>
			</span>
		</a>
	</li>
	-->