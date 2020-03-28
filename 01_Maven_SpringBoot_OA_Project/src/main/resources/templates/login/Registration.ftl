<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<link href="images/favicon1.ico" rel="icon" type="image/x-icon"/>
<link href="images/favicon1.ico" rel="shortcut icon" type="image/x-icon"/>
<title>OA办公自动化系统-注册</title>
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
  
  
  

  
  
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#cfd8dc+0,607d8b+100,b0bec5+100 */

filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cfd8dc', endColorstr='#b0bec5',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */

}
    </style>
</head>

<!-- 引入必要的css文档 弹窗用 -->
<#include "/common/commoncss.ftl">

<body   >
<!-- <div style="background-image: url(images/bg2.png); height: 100%; width: 100% " class="cotn_principal"> 
style="background-image: url(images/bg1.jpg);"
-->
<div style="overflow: hidden;" class="cotn_principal">
	 <div class="cont_img_back_1"> <img src="images/bgzhuce.jpg" alt="背景图片" /> </div>
  <div class="cont_centrar" style="top:5%;">
    <div class="cont_login">
      <div class="cont_forms cont_forms_active_login" style=" background:#FAF0E6 ; height: 520px;width: 400px;border-radius: 15px;">
        <div   class="cont_img_back_"> <img src="images/tupian02.jpg" alt="背景图片" /> </div>
        
        
        <!-- 这里要注意，资源会被拦截哦，要记得配置不拦截  registrations        method="post"  onsubmit="return check();"-->
        <form>
        <div class="cont_form_login" style="display: block;opacity: 1;width: 400px;">
        
        
        	<!-- 校验数据格式 -->
        	 <div class="alert alert-danger alert-dismissible"  role="alert" style="position: absolute;padding: 11px;display: none">
	          	错误信息: <span class="error-mess"></span>
	          	<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="right:0px;"><span aria-hidden="true">&times;</span></button>
	          </div>
	          
	          
	          
          <h2>REGISTRATION</h2>
          
      	  <input  type="text" placeholder="You-UserName/TeL" autofocus="autofocus"  name="userName" class="userName test"/>
          <input  type="password" placeholder="You-Password" value="" name="password" class="passWord test"/>
          <input type="password" placeholder="Again-Password" value=""  class="passwordAgain test"/>
          <input type="text" placeholder="You-Mailboxes" autofocus="autofocus"  name="mailboxes" class="mailBoxes test"/>
          
          <!--  
          <input type="text" placeholder="Code" style="margin-bottom: 20px;width:152px" name="code" class="code test"/>
           <div class="login-img" style="display:inline-block">
					<img class="thisimg" onclick="this.src='captcha?r'+Date.now()" src="captcha" alt="验证码" style="width: 100px;height: 42px;border-radius: 3px;">
				</div>
		    <br>-->
		 <div>
		 	<!--  
		 	<button class="btn_login btn" type="submit" >SUBMIT-GO</button>
		 	  onclick="check()"
		 	-->
		 <label style="background: #419641;" class="btn_login btn zhuceanniu">SUBMIT-GO</label>	
		 	
		 </div>
      	 <div style="width: 50px; float: left;" ><a class="fanhui" href="login"> 返回 </a></div>
      	<div style="width:80px; float: right;" ><a href="#"><p>系统简介</p></a></div>
        </div>
        </form>
        
        
      </div>
      <br>
     <div style="border: 1px solid transparent;">
      	<p style=" margin-top: 550px;font-weight: 400;color: white ;font-size: 22px;letter-spacing:1px ;">欢迎注册OA办公自动化系统</p>
      </div>
    </div>
    
  </div>
</div>
		<!-- /.modal -->
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<!-- 错误信息提示，校验表单数据用 -->
<#if errormess??>
<script>
$(function(){
	console.log("fdsfdsfsfasdf");
	$('.error-mess').text('${errormess}');
	$('.alert-danger').css('display','block');
})
</script>
</#if>



