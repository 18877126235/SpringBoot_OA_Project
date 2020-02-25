///**
// *  ajax

// */
// $(".box-body").on("click", ".path", function(){
//	 var pathid = $(this).siblings(".pathmessage").val();
//	 $.post("pathin",{pathid:pathid},function(data){
//		 $(".boxcontain").html("");
//		 if(data){
//			 if(data[1]){
//				 $(data[1]).each(function(){
//					 var newEl = $(".modal .file-one").clone();
//					 newEl.find(".file-name>a").text(this.pathName);
//					 newEl.find(".file-name").addClass("path");
//					 newEl.find(".file-img").addClass("path");
//					 newEl.find(".pathmessage").val(this.id);
//					 newEl.removeClass("diplaynone");
//					 newEl.appendTo(".boxcontain");
//				 });
//			 }
//			 if(data[2]){
//				 $(data[2]).each(function(){
//					 var newEl = $(".modal .file-one").clone();
//					 newEl.find(".file-name>a").text(this.fileName);
//					 newEl.find(".filemessage").val(this.fileId);
//					 if(this.fileShuffix == "zip"){
//						 newEl.find(".file-img img").attr("src","images/fileimg/ZIP.png");
//					 }else if(this.fileShuffix == "mp4" ||this.fileShuffix == "rmvb"){
//						 newEl.find(".file-img img").attr("src","images/fileimg/Video.png");
//					 }else if(this.fileShuffix == "mp3"){
//						 newEl.find(".file-img img").attr("src","images/fileimg/Music.png");
//					 }
//					 else if(this.fileShuffix == "text" || this.fileShuffix == "word"){
//						 newEl.find(".file-img img").attr("src","images/fileimg/Text.png");
//					 }else{
//						 newEl.find(".file-img img").attr("src","");
//					 } 
//					 newEl.removeClass("diplaynone");
//					 newEl.appendTo(".boxcontain");
//				 }); 
//			 }
//		 }
//	 });  
// });

/**
 * 复制移动选择目标文件文件夹并ajax加载选择文件夹下的文件夹(点击文件夹名称会显示该文件夹下的子文件夹)
 */
/*$("#thismodal .box-body").on("click",".openpath",function(){
	
	//alert("哈哈");
	
	//点击后设置背景颜色为灰色  是不是应该先删除其他区的所有的css属性
	$(".filepathname").find(".openpath").each(function(){
		$(this).css("background-color","#ffffff");
		//$('#test').css('display', null);
	});
	$(this).css("background-color","#E0E0E0");
	//还要把其他文件夹下的展开的目录给缩起来
	
	//以下是原文
	var mctoid = $(this).find(".mctopathid").val(); //这里是获取当前文件夹的在数据库中id
	
	//获取提交表单的这个对象来干嘛的
	var mcpathids = $("#thismodal .box-footer .mcpathids").val();
	
	//此时表单提交数据中的文件夹id就变成了点击的那个文件夹（默认是根路径）
	$(".box-footer .mctoid").val(mctoid);
	
	//如果此时文件夹已经有了这个属性类（一至都有哈）
	if($(this).hasClass("modalajax")){   //可不可以做判断，如果第一次点击就展示目录，再次点击就收起目录（如果有类型，说明已经打开？？）
		
		//alert("卧槽，怎么执行了");
		//这里是获取夫元素同级别的下一个元素（ul标签）
		var $ul = $(this).parents(".box-header").next();
		
		//设置为减号删除加号
		$(this).parents(".box-header").find(".jiajian").addClass("glyphicon-minus").removeClass("glyphicon-plus");
		
		$ul.css("display","block");
		
		$ul.load("mcloadpath",{mctoid:mctoid,mcpathids:mcpathids}); //这是什么造型呀
		
	}else{ //否则什么也不干
		
		alert("没有呢");
		
	}
	
	
});*/

/*
 * 改进上述方法
 */
$("#thismodal .box-body").on("click",".openpath",function(){
	//alert("哈哈");
	
	//先把根目录的背景颜色去掉rootname
	$(".rootname").css("background-color","#ffffff");
	
	//点击后设置背景颜色为灰色  是不是应该先删除其他区的所有的css属性
	$(".filepathname").find(".openpath").each(function(){

		$(this).css("background-color","#ffffff");
		//$(this).css("display")="none
		//$('#test').css('display', null);
	});
	$(this).css("background-color","#E0E0E0");
	
	
	//还要把其他文件夹下的展开的目录给缩起来
	//如果此时文件夹已经有了这个属性类（一至都有哈）
	if($(this).hasClass("modalajax")){   //可不可以做判断，如果第一次点击就展示目录，再次点击就收起目录（如果有类型，说明已经打开？？）
		//alert("卧槽，怎么执行了");
		//已经打开过了，那就关闭
		$(this).removeClass("modalajax"); //标记关闭
		//设置减号编程加号
		$(this).parents(".box-header").find(".jiajian").addClass("glyphicon-plus").removeClass("glyphicon-minus");
		var $ul = $(this).parents(".box-header").next();
		$ul.css("display","none"); //隐藏
	}else{ //说明没打开
		//alert("没有呢");
		$(this).addClass("modalajax"); //标记已经打开
		//以下是原文
		var mctoid = $(this).find(".mctopathid").val(); //这里是获取当前文件夹的在数据库中id
		//获取提交表单的这个对象来干嘛的
		var mcpathids = $("#thismodal .box-footer .mcpathids").val();
		//此时表单提交数据中的文件夹id就变成了点击的那个文件夹（默认是根路径）
		$(".box-footer .mctoid").val(mctoid);
		//这里是获取夫元素同级别的下一个元素（ul标签）
		var $ul = $(this).parents(".box-header").next();
		//设置为减号删除加号
		$(this).parents(".box-header").find(".jiajian").addClass("glyphicon-minus").removeClass("glyphicon-plus");
		//显示文件夹下的文件
		$ul.css("display","block");
		//发送请求显示数据
		$ul.load("mcloadpath",{mctoid:mctoid,mcpathids:mcpathids}); //这是什么造型呀
	}
});




