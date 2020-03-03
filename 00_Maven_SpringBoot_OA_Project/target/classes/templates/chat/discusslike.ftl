<!-- 这是针对帖子的 -->
<ul class="list-inline" style="margin-left: 6px;">
	<li>
		<!-- 点击弹出模态框 -->
		<a href="#" class="label xinzeng thisreply" id="thisreply"
			replyId="${discuss.discussId}" replyModule="discuss"> 
			<span
				class="glyphicon glyphicon-share-alt">
			</span><font size="25px">添加评论</font> 
		</a>
	</li>
	<li><a href="#"> <span class="glyphicon glyphicon-fire"
			style="color: red;"></span> 访问数<span>(${discuss.visitNum})</span>
	</a></li>
	<li><a href="#"> <span
			class="glyphicon glyphicon-comment" style="color: #337ab7"></span>
			讨论次数<span>(${(chatNum)!'0'})</span>
	</a></li>
	<li><a href="#" class="likethis" replyId="${discuss.discussId}" module="discuss">
		 <span class="glyphicon glyphicon-thumbs-up"></span> 
			<span class="likenum">
				<#if discussContain>
					已赞(${discussLikeNum})
				<#else>	
					赞(${discussLikeNum})
				</#if>
			</span>
		</a>
	</li>
</ul>	
<!-- 显示谁点过赞的 -->
<!-- 下面是具体点赞人员的名字显示 -->
<ul class="list-inline" style="margin-left: 10px;">
	<#if discussLikeNum gt 0>
		<li>
			<span class="glyphicon glyphicon-thumbs-up" style="color: #fff;border-radius: 50%;padding: 3px;background-color: #347ab7;"></span> 
			<span class="likethisnum">
			<#list setUsers as user>
				<a 
				class="usershow"  
				title="${user.userName}" 
				thisdept="${user.dept.deptName}" 
				thisrole="${user.role.roleName}" 
				thistel="${(user.userTel)!'空的'}"
				thisemail="${(user.eamil)!'空的'}" 
				href="javascript:void(0);">${user.userName}</a>、
			</#list>
				<span>共${discussLikeNum}人觉得很赞</span>
			</span>
		</li>
	</#if>
</ul>

<script type="text/javascript" src="js/usershow.js"></script>