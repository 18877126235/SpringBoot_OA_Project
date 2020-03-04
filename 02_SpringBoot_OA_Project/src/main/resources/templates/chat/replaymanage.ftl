<#include "/common/commoncss.ftl"/>

<style type="text/css">
a {
	color: black;
}

ul li a {
	font-size: 13px;
}

a:hover {
	text-decoration: none;
}

.bgc-w {
	background-color: #fff;
}
/*下面是主题回复*/
.chat-box .chat-title {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

.chat-box .big-img {
	border-radius: 50%;
	border: 2px solid #ddd;
	float: left;
	width: 40px;
	height: 40px;
}
.chat-box .small-img {
	border-radius: 50%;
	border: 2px solid #ddd;
	width: 30px;
	height: 30px;
}

.chat-box .username {
	display: block;
	margin-left: 50px;
}

.chat-box .right-time {
	margin-left: 50px;
	display: block;
}

.chat-box .comment-td {
	padding: 0;
	width: 40px;
}

.chat-box .raply-name {
	color: #54a0ea;
}

.addmore:HOVER {
	cursor: pointer;
}
.progress{
	margin: 4px auto;
}
.likethisnum a{
	color: #5f5f5f;
}
.likethisnum a:HOVER {
	color:#347ab7;
	text-decoration: underline;
}
.table>tbody>tr>td{
				padding: 4px;
			}
</style>

<!-- 顶部信息 -->
<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;">主题查看</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">主题查看</a>
	</div>
</div>


<div class="row" style="padding-top: 15px;">
	<div class="col-md-12">
		<!--id="container"-->
		<div class="bgc-w box box-primary"
			style="border-top: 3px solid #d2d6de; color: #5f5f5f;">
			
			<!--盒子头-->
			<div class="box-header">
				<h3 class="box-title">
					<a href="${returnUrl}?page=${pageNumber}" class="label label-default"
						style="padding: 6px;"> <span
						class="glyphicon glyphicon-chevron-left">返回</span>
					</a> 
					<a href="" class="label label-success"
						style="padding: 5px; margin-left: 5px;"> <span
						class="glyphicon glyphicon-refresh"></span> 刷新
					</a>
					<a href="#" class="label label-success"
						style="padding: 6px; margin-left: 8px;"> <span
						class="glyphicon glyphicon-share-alt">回复</span>
					</a>
				</h3>
			</div>
			
			<!--盒子身体-->
			<div class="box-body no-padding chat-box">
				<!-- 标题和发布者 -->
				<div class="chat-title">
					<h4>
						<span>主题：<font color="#9900CC">${discuss.title}</font></span>
					</h4>
					<h5>
						<small> <span>发布：${discuss.user.userName}</span> <span
							class="pull-right">${discuss.createTime}</span>
						</small>
					</h5>
				</div>
				<!-- 内容吧 -->
				<div style="padding: 10px;">
					<!-- 如果是投票就显示以下内容 -->
					<div class="voteload">
						<#include "votetable.ftl"/>
					</div>
					
					<!-- 内容 -->
					<div class="chat-content" style="padding: 10px;">
						<p>${discuss.content}</p>
					</div>
					<!-- 回复和点赞操作栏 -->
					<div>
						<!-- 这里放置的是点赞和评论相关信息 -->
						<div class="discusschange">
							<#include "discusslike.ftl"/>
						</div>
						<!-- 三个隐藏   -->
						<input type="hidden" class="replyId" /> 
						<input type="hidden" class="replyModule" /> 
						<input type="hidden" class="replyName" />	
					</div>
					
					<!-- 显示所有评论  （评论表） -->
					<div>
						<table class="table" style="margin-bottm: 10px;  ">
							<!-- 显示排序规则 和选择  <if replyList?? &&replyList?size gt 0>-->
								<tr>
									<th scope="col" style="background-color: #EEEEEE;">
										<span style="line-height: 35px;">共  ${page.totalElements } 条评论</span>
										<div class="pull-right" style="display: inline-block;margin-right:50px;font-weight: 400;">
											<span style="line-height: 35px; margin-right: 10px;"> <b>请选择查看方式</b> </span>
											<select name="selecttype" id="selecttype" class="selectthis  form-control" style="display: inline-block;margin-right: 10px;width: 115px;font-size: 13px;">
												<option value="">查看所有</option>
												<option value="${discuss.user.userId}">只看楼主</option>
												<option value="${userId}">只看我的</option>
											</select>
											<select name="selectsort" id="selectsort" class="selectthis  form-control" style="display: inline-block;width: 115px;font-size: 13px;">
												<option value="0">时间升序</option>
												<option value="1">时间降序</option>
											</select>
										</div>
									</th>
									<tr> <hr size="100px" /> </tr>
								</tr>
								
							
							<!-- 显示所有评论内容 -->
							<tbody class="repay">
							
								<#include "replytable.ftl"/>
							
							</tbody>
							
						</table>
						<!-- 这两个隐藏input -->
						<input type="hidden" id="hiddenreplyId"/>
						<input type="hidden" id="hiddenreplyModule"/>
						<input type="hidden" id="duiyingdeyonghumingchneg">
					</div>
				</div>
				<!--盒子尾-->
			</div>
		</div>
	</div>
<script type="text/javascript" src="js/usershow.js"></script>


<!-- 存在 -->
<script type="text/javascript">
/*查看类型和时间排序的select选择的改变事件  */
$('.selectthis').on('change',function(){
	
	//alert("来了老弟");
	var selecttype=$("#selecttype option:selected").val(); //查看方式
	var selectsort=$("#selectsort option:selected").val(); //排序方式
	
	//alert(selecttype);
	//alert(selectsort);
	
	var num=${discuss.discussId};
	$('.repay').load('/replypaging',{num:num,selecttype:selecttype,selectsort:selectsort}); 
});
/*所有点赞的同一处理，在之前清除掉之前绑定的事件  */
$('.chat-box').off('click','.likethis').on('click','.likethis',function(){
	$('.thisClass').removeClass("thisClass");
	$('.replyrefresh').removeClass("replychange");
	$(this).addClass("thisClass");
	$(this).parents('.replyrefresh').addClass('replychange');
	var replyId=$(this).attr('replyId');
	var module=$(this).attr('module');
	var size=${page.size};
	console.log("rightNum:"+rightNum);
	console.log(replyId);
	console.log(module);
	  /*$.ajax({
		type:'get',
		url:'/likeuserload',
		data:{module:module,replyId:replyId,size:size},
		success:function(date){
			console.log(date);
			$('.discusschange').html(date);
			//$('.thisClass').children(".likenum").text(date);
		},
		error:function(){
			alert("失败了");
		}
	}) */
	if(module=="discuss"){
		console.log("说明是讨论区，进行load方法了；");
		$('.discusschange').load('/likeuserload',{module:module,replyId:replyId,size:size});
	}else if(module=="reply"){
		console.log("说明是回复区，准备进行load方法");
		var rightNum=$(this).parent().siblings(".pull-right").children(".rightNum").text();
		$('.replychange').load('/likeuserload',{module:module,replyId:replyId,size:size,rightNum:rightNum});
	}else{
		console.log("参数错误");
	}
	
});


/*回复表的删除  */
	$('.repay').on('click','.deletethis',function(){
		var num=${discuss.discussId};
		var replyId = $(this).attr('replyId');
		var module = $(this).attr('replyModule');
		var size=${page.size};
		if(confirm("确定删除吗？ 不能恢复哟~")){
			$('.repay').load('replydelete',{replyId:replyId,module:module,num:num,size:size});
		}
	});
	

/* 点击评论评论模态框，模态框显示，假如是点击回复进入的，则在前面加@那个的名字 */	
	//$("#thisreply").on('click',function(){
	$(".discusschange").on("click","#thisreply",function(){
		
		//获取自定义的连个属性，然后复制到以下的两个inout中
		
		$("#hiddenreplyId").val($(this).attr('replyId')); //这里是获取当前评论的 对象 的id
		
		$("#hiddenreplyModule").val($(this).attr('replyModule')); //这里是获取当前回复的是什么，（是帖子还是评论）
		//alert($(this).attr('replyModule'));
		//var name = $(this).attr('replyName'); //这东西没用的呀
		//alert(name);
		//$('.replyName').val(name);
		//if(typeof(name) != 'undefined' ){
		//	$("#comment").val("@"+name);
		//}
		//显示模态框
		$("#myModal").modal("toggle");
		
		//alert( $("#myModal").text() );
		
	});
	
/* 回复评论显示模态框  这个废弃掉   仅作为参考 */
	$('.repay').on('click', '.thisreply',function() {
		//alert("哈哈哈");
		$("#hiddenreplyId").val($(this).attr('replyId'));
		$("#hiddenreplyModule").val($(this).attr('replyModule'));
		var name = $(this).attr('replyName');
		$('.replyName').val(name);
		
		//alert(name);
		
		//editor.sync(); 
		//$(".contentfuwenben").val("@"+name);
		if(typeof(name) != 'undefined' ){
			//editor.html("@"+name);
			$("#comment").val("@"+name);
		}
		$("#myModal").modal("toggle"); //打开模态框
	});
	/* 回复评论显示模态框  这个废弃掉 */
	
	
	/*回复与评论的提交 */
	$('#commentsave').on('click',function() {
		//alert("又来呀");
		var size=${page.size}; //当前显示的评论条数
		//当前回复的对象id
		var replyId = $("#hiddenreplyId").val();
		//当前回复的是别人的评论还是帖子
		var module = $("#hiddenreplyModule").val();
		
		//获取模态框中文本的内容
		var comment = $("#comment").val();
		
		if( comment == '' || comment == 'undefined'){
			swal("请填写评论内容！","内容不能为空","warning");
			
			return false;
			
		}else{
			
			$('.repay').load('/replyhandle?size='+size, { //ajax重新去加载这个div的内容
				replyId : replyId,
				module : module,
				comment : comment,
			});
			//alert("发生了什么");
			$("#comment").val(""); //清空输入框文本的内容
		}
		
		
	});
	
	/* 点击加载更多 */
	$('.table').on('click','.addmore',function(){
		var selecttype=$("#selecttype option:selected").val();	//获得查看类型select中的值
		var selectsort=$("#selectsort option:selected").val();	//获得时间排序select中的值
		var num=${discuss.discussId};
		var page=${page.number};
		var shengyu = $("#input_shengyu").val(); //剩余条数
		var size_input = $("#input_size").val();
		var size =parseInt(size_input); //当前显示条数
		//alert(shengyu);
		//alert(input_size);
		var flag = 0;
		if( shengyu >= 5 ){
			size = size + 5;
		}else if(shengyu < 5){
			size = size + shengyu;	
		}else{ //如果到底了
			flag = 1;
		}
		//alert(size);
		//向后台请求数据
		if(flag){
		}else{
			$('.repay').load('/replypaging',{num:num,size:size,selecttype:selecttype,selectsort:selectsort}); 	
		}
		<#--if(${page.size}<=${page.totalElements}){
			
			$('.repay').load('/replypaging',{num:num,size:size,selecttype:selecttype,selectsort:selectsort}); 
		}-->
		
	});
	
	
