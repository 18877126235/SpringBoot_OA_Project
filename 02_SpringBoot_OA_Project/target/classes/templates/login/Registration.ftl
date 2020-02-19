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

<body  style="background-image: url(images/bg1.jpg);" >
<div class="cotn_principal">
  <div class="cont_centrar" style="top:5%;">
    <div class="cont_login">
      <div class="cont_forms cont_forms_active_login" style=" background:#FAF0E6 ; height: 520px;width: 400px;border-radius: 15px;">
        <div   class="cont_img_back_"> <img src="images/tupian02.jpg" alt="背景图片" /> </div>
        
        
        <!-- 这里要注意，资源会被拦截哦，要记得配置不拦截 -->
        <form action="registrations"  method="post" onsubmit="return check();">
        <div class="cont_form_login" style="display: block;opacity: 1;width: 400px;">
        
        
        	<!-- 校验数据格式 -->
        	 <div class="alert alert-danger alert-dismissible"  role="alert" style="position: absolute;padding: 11px;display: none">
	          	错误信息: <span class="error-mess"></span>
	          	<button type="button" class="close" data-dismiss="alert" aria-label="Close" style="right:0px;"><span aria-hidden="true">&times;</span></button>
	          </div>
	          
	          
	          
          <h2>REGISTRATION</h2>
          
      	  <input  type="text" placeholder="You-UserName/TeL" autofocus="autofocus"  name="userName" class="userName test"/>
          <input  type="password" placeholder="You-Password" value="" name="password" class="password test"/>
          <input type="password" placeholder="Again-Password" value=""  class="passwordAgain test"/>
          <input type="text" placeholder="You-Mailboxes" autofocus="autofocus"  name="mailboxes" class="mailboxes test"/>
          
          <!--  
          <input type="text" placeholder="Code" style="margin-bottom: 20px;width:152px" name="code" class="code test"/>
           <div class="login-img" style="display:inline-block">
					<img class="thisimg" onclick="this.src='captcha?r'+Date.now()" src="captcha" alt="验证码" style="width: 100px;height: 42px;border-radius: 3px;">
				</div>
		    <br>-->
		 <div><button class="btn_login btn" type="submit" >SUBMIT-GO</button></div>
      	 <div style="width: 50px; float: left;" ><a href="login"> 返回 </a></div>
      	<div style="width:80px; float: right;" ><a href="#"><p>系统简介</p></a></div>
        </div>
        </form>
      </div>
      <br>
     <div style="border: 1px solid transparent;">
      	<p style=" margin-top: 550px;font-weight: 400;color: white ;font-size: 22px;letter-spacing:1px ;">欢迎使用OA办公自动化系统</p>
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
	
	
	

</script>
</body>
</html>
