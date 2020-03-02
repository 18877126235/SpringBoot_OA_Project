<!-- 这是针对评论的 -->
<ul class="list-inline">
	
	<li>
		<!-- <a  style=" cursor:pointer;" class="lable thisreply" replyId="${reply.replyId}" replyModule="reply">  -->
		<a href="#" class="thisreply1" replyId="${reply.replyId}" replyModule="reply">
		
			<span
				class="glyphicon glyphicon-share-alt">
			</span> 回复
		</a>
	
	</li>
	
	<li><a href="#" class="likethis" replyId="${reply.replyId}" module="reply"> <span
			class="glyphicon glyphicon-thumbs-up"></span> 
			<span class="likenum">
			<#if likeNum??>
				<#if contain>
					已赞(${likeNum})
				<#else>
					赞(${likeNum})
				</#if>	
			<#else>
				<#if reply.contain>
					已赞(${reply.likenum})
				<#else>
					赞(${reply.likenum})
				</#if>
			</#if>
			</span>
	</a></li>
	<li>
		<!-- 	<a  href="#comment${reply.replyId}" -->

	<a  
		class="label xiugai toggle" data-toggle="collapse"><span
			class="glyphicon glyphicon-triangle-bottom"></span>
			<font size="25px">
				回复信息如下(
			<#if comments??>
				${comments}
			<#else>
				${reply.count}
			</#if>
			)
			</font>
			
			<span></span>
			</a>
	</li>
	<li class="pull-right">
		<span class="rightNum">
			<#if rightNum??>
				${rightNum}
			<#else>
				${reply_index+1}
			</#if>
		</span>楼
	</li>
</ul>



<!-- 下面是具体点赞人员的名字显示 -->
<ul class="list-inline">
	<#if likeNum??>
		<#if likeNum gt 0>
			<li>
				<span class="glyphicon glyphicon-thumbs-up" style="color: #fff;border-radius: 50%;padding: 3px;background-color: #347ab7;"></span> 
				<span class="likethisnum">
				<#list users as user>
					<a 
					class="usershow"  
					title="${user.userName}" 
					thisdept="${user.dept.deptName}" 
					thisrole="${user.role.roleName}" 
					thistel="${(user.userTel)!'空的'}"
					thisemail="${(user.eamil)!'空的'}" 
					href="">${user.userName}</a>、
				</#list>
					<span>共${likeNum}人觉得很赞</span>
				</span>
			</li>
		</#if>
	<#else>
		<#if reply.likenum gt 0>
			<li>
				<span class="glyphicon glyphicon-thumbs-up" style="color: #fff;border-radius: 50%;padding: 3px;background-color: #347ab7;"></span> 
				<span class="likethisnum">
				<#list reply.replyLikeUsers as user>
					<a 
					class="usershow"  
					title="${user.userName}" 
					thisdept="${user.dept.deptName}" 
					thisrole="${user.role.roleName}" 
					thistel="${user.userTel}"
					thisemail="${user.eamil}" 
					href="javascript:void(0);">${user.userName}</a>、
				</#list>
					<span>共${reply.likenum}人觉得很赞</span>
				</span>
			</li>
		</#if>
	</#if>
</ul>

<!-- 评论框 -->
<div  class="panel panel-default huifu2" id="huifu" style="display: none;">
    <div class="panel-heading tishixinxi" style="background-color: white">
        	回复：@<font class="tishineirong" color="blue"></font>
    </div>
    <div class="panel-body">
        <div class="form-group">
           
           <!-- 不需要form表单 -->
            <form action="testhhhh" class="form01" method="post">
            
             <input  type="hidden" name="topicId" value="">
             <input type="hidden" name="replyUserId" value="">
             
             <textarea class="form-control contenthuifuclass"  style="width: 100%; height: 150px;" rows="8" cols="78" rows="3" name="contenthuifu" required="required"> </textarea><br/>

            </form>
            <!-- onclick="login()" -->
           	<input type="button"    class="btn btn-default btn-sm quedinghuifu" value="回复"> 
            <input type="button"  id="quxiaoyincang" class="btn btn-default btn-sm" value="取消">
        </div>

    </div>
</div>


<script type="text/javascript" src="js/usershow.js"></script>

<script type="text/javascript">


	//使用ajax方式提交form表单
	function login() {
		
		//获取你的fomr表单

		//alert("点击了呢");
            $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "testhhhh" ,//url
                data: $(this).prev().serialize(),
                success: function (result) {
                   
                    if (result.resultCode == 200) {
                        alert("SUCCESS");
                    }
                    ;
                },
                error : function() {
                    alert("异常！");
                }
            });
     }





//开启回复的富文本
var editor;
KindEditor.ready(function(K) {
	editor = K.create('textarea[name="contenthuifu"]', {
		allowFileManager: true,
		
		afterBlur: function(){
			this.sync();//假如没有这一句，获取到的id为content的值空白
		}
	
	
	});
	K('input[name=getHtml]').click(function(e) {
		alert(editor.html());
	});
	K('input[name=isEmpty]').click(function(e) {
		alert(editor.isEmpty());
	});
	K('input[name=getText]').click(function(e) {
		alert(editor.text());
	});
	K('input[name=selectedHtml]').click(function(e) {
		alert(editor.selectedHtml());
	});
	K('input[name=setHtml]').click(function(e) {
		editor.html('<h3>Hello KindEditor</h3>');
	});
	K('input[name=setText]').click(function(e) {
		editor.text('<h3>Hello KindEditor</h3>');
	});
	K('input[name=insertHtml]').click(function(e) {
		editor.insertHtml('<strong>插入HTML</strong>');
	});
	K('input[name=appendHtml]').click(function(e) {
		editor.appendHtml('<strong>添加HTML</strong>');
	});
	K('input[name=clear]').click(function(e) {
		editor.html('');
	});

});
	KindEditor.sync();

</script>
