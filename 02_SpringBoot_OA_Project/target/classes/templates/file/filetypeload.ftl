<div class = "menu">
	<!-- ***********************以下是点击右键显示内容****************************** -->
	<ul class="nav nav-pills nav-stacked" style="padding:5px 0 5px 0;">
		<#if isload??>
			<#if istrash??>
				<li><a class="filereturnback">还原</a></li>
			<#elseif isshare??>
				<li><a class="downloadfile">下载</a></li>
			<#else>
				<li><a class="downloadfile">下载</a></li>
				<li><a class="loadokshare">分享</a></li>
				<li><a class="menurename">重命名</a></li>
				<li><a onclick="{return confirm('文件将放入回收站，确定删除吗？');};" class="loadtrash">删除</a></li>
			</#if>
		<#else>
			<li><a class="open">打开</a></li>
			<li><a class="downloadfile">下载</a></li>
			<li><a class="doshare" href="doshare?pathid=${nowpath.id}&">分享</a></li>
			<li><a class="movefile">移动到</a></li>
			<li><a class="copyfile">复制到</a></li>
			<li><a class="menurename">重命名</a></li>
			<li><a onclick="{return confirm('文件将放入回收站，确定删除吗？');};" class="delete">删除</a></li>
		</#if>
	</ul>
	
</div>