//////////////////////////////////////////////////////////////////////////
	//点击回复显示输入框  repay （回复评论的）
	$(".repay").on("click",".thisreply1",function(){
		
		//先赋值
		$("#hiddenreplyId").val($(this).attr('replyId'));
		$("#hiddenreplyModule").val($(this).attr('replyModule'));
		
		//隐藏其他一打开的输入框
		$(".huifu2").not(this).each(function(){
				
				$(this).hide();
				
			});
		
		//让文本框获取焦点
		
		
		//.show()  再显示当前输入框  tishixinxi
		var huifu = $(this).closest(".list-inline").next().next();
		//回复提示div
		var tishixinxi = huifu.find(".tishixinxi");
		
		//设置提示内容
		var tishineirong = tishixinxi.find(".tishineirong");
		
		//获取当前评论是谁发布的   
		var granfather = $(this).closest(".post");
		
		var usernametishi = granfather.find(".usernametishi");
		
		//alert(usernametishi.val());
		
		//设置回复提示
		tishineirong.text(usernametishi.val()); //设置文本值
		
		//设置要回复的对象
		$("#duiyingdeyonghumingchneg").val(usernametishi.val());
		
		if( huifu.css("display")=="none" ){
			
			huifu.show();
	
		}else{
			huifu.hide(); //隐藏
		}
		
		$(this).closest(".replyrefresh").next().css("display","block");
		
		//alert(huifu);
		 return false ;
	});

	//点击回复显示评论框（这是回复别人的回复）
	$(".repay").on("click",".thisreply2",function(){
		//alert("来了");
		
		//首先获取内容对象id和类型（这里搞错了，获取的应该是对应的评论的id）
		//var commentid = $(this).closest(".zheshiyaozhaode").find(".cunfanghuifuid").val();
		
		var commentid = $(this).closest(".post").find(".huoqupinglunid").val();
		
		//获取回复的类型
		var huifudeleixing = $(this).attr('replyModule');
		
		//报错到输入隐藏框
		$("#hiddenreplyId").val(commentid);
		$("#hiddenreplyModule").val(huifudeleixing);
		
		//获取显示要回复谁
		var yaohuifudeduxiang = $(this).closest(".user-block").find(".yaohuifudeyonghu").val();
		//alert(yaohuifudeduxiang);
		//设置提示信息，显示要回复谁
		$(this).closest(".post").find(".tishixinxi").find(".tishineirong").text(yaohuifudeduxiang);
		
		//设置要回复的对象
		$("#duiyingdeyonghumingchneg").val(yaohuifudeduxiang);
		//alert(tishixinxi);
		
		//显示富文本
		$(this).closest(".post").find(".replyrefresh").find(".huifu2").show(); 

		return false;
	});
	
	//点击显示回复信息
	$(".repay").on("click",".dianjixianshihuifu",function(){
		//alert("来了老弟");
		//$(this).css("display","none");
		
		//alert();
		
		//$(this).closest(".replyrefresh").next().css("display","block ");
		
		var shifouyijingxianshi = $(this).closest(".replyrefresh").next().css("display");
		
		if( shifouyijingxianshi == 'none' ){
			$(this).closest(".replyrefresh").next().css("display","block");
		}else{
			$(this).closest(".replyrefresh").next().css("display","none");
		}
		
	});
	
	//点击回复执行
	$(".repay").on("click",".quedinghuifu",function(){
		
		//获取用户头像
    	var imageuser = '${user.imgPath}';
    	//用户明
		var username = '${user.userName}';
		
		//当前日期
		var mydate = new Date();
	    var strdata = "" + mydate.getFullYear() + "-";
	    var yue = mydate.getMonth()+1;
	    if(yue < 10){
	    	yue = '0' + yue;
	    }
	    strdata += yue + "-";
		var ri = mydate.getDate();
		if(ri<10){
			ri = '0' + ri;	
		}
	    strdata += ri + " ";
	    var xiaoshi = mydate.getHours();
	    if(xiaoshi < 10){
	    	xiaoshi = '0'+xiaoshi;
	    }
	    strdata += xiaoshi + ":";
	    var fenzhong = mydate.getMinutes();
	    if(fenzhong < 10){
	    	fenzhong = '0'+fenzhong;
	    }
	    strdata += fenzhong + ":";
	    var miao = mydate.getSeconds();
	    if(miao<10){
	    	miao = '0' + miao;
	    }
	    strdata += miao;
  		
	    
	    var str;
	    //判断有没有删除权限
	    
	    //获取输入框的div，用来控制隐藏
		var huifu = $(this).closest("#huifu");
			
			//添加子結點
             var fatherchaoji = $(this).closest(".post").find(".tianjiahuifuneirong");//.find(".table");
             	
			//获取当前回复的对象id
			//var huoqupinglunid = $(this).closest(".post").find(".huoqupinglunid");
           	var replyId = $("#hiddenreplyId").val();
			//当前回复的是别人的是评论还是帖子
			var module = $("#hiddenreplyModule").val();
			var duiyingusername = $("#duiyingdeyonghumingchneg").val();
			
			
			//alert(duiyingusername);
			
			
			
			//获取当前回复对应的用户名称  以下没有看清楚dom树结构导致个错误不过影响不大
			<#--if(module == 'reply'){ //如果是回复评论的
				duiyingusername =$(this).closest(".post").find(".usernametishi").val();
				//alert(duiyingusername);
			}else{ //否则就是回复回复的 //待定
				duiyingusername =$(this).closest(".post").find(".yaohuifudeyonghu").val();
			
				alert(duiyingusername);
			}-->
			
			
			
			//alert(replyId+module);
			
           $.ajax({
            //几个参数需要注意一下
                type: "POST",//方法类型
                contentType:"application/x-www-form-urlencoded",
                dataType: "json",//预期服务器返回的数据类型
                url: "testhhhh?"+"duiyingusername="+duiyingusername+"&replyId="+replyId+"&module="+module ,//url
                data: $(this).prev().serialize(), //这里提交form表单
                success: function (result) {
                	

                    if(result.comment != null){
                    	//存放评论的id
                    	var cunfangid = result.id;
                    	//回复的内容
                    	var content = result.comment;  
                    	
                    	//设置要添加的子节点代码
                	   	<#if manage??>
                			str = "<tr  class='zheshiyaozhaode' >" + 
                			"	<input class='cunfanghuifuid' type='hidden' value='" + cunfangid + "' />"+
                			"								<td class='comment-td'><a href='#'> <img " + 
                			"										src='/image/" + imageuser + "' class='big-img' />\n" + 
                			"								</a></td>" + 
                			"								<td>" + 
                			"									<div class='user-block'>" + 
            				"										<input type='hidden' class='yaohuifudeyonghu' value='" + username + "'>"+
            				"										<a href='' class='raply-name'>"+ username +'->回复 @ ' +"<font color='#C71585'>" +duiyingusername+" ： </font>"+ "</a> " +
                													 content + 
                			"										<ul class='list-inline pull-right' " + 
                			"											style='display: block;'> " + 
                			"											<li>" +strdata+"</li> " + 
                			"										</ul>" + 
							"			                			<div>"+
							"											<a href='javascript:void(0);' class='label shanchu deletethis' replyId='待定' replyModule='comment'><span " +
							"													class='glyphicon glyphicon-remove'></span>删除</a>"+										
							"										</div>"+
                			"									</div>" + 
                			"								</td>" + 
                			"							</tr>";
                	   	
                	   		<#else>
                				str = "<tr   class='zheshiyaozhaode'  >" + 
                				"	<input class='cunfanghuifuid' type='hidden' value='" +cunfangid + "' />"+
                				"								<td class='comment-td'><a href='#'> <img " + 
                				"										src='/image/" + imageuser + "' class='big-img' />\n" + 
                				"								</a></td>" + 
                				"								<td>" + 
                				"									<div class='user-block'>" + 
                				"										<input type='hidden' class='yaohuifudeyonghu' value='" + username + "'>"+
                				"										<a href='' class='raply-name'>"+ username +'->回复 @ ' +"<font color='#C71585'>" +duiyingusername+" ： </font>"+ "</a> " +
                				content + 
                				"										<ul class='list-inline pull-right' " + 
                				"											style='display: block;'> " + 
                				"											<li>" +strdata+"</li> " + 
                				"										</ul>" + 
                				"									</div>" + 
                				"								</td>" + 
                				"							</tr>";
                	   	
                	   	</#if>
                    	
                    	//添加子节点
                    	fatherchaoji.append(str);
                    	
                    	
                    	
                    	//隐藏输入框
                		huifu.hide();
                		swal("操作成功！","666","success");
                		
                    	
                    }else{
                    	swal("请填写回复内容！","内容不能为空","warning");
                    	//alert("请三山数据填写");
                    }
                    
                },
                error : function(data) {
                	//原来是每次都去执行error方法了
                    alert(data);
                }
            });
		
	});
	
	
	
	
	
	//点击取消隐藏输入框
	$(".repay").on("click","#quxiaoyincang",function(){
		var huifu = $(this).closest("#huifu");
		huifu.hide();
	}); 

	//防止页面后退
	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function () {
	        history.pushState(null, null, document.URL);
	});

	
	
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

	
	//开启评论富文本
	var editor1;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[class="contentfuwenben"]', {
			allowFileManager: true
		});
		

	});


	KindEditor.sync();
	
	
	
