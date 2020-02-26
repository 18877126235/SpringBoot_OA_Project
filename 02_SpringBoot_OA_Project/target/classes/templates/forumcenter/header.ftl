<header>
    <nav class="navbar navbar-default" role="navigation" style="background-color: white">
        <div class="container-fluid" style="margin-left: 10%">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">论坛首页</a>
            </div>
            <div>

                <#--向左对齐    原著中使用 添加 <c:if test="${tab.tabNameEn == 'tech'}">
                            class="active" </c:if> 用来实现标记当前所属模块-->
                <ul class="nav navbar-nav navbar-left">
                
                    <li><a href="/tab/tech">技术</a></li>
                    <li><a href="/tab/play">好玩</a></li>
                    <li><a href="/tab/creative">创意</a></li>
                    <li><a href="/tab/jobs">工作</a></li>
                    <li><a href="/tab/deals">交易</a></li>

                </ul>

                
                <!--未登陆-->
                 <ul class="nav navbar-nav navbar-right">
                       <li>
                           <p class="navbar-text"><a href="signin">与我相关</a></p>
                       </li>
                       <li>
                               <p class="navbar-text"><a href="signup">更多</a></p>
                       </li>
                 </ul>
          
            </div>
            
        </div>
    </nav>


</header>
<script>
    function signout_confirm()
    {
        var r=confirm("确定退出?")
        if (r==true)
        {
            window.location.href="/signout";
        }
        else
        {

        }
    }
</script>