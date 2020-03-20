<#list depts as ca>
	<li>
		<a href="javascript:void(0);" style="padding-left: 60px;">
			<span class="glyphicon glyphicon-list-alt"> </span> 
			${ca.deptName}
			<!-- 放置隐藏id，点击用到 -->
			<input type="hidden" value="${ca.deptId}">
		</a>
	</li>
</#list>