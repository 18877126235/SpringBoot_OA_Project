
    <!-- 已登录 -->
    <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    
        <div class="panel-heading" style="background-color: white;text-align: center">
        	<!-- 点击显示个人发布的帖子 -->
        	<button class='btn btn-info'>
        		<a style="color: white;" href=""><b style="size: 20px" >个人中心</b></a>
        	</button>
            
        </div>
        <!-- <a class='btn btn-outline-success btn-sm' href="new">发表创作新主题</a> -->
         <div class="panel-heading" style="background-color: white;text-align: center">
        	<!-- 点击显示个人发布的帖子 -->
            <button class='btn btn-success'>
            	<b style="size: 20px" >
            		<a href="new" style=" width:100%; height:100%; color: white; text-decoration:none;">发表创作新主题</a>
            	</b>
            </button>
        </div>
        <ul class="list-group" style="width: 100%">
           
            <li style="text-align: center;" class="list-group-item"><a href="">0条未读提醒</a></li>
            <li style="text-align: center;" class="list-group-item"><a href="">论坛积分:0</a></li>
        </ul>
    </div>


<div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
    	 <span class="glyphicon glyphicon-chevron-left"></span> <span>热门帖子</span> <span class="glyphicon glyphicon-chevron-right"></span>
    	
        	
        	
    </div>
    <ul class="list-group" style="width: 100%">
       
       <#list fiveremen as this >
       	
       		<li style="text-align: center;" class="list-group-item"><a style="color: #CC66FF;" href="">${this.title}</a></li>
  			
       
       </#list>
       
            
    </ul>
</div>

<div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
    <div class="panel-heading" style="background-color: white;text-align: center">
    扫码下载系统APP即可享受手机在线论坛
    </div>
    <div style="width: 100%;" >
    		<img style="margin-left: auto;" width="100%"  alt="" src="images/erweima.png">
    
    </div>
   
</div>

