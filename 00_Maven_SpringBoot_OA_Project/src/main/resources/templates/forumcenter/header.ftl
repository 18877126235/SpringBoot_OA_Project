<header>
    <nav class="navbar navbar-default" role="navigation" style="background-color: white">
        <div class="container-fluid" style="margin-left: 10%">
        
        	
        	
        					
            <div class="navbar-header">
            	
            	<#if isindex??>
            		<#if typeid??> <!-- 如果存在类型id -->
            			<!-- 正常显示 -->
            			<a class="navbar-brand" href="ForumCenter">论坛首页</a>
            			<#else>
            				<!-- 设置背景 -->
            				<a style="background: #FFCCCC; " class="navbar-brand" href="ForumCenter">论坛首页</a>
            				
            			
            		</#if>
					
					<#else>
						<!-- 正常显示 -->
            			<a class="navbar-brand" href="ForumCenter">论坛首页</a>
					
            	</#if>
            
                
                
                
            </div>
            
            <div>

                <#--向左对齐    原著中使用 添加 <c:if test="${tab.tabNameEn == 'tech'}">
                            class="active" </c:if> 用来实现标记当前所属模块-->
                <ul class="nav navbar-nav navbar-left">
                
                <#if typeid??> <!-- 如果是从类型上点击加载过来的 -->
                
                	<li  
                		<#if typeid==48>   class="active"  </#if>   
                			><a href="ForumCenter?typeid=48">技术</a></li>
                    <li <#if typeid==50>   class="active"  </#if>  ><a href="ForumCenter?typeid=50">好玩</a></li>
                    <li <#if typeid==52>   class="active"  </#if> ><a href="ForumCenter?typeid=52">创意</a></li>
                    <li  <#if typeid==49>   class="active"  </#if>  ><a href="ForumCenter?typeid=49">工作</a></li>
                    <li <#if typeid==51>   class="active"  </#if> ><a href="ForumCenter?typeid=51">生活</a></li>
                    <li><a href="ForumCenter?typeid=51">其他</a></li>
                	
                	<#else> <!-- 正常显示 -->
                		<li ><a href="ForumCenter?typeid=48">技术</a></li>
	                    <li><a href="ForumCenter?typeid=50">好玩</a></li>
	                    <li><a href="ForumCenter?typeid=52">创意</a></li>
	                    <li><a href="ForumCenter?typeid=49">工作</a></li>
	                    <li><a href="ForumCenter?typeid=51">生活</a></li>
	                    <li><a href="ForumCenter?typeid=51">其他</a></li>
                </#if>
                
                    

                </ul>
				
				<ul style=" margin-top: 6px; margin-left: 50px;" class="nav navbar-nav ">
                
                  	<div  class="box-tools">
						<div  class="input-group" style="width: 150px; ">
							<input type="text" style="height: 34px;" class="form-control input-sm baseKey"  placeholder="按标题查找" />
							<div class="input-group-btn">
								<a class="btn btn-sm btn-default baseKetsubmit"><span
								class="glyphicon glyphicon-search"></span></a>
							</div>
						</div>
					</div>

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