<script type="text/javascript">

//定时器执行方法
//function hello(){
	 
	//alert("定时器执行了哦");
	//$('.alert-danger').css('display','none');
	

//}

//错误提示函数
function error(errormasage){
	//显示错误提示框
	$('.error-mess').text(errormasage);
	$('.alert-danger').css('display','block');
	$('.alert-danger').fadeOut(4000);
}

//验证邮箱的函数
function fChkMail(emailAddress){ 
	
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); 
	var bChk=reg.test(emailAddress); 
	
	return bChk; 

}
	
//表单提交校验
//function check() {
	

	//return false;
//}
	
	
	
	$(function(){
		
		$(".zhuceanniu").click(function(){
			//alert("点我");
			
			var flag = 0;
			
			
			var username = $(".userName").val();
			var passWord = $(".passWord").val();
			var passwordAgain = $(".passwordAgain").val();
			var emailInput = $(".mailBoxes").val()+'';
			
			//fanhui.click();
			//alert("哈哈哈哈，不给提交");
			
			//获取所有的输入框，查看有没有未填写的
			var inputs = $("input");
			inputs.each(function(){
				var isEmpty= $(this).val();
		        if(isEmpty == ''){
		        	//显示错误提示框
		        	$('.error-mess').text('请完善数据填写!');
		        	$('.alert-danger').css('display','block');
		        	//然后缓慢隐藏错误提示框
		        	$('.alert-danger').fadeOut(4000);
		        	flag = 1; //标记
		        	return false; //这他妈是中断循环呀。。。。。。
		        }

		    });
			if( flag == 1 ){
				return false;
			}
			
			//然后校验用户名看看是否已经存在
			//然后校验用户名看看是否已经存在
			if( flag == 1 ){
				return false;
			}
			
			//接下来判断两次密码是否一至
			//首先判断密码是否大于六位
			
			//alert();
			if(passWord.length<6){
				
				error("密码长度必须大于或等于6位！");
				return false;
			}
			//接着判断两次密码是否一致
			
			if( !(passwordAgain == passWord)){ //如果不相等
				error("两次输入的密码不一致！");
				return false;
			}
			
			//最后判断邮箱格式是否正确
			
			if( !fChkMail(emailInput) ){//如果邮箱格式不正确
				
				error("请输入正确的邮箱，邮箱格式错误！");
			
				return false;
				
			}
			
			swal("正在注册中，请稍后！","稍等一下就可以了哈","success");
			
			//alert("哈哈哈");
			//然后发送ajax注册
			 $.ajax({
					
			        url: "zhixingzhucedaima?"+"userName="+username+"&password="+passWord/*+"&eamil="+emailInput*/,
			        dataType: "text", //预期服务器返回的数据类型
			        type: "post",
			        data:{eamil:emailInput}, //发送到服务器的数据
			        success:function(data){
			        	
			        	if(data == 'success'){
							//alert("哈哈哈哈哈");
							swal("注册成功","请前往邮箱激活登录","success");
							
							setTimeout(function(){
								//alert("Hello");
								
								swal.close();
								//alert("哈哈哈");
								return false;
							},3000);
							
							/*setTimeout(function(){
								//alert("Hello");
								
								swal.close();
								
								//嵌套定时器，使得视觉体验感更佳
								setTimeout(function(){
									document.location.href="login";
								},200);
								
								
								//alert("哈哈哈");
								return false;
							},3000);*/
						}else if(data == 'error1'){
							swal("用户名已存在！","请更换用户名","warning");
						}else{
							swal("注册失败！","服务器繁忙，请稍后再试","warning");
						}
			        	
			        },
			        error:function(data){
			        	alert("失败"+data);
			        }
			        
			    });
			
			//return false;
			
			
		});
		
		
		
		
	}); //等待页面加载完毕

</script>
</body>
</html>
