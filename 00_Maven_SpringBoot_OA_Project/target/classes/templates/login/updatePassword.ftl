<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<link href="images/favicon1.ico" rel="icon" type="image/x-icon"/>
<link href="images/favicon1.ico" rel="shortcut icon" type="image/x-icon"/>
<title>OA办公自动化系统</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/login.css">
 <style>

        .inp {
            border: 1px solid #cccccc;
            border-radius: 2px;
            padding: 0 10px;
            width: 278px;
            height: 40px;
            font-size: 18px;
        }
/* 
        .btn {
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #cccccc;
            border-radius: 2px;
            width: 100px;
            height: 40px;
            line-height: 40px;
            font-size: 16px;
            color: #666;
            cursor: pointer;
            background: white linear-gradient(180deg, #ffffff 0%, #f3f3f3 100%);
        } */

        .btn:hover {
            background: #3c83a5;
            color:#fff;
        } 

        #captcha {
            width: 300px;
            display: inline-block;
        }

        label {
            vertical-align: top;
            display: inline-block;
            width: 80px;
            text-align: right;
        }

        #wait {
            text-align: left;
            color: #666;
            margin: 0;
        }
		.thisimg:HOVER {
			cursor: pointer;
		}
		.test:FOCUS {
		border-color: #66afe9 !important;
	}
	.modal-dialog {
				width: 500px;
			}
			
			.modal-body .icon {
				height: 80px;
				width: 80px;
				margin: 20px auto;
				border-radius: 50%;
				color: #aad6aa;
				border: 3px solid #d9ead9;
				text-align: center;
				font-size: 44px;
			}
			
			.modal-body .icon .glyphicon {
				top: 11px;
			}
			
			.modal-p {
				margin: 20px auto;
			}
			
			.modal-body .modal-p h2 {
				text-align: center;
			}
			
			.modal-body .modal-p p {
				text-align: center;
				color: #666;
				font-size: 16px;
				padding-top: 8px;
				font-weight: 300;
			}
			
			.modal-p .btn {
				width: 100px;
				height: 40px;
			}
			.modal-error .icon{
				color: #f27474;
				border: 3px solid #f27474;
				}
				
.cotn_principal {
  position: absolute;
  width: 100%;
  height: 100%;
	
		

filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cfd8dc', endColorstr='#b0bec5',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

}
    </style>
</head>

<body>
<!-- 引入必要的css文档 弹窗用 -->
<#include "/common/commoncss.ftl">

<!--  style="background: url(images/tupian002.jpg); " -->
<div  style="overflow: hidden;  background-color: #5bc0de;"  class="cotn_principal ">

	 <div class="cont_img_back_1">  </div>

  <div class="cont_centrar" style="top:5%;">
  
    <div class="cont_login">
      <div class="cont_forms cont_forms_active_login" style="height: 480px;width: 400px;border-radius: 15px;">
        <div class="cont_img_back_">  </div>
        <form action="##" method="post" onsubmit="return check();">
        <div class="cont_form_login" style="display: block;opacity: 1;width: 400px;">
        	 <div class="alert alert-danger alert-dismissible"  role="alert" style="position: absolute;padding: 11px;display: none">
	          	错误信息: <span class="error-mess"></span>
	          	<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="right:0px;"><span aria-hidden="true">&times;</span></button>
	          </div>
          <h2  style="color:;" >修改密码</h2>
          <br>
          <span style="text-align:center; margin-top: 10px;"><font style="font-size: 20px; color: #757575;"">请输入新密码</font></span><br>
       
          <input style="margin-top: 5px;" type="password" placeholder="请输入至少六位密码" autofocus="autofocus" value="${(userName)!''}"  class="mimaone test"/>
          <br><br>
          
           <span style="text-align:center; margin-top: 10px;"><font style="font-size: 20px; color: #757575;"">确认密码</font></span><br>
       
          <input style="margin-top: 5px;" type="password" placeholder="请输入至少六位密码" autofocus="autofocus" value="${(userName)!''}"  class="mimatwo test"/>
          
          
		    <br> <br>
		 <div><button style="background-color: ;" class="btn_yanzhengma btn_login btn" type="button" >确定修改</button></div>
		  <br>
      	 <div style="width: 80px; float: left;" ><a href="login"> 返回登录 </a></div>
      	<div style="width:80px; float: right;" ><a href="#"><p>注意事项</p></a></div>
        </div>
        </form>
      </div>
     <div style="border: 1px solid transparent;">
      	<p style="margin-top: 550px;font-weight: 400;color: white;font-size: 22px;letter-spacing:1px ;">通过绑定的邮箱找回密码</p>
      </div>
    </div>
    
  </div>
</div>

<!-- 模态框 -->
<div class="modal fade in" id="mymodal" data-backdrop="static" >
			<div class="modal-dialog" style="top: 20%;">
				<div class="modal-content">
					<div class="modal-body modal-error">
						<div class="icon">
							<span class="glyphicon">!</span>
						</div>
						<div class="modal-p">
							<!--<h2 style="text-align: center;">提示信息</h2>-->
							<p class="modal-error-mess">该用户已经登录了，是否继续 ？</p>
							<div class="modal-p">
								<button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
								<button type="button" class="btn btn-primary contiue" data-dismiss="modal">继续</button>
							</div>
						</div>
					</div>

				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		 
		<!-- /.modal -->
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<!-- 显示模态框 -->
<#if hasmess??>
<script type="text/javascript">
	$(function(){
		$('#mymodal').modal('show');
	})
</script>
</#if>

<!-- 提示错误 -->
<#if errormess??>
<script>
$(function(){
	console.log("fdsfdsfsfasdf");
	$('.error-mess').text('${errormess}');
	$('.alert-danger').css('display','block');
})
</script>
</#if>

<#if success??>
<script>
$(function(){
	
	//console.log("fdsfdsfsfasdf");
	swal("激活成功","请登录","success");
	setTimeout(function(){
		//alert("Hello");
		
		swal.close();
		//alert("哈哈哈");
		
		
	},3000);
	return false;
});
</script>
</#if>

<script type="text/javascript">


//错误提示函数
function error(errormasage){
	//显示错误提示框
	$('.error-mess').text(errormasage);
	$('.alert-danger').css('display','block');
	$('.alert-danger').fadeOut(4000);
}



//点击input后改变边框
 $('.test').on('click',function(){
	$(this).css('border',"1px solid transparent");
}) 

	$(".btn_yanzhengma").on("click",function(){
		
		var password1 = $(".mimaone").val();
		var password2 = $(".mimatwo").val();
		
		if( password1 != password2 ){
			error("两次输入的密码不一致！");
			
			return false;
		}
		
		if( password1.length < 6 ){
			
			error("密码长度不能小于六位！");
			return false;
		}
		
		
		//执行修改
		$.ajax({
					url:"updatePasswordToGo",
					dataType:"text", //预期服务器返回的数据类型
					type:"get",
					data:{password:password1}, //发送到服务器的数据
					success:function(data){
						
						if(data == 'success'){
							swal("密码修改成功！","正在为您跳转登陆界面","success");
							setTimeout(function(){
								swal.close();
								//alert("哈哈哈");
								//嵌套定时器，使得视觉体验感更佳
								setTimeout(function(){
									document.location.href="login";
								},200);

							},3000);
						}else{
							swal("操作失败！","服务器异常","error");
							setTimeout(function(){
								swal.close();

							},1500);
						}
						return false;
					},
					error:function(data){
						alert("失败"+data);
					}
					
				});//ajax结束
		
		
		
	});
		
		

	
</script>

</body>
</html>
