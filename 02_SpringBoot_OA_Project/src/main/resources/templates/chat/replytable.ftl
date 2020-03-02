

<!-- 如果有评论 并且评论数要大于0才显示内容 -->
<#if replyList?? && replyList?size gt 0>
<!-- 把每一条评论封装成到tr中 -->
<#list replyList as reply>
<tr>
	<td>
		<div class="post">
		
			<div class="user-block">
				<!-- 显示用户头像 -->
				<span> 
					<a href="#"> 
						<img src="/image/${(reply.user.imgPath)!'/timg.jpg'}" class="big-img" />
					</a>
				</span> 
				<!-- 显示评论的用户的名称 -->
				<span class="username"> 
					<input class="usernametishi" type="hidden" value="${(reply.user.userName)!''}">
					<a href="#" class="raply-name">${(reply.user.userName)!''}</a> 
					<!-- 如果是超级管理员或者本人可以有权删除该条评论-->
					<#if manage??> 
						<a replyId="${reply.replyId}" replyModule="reply" href="javascript:void(0);"
						 	class="deletethis pull-right " style="font-size: 12px;"> 
							<font  color="#FF6600">删除该评论</font> 
							<span style="font-size: 26px;" >&times;</span>
						</a>
					</#if>
					
				</span> 
				
				<!-- 显示评论时间 -->
				<span class="right-time">${reply.replayTime?string('yyyy-MM-dd HH:mm:ss')}</span>
				
				<!-- 显示评论内容 -->
				<p style="padding-top: 10px;">${reply.content}</p>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- 显示回复和点赞按钮和具体的点赞人员的名称 -->
				<div class="replyrefresh">
				
					<#include "replylike.ftl"/>
					
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				<!-- 如果存在回复那就将回复内容封装到下面的容器中，原来默认先不显示 -->
				<#if commentList??>
				<!-- 为容器设定唯一的id 
				class="comment collapse"
				-->
				<div id="comment${reply.replyId}" class="jiazaihuifuxinxi" style="margin-left: 80px;">
					<table class="table table-hover" style="margin-bottom: 0;">
					
						<tbody  class="tianjiahuifuneirong" >
							
							<#list commentList as comment>
							 <#if comment.reply == reply.replyId>
							<tr>
								<td class="comment-td"><a href="#"> <img
										src="/image/${(comment.user.imgPath)!'/timg.jpg'}" class="big-img" />
								</a></td>
								<td>
									<div class="user-block">
										<a href="" class="raply-name">${(comment.user.userName)!''}: </a>${comment.comment}
										<ul class="list-inline pull-right"
											style="display: block;">
											<li>${comment.time?string('yyyy-MM-dd HH:mm:ss')}</li>
											<li>
												<a href="#" class="label xinzeng thisreply"
													replyId="${reply.replyId}" replyModule="reply" replyName="${comment.user.userName}"><span
														class="glyphicon glyphicon-share-alt"></span>回复
												</a>
											</li>
											<#if manage??>
											<li><a href="javascript:void(0);" class="label shanchu deletethis" replyId="${comment.commentId}" replyModule="comment"><span
													class="glyphicon glyphicon-remove"></span>删除</a>
											</li>
											</#if>
										</ul>
									</div>
								</td>
							</tr>
							</#if> 
							</#list>
						</tbody>
					</table>
				</div>
				</#if>
				
				
			</div>
		</div>
	</td>
</tr>
</#list>

<!-- 点击加载更多 -->
<tr>
	<th scope="col" style="background-color: #EEEEEE;text-align: center;padding:16px;" class="addmore">
	
		<#if page.totalElements gt page.size>
			还有${page.totalElements-page.size}条，点击加载更多~~~
			<!-- 隐藏用来存储剩余条数 -->
			<input type="hidden" id="input_shengyu" value="${page.totalElements-page.size}">
			<!-- 当前显示的条数 -->
			<input type="hidden" id="input_size" value="${page.size}">
		<#else> 
			<span class="nomore">已经没有更多了~~~</span>
		</#if>
		
	</th>
</tr>

<#else>
	<tr>
		<th scope="col" style="background-color: #EEEEEE;text-align: center;">还没有评论，快来坐沙发~~~</th>
	</tr>
</#if>
			
<#include "/common/comment.ftl"/> <!--class nothing 完毕-->
<script>




/*查看更多评论的小图标变化  */
$('.toggle').on('click',function() {
	if ($(this).children().hasClass('glyphicon-triangle-bottom')) {
		$(this).children('.glyphicon').removeClass(
				'glyphicon-triangle-bottom').addClass(
				"glyphicon-triangle-top");
	} else {
		$(this).children('.glyphicon').removeClass(
				'glyphicon-triangle-top').addClass(
				"glyphicon-triangle-bottom");
	}
});




//防止页面后退
history.pushState(null, null, document.URL);
window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
});

</script>