</script>



<!-- 数据备份 -->
<#-- 
	str = "<tr  class='zheshiyaozhaode' >" + 
                			"	<input class='cunfanghuifuid' type='hidden' value='" + cunfangid + "' />"+
                			"								<td class='comment-td'><a href='#'> <img " + 
                			"										src='/image/" + imageuser + "' class='big-img' />\n" + 
                			"								</a></td>" + 
                			"								<td>" + 
                			"									<div class='user-block'>" + 
            				"										<input type='hidden' class='yaohuifudeyonghu' value='" + username + "'>"+
            				"										<a href='' class='raply-name'>"+ username +'->回复 @ ' +"<font color='#C71585'>" +duiyingusername+" ： </font>"+ "</a> " +
                													 content + 
                			"										<ul class='list-inline pull-right' " + 
                			"											style='display: block;'> " + 
                			"											<li>" +strdata+"</li> " + 
                			"										</ul>" + 
							"			                			<div>"+
							"											<a href='#' class='label xinzeng thisreply2'"+
							"												replyId='待定' replyModule='comment' replyName='待定'><span" +
							"													class='glyphicon glyphicon-share-alt'></span>回复"+
							"											</a>"+
							"											<a href='javascript:void(0);' class='label shanchu deletethis' replyId='待定' replyModule='comment'><span " +
							"													class='glyphicon glyphicon-remove'></span>删除</a>"+										
							"										</div>"+
                			"									</div>" + 
                			"								</td>" + 
                			"							</tr>";

 -->





