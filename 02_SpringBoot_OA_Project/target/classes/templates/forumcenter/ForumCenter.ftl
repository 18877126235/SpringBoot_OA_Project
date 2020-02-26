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
<!-- 引入header文件 -->
<#include "header.ftl">


<!-- 盒子主题 -->
<div class="panel panel-default" id="main" style="width: 70%;margin:1% 2% 5% 5%;float: left;">
    <div class="panel-heading" style="background-color: white">
        <a style="margin-right: 2%">活跃</a><a style="margin-right: 2%">精华</a><a style="margin-right: 2%">最近</a>
    </div>

<ul class="list-group" style="width: 100%">
 
    <li class="list-group-item">
        <div style="height: 50px">
            <div style="float: left;width: 6%;margin-bottom: 5px">
            	<!-- 用户头像 -->
                <img width="50px" height="50px" src="" class="img-rounded">
            </div>
            <div style="width: 89%;float: left">
                <!--点击该条帖子查看详情-->
                <a href="">关于本次一起是否影响就业形势</a><br/>
                <div>
                    <a><span class="label label-default" >技术</span></a>&nbsp;&nbsp;&nbsp;
                    <a href=""><span ><strong>罗密欧</strong></span></a>&nbsp;&nbsp;&nbsp;
                    <small class="text-muted">2020.02.26</small>
                </div>
            </div>
            <!-- 回复数量 -->
            <div style="width: 5%;float: right;text-align: center">
                <span class="badge">999</span>
            </div>
        </div>
    </li>
    

</ul>

</div>


<!-- 引入右边侧边栏文件 -->
<#include "side.ftl">
</body>
</html>