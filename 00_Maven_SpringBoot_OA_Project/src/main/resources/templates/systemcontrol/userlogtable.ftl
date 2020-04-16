<div class="table-responsive">
	<table class="table table-hover">
		<tr>
							
							<th scope="col">操作者</th>
							<th scope="col">操作菜单</th>
							<th scope="col"><span class="paixu thistime">日志记录时间
								<#if time?? && icon??>
									<span class="glyphicon ${icon}"></span>
								</#if>
							</span>
							</th>
							<th scope="col">IP</th>
							
						</tr>
						
						<#list userLog as ulog>
							<tr>
								<td><span>${(ulog.user.userName)!''}</span></td>
								<td><span>${(ulog.title)!''}</span></td>
								<td><span>${(ulog.logTime)!''}</span></td>
								<td><span>${(ulog.ipAddr)!''}</span></td>
								
							</tr>
						</#list>
	</table>
</div>