$(".filetypedocument").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"document"});
});
$(".filetypeimage").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"picture"});
});
$(".filetypemusic").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"music"});
});
$(".filetypevedio").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"video"});
});
$(".filetypeyasuo").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"yasuo"});
});
$(".filetypetrash").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"trash"});
});
$(".filetypeshare").click(function(){
	$(".loadfiletype").load("filetypeload",{type:"share"});
});

/**
 * 搜索js
 */
$(".loadfiletype").on("click",".findfileandpathgo",function(){
	var findfileandpath = $(".loadfiletype .box-header .findfileandpath").val();
	var loadtype = $(".loadfiletype .box-header .loadfilestype").val(); 
	//var loadtype = 'picture';
	//alert(findfileandpath+loadtype);
	//ajax访问findfileandpath，参数是type 和 输入框的内容
	$(".loadfiletype").load("findfileandpath",{type:loadtype,findfileandpath:findfileandpath});
});

/**
 * 删除load js （这里是真正的删除掉了，连同数据库和服务器中删除）
 */
$(".loadfiletype").on("click",".loaddelete",function(){
	
		
		var checkpathids = new Array();
		var checkfileids = new Array();
		//获取选中的文件夹和文件
		checkedpaths2(checkpathids,checkfileids);
		var loadtype = $(".loadfiletype .box-header .loadfilestype").val();
		
		//alert("这个对象有点复杂了："+loadtype);
		
		if( checkpathids.length == 0 && checkfileids.length == 0 ){
			
		}else{
			if( confirm('文件将彻底删除无法复原，确定删除吗？') ){
				$(".loadfiletype").load("fileloaddeletefile",{type:loadtype,'checkpathids[]':checkpathids,'checkfileids[]':checkfileids});
			}
		}
		
		
	
});
$(".loadfiletype").on("click",".loadokshare",function(){
	var checkpathids = new Array();
	var checkfileids = new Array();
	checkedpaths2(checkpathids,checkfileids);
	var loadtype = $(".loadfiletype .box-header .loadfilestype").val();
	
	$(".loadfiletype").load("fileloadshare",{type:loadtype,'checkfileids[]':checkfileids});
	
});

/**
 * 回收战load js(点击删除把文件放入回收站)
 */
$(".loadfiletype").on("click",".loadtrash",function(){
	//alert("哈哈哈哈哈放入回收站");
	//注意new了之后就不会为空了哦
	var checkpathids = new Array();
	var checkfileids = new Array();
	//获取选中的文件和文件夹
	checkedpaths2(checkpathids,checkfileids);
	//如果什么都没选那就啥也不做
	if(checkfileids.length == 0 && checkpathids.length == 0){	
	}else{ //否则执行放入回收站，从页面删除
		if(confirm('文件将放入回收站，确定删除吗？')){
			//因为是从左侧边栏的菜单点击过来的嘛，所以这里获取点击删除的文件类型（也就是从那个菜单来的）
			var loadtype = $(".loadfiletype .box-header .loadfilestype").val();
			//alert("这是什么东西："+loadtype);
			$(".loadfiletype").load("fileloadtrashfile",{type:loadtype,'checkpathids[]':checkpathids,'checkfileids[]':checkfileids});
		}
	}
});



/*
 * 这里干嘛的 不知道
 */
$(".loadfiletype").on("click",".filereturnback",function(){
	
	var checkpathids = new Array();
	var checkfileids = new Array();
	checkedpaths2(checkpathids,checkfileids);
	console.log("filereturnback");
	var loadtype = $(".loadfiletype .box-header .loadfilestype").val();
	
	$(".loadfiletype").load("filereturnback",{type:loadtype,'checkpathids[]':checkpathids,'checkfileids[]':checkfileids});
	
	
});


/**
 * 重命名load js
 */
$(".loadfiletype").on("click",".okfilerename",function(){
	var checkedfile = $(this).parents(".file-one.file-one-check");
	var loadtype = $(".loadfiletype .box-header .loadfilestype").val();
	
	var renamefp = checkedfile.find(".renamefp").val();
	var creatpathinput = checkedfile.find(".creatpathinput").val();
	var isfile = checkedfile.find(".isfile").val();
	var pathid = checkedfile.find(".pathid").val();
	
	console.log(renamefp);
	console.log(creatpathinput);
	console.log(isfile);
	console.log(pathid);
	
	$(".loadfiletype").load("fileloadrename",{type:loadtype,renamefp:renamefp,creatpathinput:creatpathinput,isfile:isfile,pathid:pathid})
});


/**
 * 得到选择的 文件和文件夹
 * @param pathids
 * @param fileids
 * @returns
 */
function checkedpaths2(pathids,fileids){
	var checkedpaths =$(".file-one.file-one-check");
	var i = 0;
	var j = 0;
	checkedpaths.each(function(){
		if($(this).find(".file-img").hasClass("path")){
			pathids[i] = $(this).find(".pathmessage").val();
			i += 1;
		}else{
			if(!$(this).hasClass("diplaynone")){
				fileids[j] = $(this).find(".filemessage").val();
				console.log($(this).find(".filemessage").val());
				j += 1;
			}
		}
	});
}