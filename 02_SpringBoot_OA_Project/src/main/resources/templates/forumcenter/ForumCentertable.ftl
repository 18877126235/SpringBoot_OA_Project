    <div class="panel-heading" style="background-color: white">
        <a style="margin-right: 2%">活跃</a><a style="margin-right: 2%">精华</a><a style="margin-right: 2%">最近</a>
    </div>

<ul class="list-group" style="width: 100%">
 	<!-- 开始遍历 -->
 	<#list list as this>
    <li style="margin-top: 5px;" class="list-group-item">
        <div style="height: 50px">
            <div style="float: left;width: 6%;margin-bottom: 5px">
            	<!-- 用户头像  /image/${(user.imgPath)!'/timg.jpg'}-->
                <img width="50px" height="50px" src=" /image/${(this.userimage)!''}" class="img-rounded">
            </div>
            <div style="width: 89%;float: left">
                <!--点击该条帖子查看详情  标题-->
                <a style="color: #696969 ;" href="seediscuss?id=${this.id}&pageNumber=${page.number}" >
                	<b style="color:black;" >标题：</b> 
                		<font color="#FF6600" >${(this.title)!''}</font> 
                </a>
                <br/>
                <div>
                	<!-- 这里要加上判断类型 -->
                    <a><span class="label ${this.typecolor}">${(this.typeName)!''}</span></a>&nbsp;&nbsp;&nbsp;
                    <a href=""><span ><strong>${(this.userName)!''}</strong></span></a>&nbsp;&nbsp;&nbsp;
                    <!-- 日期类型转换 -->
                    <small class="text-muted">${this.createTime?string('yyyy-MM-dd HH:mm:ss')}</small>&nbsp;&nbsp;&nbsp;
                    <small class="text-muted">访问量：${(this.visitNum)!''}</small>
                    
                </div>
            </div>
            <!-- 回复数量 -->
            <div style="width: 5%;float: right;text-align: center">
                <span style="background: #ffffff ; color: #31b0d5 ;" class="badge">评论：${(this.commentsNum)!''}</span>
            </div>
             <!-- 回复数量 -->
            <div style="width: 5%;float: right;text-align: center">
                <span style="background: #ffffff; color: #FF69B4 ;" class="badge">点赞：${(this.likeNum)!''}</span>
            </div>
        </div>
    </li>
    </#list> <!-- 遍历结束 -->

</ul>
<!--盒子尾  分页条 -->
	<br>
	<#include "/common/paging.ftl"/>	