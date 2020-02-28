<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type"  content="text/html;charset=utf-8">
    <meta name="keywords" content="Genesis,论坛,社区,程序员">
    <title>论坛中心 </title>
    <#include "/common/commoncss.ftl">
    
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
            background: #f0f2f5;
        }
        .footer {
            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px ;
            clear:both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }
        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }
        a{
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="row" style="padding-top: 10px;">
	<div class="col-md-2">
		<h1 style="font-size: 24px; margin: 0;" class="">讨论区</h1>
	</div>
	<div class="col-md-10 text-right">
		<a href="index"><span class="glyphicon glyphicon-home"></span> 首页</a>
		> <a disabled="disabled">${name}</a>
	</div>
</div>
<br>
<!-- 引入header文件 -->
<#include "header.ftl">

<!-- 盒子主题 
<div class="panel panel-default" id="main" style="width: 70%;margin:1% 2% 5% 5%;float: left;">-->

<!-- 盒子主体 -->
<div class="box-body no-padding" id="main" style="width: 70%;margin:1% 2% 5% 5%;float: left;">
	<div class="table-responsive thistable">
		<!--id="container"-->
		<!-- 包含论坛主体身体 -->
		<#include "ForumCentertable.ftl"/>
	</div>
	
</div>
	



<!-- 引入右边侧边栏文件 -->
<#include "side.ftl">
<!-- 成功提示框 -->
<#include "/common/modalTip.ftl"/>
</body>
</html>