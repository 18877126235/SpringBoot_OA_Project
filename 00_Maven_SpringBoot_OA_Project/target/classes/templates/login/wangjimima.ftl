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
<div style="overflow: hidden;"  class="cotn_principal ">

	 <div class="cont_img_back_1"> <img src="images/2010616.jpg" alt="背景图片" /> </div>

  <div class="cont_centrar" style="top:5%;">
  
    <div class="cont_login">
      <div class="cont_forms cont_forms_active_login" style="height: 480px;width: 400px;border-radius: 15px;">
        <div class="cont_img_back_"> <img src="images/2010616.jpg" alt="背景图片" /> </div>
        <form action="##" method="post" onsubmit="return check();">
        <div class="cont_form_login" style="display: block;opacity: 1;width: 400px;">
        	 <div class="alert alert-danger alert-dismissible"  role="alert" style="position: absolute;padding: 11px;display: none">
	          	错误信息: <span class="error-mess"></span>
	          	<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="right:0px;"><span aria-hidden="true">&times;</span></button>
	          </div>
          <h2>找回密码</h2>
          <br>
          <span style="margin-left: -190px; margin-top: 10px;"><font style="font-size: 20px; color: #757575;"">用户名</font></span><br>
          <input style="margin-top: 5px;" type="text" placeholder="请输入你的用户名" autofocus="autofocus" value="${(userName)!''}"  class="userName test"/>
          <br><br>
          <span style="margin-left: -190px; margin-top: 10px;"><font style="font-size: 20px; color: #757575;">邮&nbsp;&nbsp;箱</font></span><br>
          <input style="margin-top: 5px;" type="text" placeholder="请输入用户绑定的邮箱" value="" name="" class="Email_1 test"/>
          
		    <br> <br>
		 <div><button style="background-color: ;" class="btn_yanzhengma btn_login btn" type="button" >获取修改链接</button></div>
		  <br>
      	 <div style="width: 80px; float: left;" ><a href="login"> 返回登录 </a></div>
      	<div style="width:80px; float: right;" ><a href="#"><p>其他方式？</p></a></div>
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

//验证邮箱的函数
function fChkMail(emailAddress){ 
	
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); 
	var bChk=reg.test(emailAddress); 
	return bChk; 

}


//点击input后改变边框
 $('.test').on('click',function(){
	$(this).css('border',"1px solid transparent");
}) 

	$(".btn_yanzhengma").on("click",function(){
		
		//获取用户名和邮箱，并验证格式 
		var username = $(".userName").val();
		var email = $(".Email_1").val();
		
		
		if( username == '' || email == '' ){
			swal("请完善数据填写！","用户名和邮箱账号不能为空","warning");
			
			setTimeout(function(){
				swal.close();

			},1500);
			return false;
		}
		
		//接着校验邮箱格式
		//校验邮箱格式
		if( !fChkMail(email) ){//如果邮箱格式不正确
			
			swal("邮箱格式错误！","请输入正确的邮箱账号","warning");
				setTimeout(function(){
				swal.close();
			},1500);
			return false;
		}
		
		swal({
			  title: "请求发送中，请稍后！",
			  text: "稍等一下就可以了哈！",
			  imageUrl: "images/jiazao.gif",
			});
		
		
		
		//接着去数据库看看用户名和邮箱账号是否对应
				$.ajax({
					url:"yanzhengyonghumingheyouxiang",
					dataType:"text", //预期服务器返回的数据类型
					type:"get",
					data:{username:username,email:email}, //发送到服务器的数据
					success:function(data){
						
						if(data == 'success'){
							swal("操作成功！","请注意查看邮箱信息","success");
							setTimeout(function(){
								swal.close();

							},3000);
						}else if( data == 'error1' ){
							swal("操作失败！","用户名不存在","error");
							setTimeout(function(){
								swal.close();

							},1500);
						}else if( data == 'error2' ){
							swal("操作失败！","邮箱账号不一致","error");
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