<div class="bgc-w box box-primary" style="height: 695px;">

	<!--盒子头-->
	<div class="box-header">
		
		<#if isload??>
		
			<#if type=="picture">
				<h3 class="box-title" style="font-size: 20px;">图片</h3>
				<!-- 隐藏的input用于处理特定的请求 -->
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="document">
				<h3 class="box-title" style="font-size: 20px;">文档</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="music">
				<h3 class="box-title" style="font-size: 20px;">音乐</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="video">
				<h3 class="box-title" style="font-size: 20px;">视频</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="yasuo">
				<h3 class="box-title" style="font-size: 20px;">压缩包</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="trash">
				<h3 class="box-title" style="font-size: 20px;">回收站</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="share">
				<h3 class="box-title" style="font-size: 20px;">分享文件</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			<#elseif type=="all">
				<h3 class="box-title" style="font-size: 20px;">全部文件查找</h3>
				<input class="loadfilestype" name="type" type="hidden" value="${type}"/>
			</#if>
			
		<#else>
			<!-- 否则就是默认显示全部文件页面了 -->
			<!-- 当前路径的父路径是1说明是根路径 -->
			<#if nowpath.parentId == 1>
				<!-- 以下显示用户名 -->
				<h3 class="box-title" style="font-size: 20px;">${nowpath.pathName}</h3> 
				<!-- 否则就是点开某个文件夹 -->
			<#else>
				<h3 class="box-title" style="font-size: 20px;">
					<a style="font-size: 12px;" href="filetest?pathid=${nowpath.parentId}">返回上一层 </a>
					>
					<!-- 遍历打印当前文件的所有父级目录 放在a标签中可以点击-->
					<#list allparentpaths as allparenth>
					<a style="font-size: 12px;" href="filetest?pathid=${allparenth.id}">${allparenth.pathName}</a>
					>
					</#list>
					<!-- 当前所在文件夹名称 -->
					${nowpath.pathName} 
					
				</h3>
			</#if>
			
			
		</#if>
		
		<!-- 搜索栏 -->
		<div class="box-tools">
			<div class="input-group" style="width: 150px;">
				<input type="text" class="form-control input-sm findfileandpath"
					placeholder="查找..." />
				<div class="input-group-btn">
					<!-- 查找按钮 -->
					<a class="btn btn-sm btn-default btn-change findfileandpathgo"><span
						class="glyphicon glyphicon-search"></span></a>
				</div>
			</div>
		</div>

	</div>
	
	
	
	<!-- 盒子身体   以下就是显示相对应的文件和文件夹了 -->
	<div class="box-body no-padding">
	
		<div style="padding-left: 10px;">
			<!-- 全选和反选按钮 -->
			<a class="btn btn-sm btn-default allcheck"
				href="javascript:void(0);" title="全选/反选"><span
				class="iconfont icon-xuanze1"></span></a>
			<div class="btn-group">
				<!-- 如果存在isload  说明点击了左侧相关的文件菜单选项  比如：图片，文档，音乐等  不会显示新建文件夹的图标 -->
				<#if isload??>

					<!-- 如果此时是在回收站目录下 这可是真正的把文件彻底的删除掉了 -->
					<#if istrash??>
						<a  class="btn btn-sm btn-default loaddelete" title="删除">
							<span class="iconfont icon-lajitong"></span>
						</a>
						<!-- 分享目录下不存在删除按钮 什么都不写-->
					<#elseif isshare??> 
					
					<!-- 其他菜单下的删除按钮 -->
					<#else>
						 <a  class="btn btn-sm btn-default loadtrash" title="删除">
							<span class="iconfont icon-lajitong"></span> 
							
						<!--  onclick="{return confirm('文件将放入回收站其他菜单啦啦啦，确定删除吗？');};"     <a onclick="fundelete()" class="btn btn-sm btn-default loadtrash" title="删除">
							<span class="iconfont icon-lajitong"></span>-->
						</a> 
					</#if>
					
					
				<!-- 否则就是文件总体目录的显示  会显示出新建文件夹按钮-->
				<#else>
					<!--  
					<a onclick="{return confirm('文件将放入回收站，确定删除吗？');};"  class="btn btn-sm btn-default topdelete" href="deletefile?pathid=${nowpath.id}&checkpathids=&checkfileids=" title="删除">
						<span class="iconfont icon-lajitong"></span>
					</a>
					-->
					<!-- 修改称ajax方式来删除有点难 -->
					
					<a class="btn btn-sm btn-default topdelete"  title="删除">
						<span class="iconfont icon-lajitong"></span>
					</a>
				
					
					<!-- 新建文件夹按钮 -->
					<a class="btn btn-sm btn-default topcreatepath" href="javascript:void(0);" title="新建文件夹">
						<span class="iconfont icon-xinzengwenjian"></span>
					</a>
					
				</#if>
			</div>
			
			<!-- 刷新按钮 -->
			<a class="btn btn-sm btn-default" href="filemanage" title="刷新"><span
				class="iconfont icon-shuaxin"></span></a>
			<div style=" vertical-align:center; height:35px; float: right;" class="col-md-10">
				<p id="showfilename" style="display: none;line-height:35px;" ></p>
			</div>
		</div>
			
		
		<div class="file-box" style="overflow-y: auto;">
			<div class = "boxcontain" style="height: auto;">
			
				<!-- 权限控制 必须是没有点击相关的菜单选项才能创建文件夹  -->
				<#if !isload??>
					<!--新建文件夹操作显示部分  点击新建文件夹按钮显示内容和操作 -->
					<div class="file-one creatpath pathtextarea diplaynone" style="width: 144px;">
						<div class="file-img">
							<img src="images/fileimg/Folder.png" />
						</div>
						<div class="file-name" style="text-align: left;">
							<form action="createpath">
								<input class="creatpathinput" type="text" name="pathname" value="新建文件夹"/>
								<input type="hidden" name="pathid" value="${nowpath.id}"/>
								<!-- 以下分别是确定和取消按钮 -->
								<button class="btn btn-default">
									<em class="glyphicon glyphicon-ok" style="font-size: 12px;"></em>
								</button>
								<span class="btn btn-default">
									<em class="glyphicon glyphicon-remove cansalcreate" style="font-size: 12px;"></em>
								</span>
							</form>
						</div>
						<!-- 左上角的打勾按钮 -->
						<span class="file-check"> 
							<span class = "iconfont icon-xuanze" style="height:1.5em;width:1.5em"></span>
						</span>
					</div>
					
				</#if>
				
				
				<!-- ************如果说paths不为空，也就是当前目录存在文件夹 那就先显示文件夹********* -->
				<#if paths??>
					<#list paths as path>
						<div class="file-one">
							<div class="file-img path">
								<!-- 如果已经被删除了 -->
								<#if istrash??>
									<a>
										<img src="images/fileimg/Folder.png" />
									</a>
								<#else>
									<a href="filetest?pathid=${path.id}">
										<img src="images/fileimg/Folder.png" />
									</a>
								</#if>
							</div>
							<div class="file-name path">
							
								<#if istrash??>
									<div class="filename">
										<a style="font-size: 12px;">${path.pathName}</a>
									</div>
								<#else>
									<div class="filename">
										<a href="filetest?pathid=${path.id}" style="font-size: 12px;">${path.pathName}</a>
									</div>
								</#if>
								
								<div class="pathtextarea rename diplaynone" style="position: absolute;top: 97px;left: -5px;z-index:100;">
									<#if isload??>
										<input class="creatpathinput" type="text" name="name" value="${path.pathName}"/>
										<input class="renamefp" type="hidden" name="renamefp" value="${path.id}"/>
										<input class="pathid" type="hidden" name="pathid" value="${path.parentId}"/>
										<input class="isfile" type="hidden" name="isfile" value="false"/>
										<button class="btn btn-default okfilerename">
											<em class="glyphicon glyphicon-ok" style="font-size: 12px;"></em>
										</button>
										<span class="btn btn-default">
											<em class="glyphicon glyphicon-remove cansalcreate" style="font-size: 12px;"></em>
										</span>
									<#else>
										<form action="rename">
											<input class="creatpathinput" type="text" name="name" value="${path.pathName}"/>
											<input type="hidden" name="renamefp" value="${path.id}"/>
											<input type="hidden" name="pathid" value="${nowpath.id}"/>
											<input type="hidden" name="isfile" value="false"/>
											<button class="btn btn-default">
												<em class="glyphicon glyphicon-ok" style="font-size: 12px;"></em>
											</button>
											<span class="btn btn-default">
												<em class="glyphicon glyphicon-remove cansalcreate" style="font-size: 12px;"></em>
											</span>
										</form>
									</#if>
								</div>
							</div>
							
							<!--  -->
							<input type="hidden" class = "pathmessage" value="${path.id}">
							
							<span class="file-check"> 
								<span class = "iconfont icon-xuanze" style="height:1.5em;width:1.5em"></span>
								
							</span>
							
						</div>
					</#list>
				</#if>
				
				<!-- ***********接着显示当前目录下的文件************ -->
				<#list files as file>
					<div class="file-one">
						<!-- 如果是压缩包 -->
						<#if file.fileShuffix == "zip" || file.fileShuffix =="rar" || file.fileShuffix =="7-Zip">
								<div class="file-img">
									<img src="images/fileimg/ZIP.png" />
								</div>
							<!-- 如果是视频 -->
							<#elseif file.fileShuffix == "mp4" || file.fileShuffix == "rmvb" || file.fileShuffix == "avi">
								<div class="file-img">
									<img src="images/fileimg/Video.png" />
								</div>
							<!-- 如果是pdf -->
							<#elseif file.fileShuffix == "pdf">
								<div class="file-img">
									<img src="images/fileimg/PDF.png" />
								</div>
							<!-- 音乐 -->
							<#elseif file.fileShuffix == "mp3" || file.fileShuffix =="aiff" >
								<div class="file-img">
									<img src="images/fileimg/Music.png" />
								</div>
							<!-- 图片具有预览功能 -->
							<#elseif file.fileShuffix == "jpeg" || file.fileShuffix == "png" || file.fileShuffix == "gif" || file.fileShuffix == "jpg" >
								<div class="file-img">
									<img src="imgshow?fileid=${file.fileId}" style="height:71px;width:56px;"/>
								</div>
							<!-- 如果是excel表格 -->
							<#elseif file.fileShuffix == "xlsx" || file.fileShuffix == "xls">
								<div class="file-img">
									<img src="images/fileimg/excel.png"/>
								</div>
							<!-- 如果是world 文档 -->
							<#elseif file.fileShuffix == "doc" || file.fileShuffix == "docx">
								<div class="file-img">
									<img src="images/fileimg/word.png"/>
								</div>
							
							<!-- 如果是ppt 文档 -->
							<#elseif file.fileShuffix == "ppt" || file.fileShuffix == "pptx">
								<div class="file-img">
									<img src="images/fileimg/ppt.jpg"/>
								</div>
							
							<#else>
							<!-- 其他文职格式的文件 -->
								<div class="file-img">
									<img src="images/fileimg/Text.png" />
								</div>
						</#if>
						<!-- 显示文件对应的名称 -->                              
						<div class="file-name">
							<div class="filename">
								<!-- 鼠标放置时显示全名 -->
								<!-- 显示文件名称 -->
								<a class="FILENAMEHOVER" >${file.fileName}</a>
								<input type="hidden" class="fileuserid" id="${(file.user.userId)!''}"/>
								<input type="hidden" class="nowuserid" id="${(userid)!''}"/>
							</div>
							
							
							<!-- 下面这里是点击重命名后显示的内容和按钮 -->
							<div class="pathtextarea rename diplaynone" style="position: absolute;top: 97px;left: -5px;z-index:100;">
								<#if isload??>
									<input class="creatpathinput" type="text" name="name" value="${file.fileName}"/>
									<input class="renamefp" type="hidden" name="renamefp" value="${file.fileId}"/>
									<input class="pathid" type="hidden" name="pathid" value=""/>
									<input class="isfile" type="hidden" name="isfile" value="true"/>
									<button class="btn btn-default okfilerename">
										
										<em class="glyphicon glyphicon-ok" style="font-size: 12px;"></em>
									</button>
									<span class="btn btn-default">
										<em class="glyphicon glyphicon-remove cansalcreate" style="font-size: 12px;"></em>
									</span>
								<#else>
								<form action="rename">
									<input class="creatpathinput" type="text" name="name" value="${file.fileName}"/>
									<input type="hidden" name="renamefp" value="${file.fileId}"/>
									<input type="hidden" name="pathid" value="${nowpath.id}"/>
									<input type="hidden" name="isfile" value="true"/>
									<button class="btn btn-default">
										<em class="glyphicon glyphicon-ok" style="font-size: 12px;"></em>
									</button>
									<span class="btn btn-default">
										<em class="glyphicon glyphicon-remove cansalcreate" style="font-size: 12px;"></em>
									</span>
								</form>
								</#if>
							</div>
							
							
							
						</div>
						
						<!-- 这里是文件左上角的选中按钮  -->
						<!-- hidden隐藏看不见 -->
						<input type="hidden" class = "filemessage" value="${file.fileId}">
						<span class="file-check">  
							<span class = "iconfont icon-xuanze" style="height:1.5em;width:1.5em"></span>
							<!--  
							<input class = "iconfont icon-xuanze"  type="checkbox" style="height:1.5em;width:1.5em" >
							-->
						</span>

					</div>
				</#list>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		//全部文件中的删除
		function fun1(){
			
			alert("哈哈哈哈哈");
			return false;
			
		}
	
		//显示文件全名函数
		function setshowname(filename){
			$("#showfilename").css('display','block');
			$("#showfilename").text('文件名称: '+filename)
		}
		
		$(function(){
			
			
			
			//使用ajax请求异步删除测试
			$(".topdelete").click(function(){

				//pathid=${nowpath.id}
				var pathId = ${nowpath.id};
				//注意new了之后就不会为空了哦
				var checkpathids = new Array();
				var checkfileids = new Array();
				//获取选中文件的文件号id赋值到两个集合中
				checkedpaths2(checkpathids,checkfileids);

				//首先把选中的文件从页面中删除   icon-xuanze
				//获取选中的div
				var checkedpaths =$(".file-one.file-one-check");
				
				if( checkedpaths.length == 0 ){
					
				}else{
					//是否删除
					if( confirm('文件将被放入回收站，确定删除吗？') ){
						//遍历从页面删除
						checkedpaths.each(function(){
							//把整个div删除掉就行了吧
							$(this).remove(); //删除掉吧	
						});

						//然后再使用zjax异步删除
						//发送ajax测试
						$.ajax({
							//  请求参数传过去
					        url:"deletefileajax?"+'pathid='+pathId + '&checkpathids='+ checkpathids + '&checkfileids='+checkfileids,
					        dataType:"text", //预期服务器返回的数据类型
					        type:"post", //请求方式
					        data:null, //发送到服务器的数据
					        success:function(data){
					        },
					        error:function(data){
					        }
					        
					    });
					}
				}
			});
			
			

			//鼠标放入显示文件名称
			$(".FILENAMEHOVER").hover(function(){
				
				//alert("你大爷哈");
				//alert($(this).text());
				var text1 = $(this).text();
				setshowname(text1);

			},function(){
				$("#showfilename").css('display','none');
			});
			
	
		});
	
	
	</script>
	
</div>


