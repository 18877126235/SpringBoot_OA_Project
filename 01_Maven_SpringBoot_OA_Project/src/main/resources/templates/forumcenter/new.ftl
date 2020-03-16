<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>创作新主题 › Genesis </title>
   
        <!-- swett弹窗引入 -->
    <#include "/common/commoncss.ftl">
    <!-- 必要 -->
	<script charset="utf-8" src="plugins/kindeditor/lang/zh_CN.js"></script>
	<!-- 必要 -->
	<script charset="utf-8" src="plugins/kindeditor/kindeditor-min.js"></script>
	
	<!-- 这里可能实在js代码中授予富文本的权限-->
	<!-- 这里可能实在js代码中授予富文本的权限 -->
	 <script type="text/javascript" src="js/mail/mail.js" ></script>


</head>
<body>

<!-- 引入header文件 -->
<#include "header.ftl">

    <div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="">Genesis</a> › 创作新主题
        </div>

        <div class="panel-body">
            <form action="newtiezi" method="post" enctype="multipart/form-data" id="replyForm">
                <div class="form-group">
                    <label for="title">主题标题</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空" required="required">
                </div>
                 
               <!--  <div class="form-group">
                    <label for="content">正文</label>
                    <textarea class="form-control" rows="10" id="content" name="content"></textarea>
                </div>-->
				
				  <label>正文</label>
				  <div class="form-group">
		
						<textarea name="content" placeholder="在此处填写内容...." class="form-control tent" style="width: 100%; height: 360px;  font-size: 20px;"></textarea>
					
					</div>
				
				
                <div class="form-group">
                	
                   
                    <div class="col-sm-10" style="width: 40%">
                     <label for="tab">板块类型</label>
                        <select style="margin-left: 0px;" class="form-control" id="tab" name="typeId">
                            <option value="48">技术</option>
                            <option value="49">工作</option>
                            <option value="52">创意</option>
                            <option value="51">生活</option>
                            <option value="50">好玩</option>
                            <option value="">其他</option>
                        </select>
                    </div>
                </div><br/>
                <!-- <input type="submit" class="btn btn-default btn-sm" value="发布主题"> -->
 				<button style="display: none;" id="btn_03" type="submit">提交03</button>
 				
			</form>
			
			<div class="row">
				
				<button style="margin-top: 6px;" id="btn_01" class="btn btn-success btn-default btn-sm">确定发布</button>
			</div>
			
        </div>

    </div>



</div>


    <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
        <div class="panel-heading" style="background-color: white;text-align: center">
            发帖提示
        </div>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                <h5>主题标题</h5>
                <p>
                   	 请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。
                </p>
            </li>

            <li class="list-group-item">
                <h5>正文</h5>
                <p>
                    请清楚地表达所要说明的内容。
                </p>
            </li>
        </ul>
    </div>


    <div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
        社区指导原则
    </div>
    <ul class="list-group" style="width: 100%">
        <li class="list-group-item">
            <h5>尊重原创</h5>
            <p>
                请不要发布任何盗版下载链接，包括软件、音乐、电影等等。Genesis是创意工作者的社区，我们尊重原创。
            </p>
        </li>

        <li class="list-group-item">
            <h5>友好互助</h5>
            <p>
                保持对陌生人的友善。用知识去帮助别人。
            </p>
        </li>
    </ul>
</div>




<script>
    function submitValidate(flag){
        return flag;
    }
    
   
    
   //点击弹出模态框测试$("#btn_motai").on("click",function(){ alert("哈哈哈");  });
   $(function(){
	 
	   
	   $("#btn_01").click(function(){
		   //swal("操作成功！","666","success");
		   //alert("哈哈哈");
		   //$("#replyForm").submit();
		   
		   if($("#title").val()==''){
			   
			   swal("请填写标题！","内容可以为空，标题不可为空","warning");
	           
	            
	        }else{
	        	swal({ 
					title: "确定发表吗？", 
					text: "发表后的帖子所有人均可见！", 
					type: "success",
					showCancelButton: true, 
					confirmButtonColor: "#00c0ef",
					confirmButtonText: "确定", 
					cancelButtonText: "取消",
					closeOnConfirm: false, 
					closeOnCancel: false	
					},
					function(isConfirm){ 
					if (isConfirm) { 
						
						
						swal.close();//关闭窗口
						//$("#replyForm").submit();//提交表单
						 $("#btn_03").click();//提交表单
						
					} else { 
						
						swal.close();//关闭窗口
						
					} 
				});
	        }
		   
		   
		   
	   });
	   
   });
    
 	//开启富文本
	
    
</script>
</body>
</html>