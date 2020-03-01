

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
				
				<!-- 如果存在回复那就将回复内容封装到下面的容器中，先不显示 -->
				<#if commentList??>
				<!-- 为容器设定唯一的id -->
				<div id="comment${reply.replyId}" class="comment collapse" style="margin-left: 80px;">
					<table class="table table-hover" style="margin-bottom: 0;">
						<tbody>
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
<tr>
	<th scope="col" style="background-color: #EEEEEE;text-align: center;padding:16px;" class="addmore">
		<#if page.totalElements gt page.size>
			还有${page.totalElements-page.size}条，点击加载更多~~~
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
/* 点击加载更多 */
$('.addmore').on('click',function(){
	var selecttype=$("#selecttype option:selected").val();	//获得查看类型select中的值
	var selectsort=$("#selectsort option:selected").val();	//获得时间排序select中的值
	var num=${discuss.discussId};
	var page=${page.number};
	var size=${page.size+5};
	if(${page.size}<=${page.totalElements}){
		$('.repay').load('/replypaging',{num:num,size:size,selecttype:selecttype,selectsort:selectsort}); 
	}
});

/* 回复与评论的提交 */
$('#commentsave').on('click',function() {
	console.log($("#hiddenreplyId").val());
	console.log($("#hiddenreplyModule").val());
	console.log($("#comment").val());
	var size=${page.size};
	console.log("size:"+size);
	var replyId = $("#hiddenreplyId").val();
	var module = $("#hiddenreplyModule").val();
	
	//var comment = $("#comment").val();
	
	//测试获取富文本内容
	//var content = $.trim($(".contentfuwenben").val());
	editor.sync(); 
	var comment =  $(".contentfuwenben").val();

	//alert(content);
	
	$('.repay').load('/replyhandle?size='+size, {
		replyId : replyId,
		module : module,
		comment : comment,
	});
	
	$("#comment").val("");
});
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
</script>