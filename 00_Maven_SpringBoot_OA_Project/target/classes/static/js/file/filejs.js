/**
 * 文件展示 js
 */ 
$(".loadfiletype").on("mouseover mouseout",".file-one",function(event){
	 if (event.type == "mouseover") {
		// 鼠标悬浮
		$(this).addClass("file-one-houver");
	} else if (event.type == "mouseout") {
		// 鼠标离开
		$(this).removeClass("file-one-houver");
	}
});


/**
 * 选择文件 js
 * .file-box .file-check"
 */
$(".loadfiletype").on("click",".file-check",function(){
	
	//alert("哈哈哈哈哈选中了呢");
	if($(this).parent(".file-one").hasClass("file-one-check")){
		//alert("有了");
		$(this).parent(".file-one").removeClass("file-one-check");
	}else{
		//alert("没有");
		$(this).parent(".file-one").addClass("file-one-check");
	}
	changedeletehref();
	changesharehref();
});

//点击选中文件 自创版本
/*$(".loadfiletype").on("click",".file-one",function(){
	
	//寻找下面的file-check
	if($(this).hasClass("file-one-check")){
		
		$(this).removeClass("file-one-check");
		
	}else{
		
		$(this).addClass("file-one-check");
		
	}
	
	//$(this).children(".file-check").click();
	
	changedeletehref();
	changesharehref();
	
});*/

//鼠标放入显示文件名称  
$(".loadfiletype").on("mouseover mouseout",".FILENAMEHOVER",function(event){
	
	//alert("你大爷哈鼠标放入");
	//alert($(this).text());
	var text1 = $(this).text();
	if(event.type == "mouseover"){
		$("#showfilename").css('display','block');
		$("#showfilename").text('文件名称: '+text1)
		  //鼠标悬浮
	}else if(event.type == "mouseout"){
		  //鼠标离开
		$("#showfilename").css('display','none');
	}
	
});





/**
 * 全选文件JS
 */
$(".loadfiletype").on("click",".allcheck",function(){
	var fileone = $(".file-one");
	if($(this).hasClass("allchecked")){
		$(".file-one").each(function(){
			$(".file-one").removeClass("file-one-check");
		});
		$(this).removeClass("allchecked");
	}else{
		$(".file-one").each(function(){
			$(".file-one").addClass("file-one-check");
		});
		$(this).addClass("allchecked");
	}
	changedeletehref();
	changesharehref();
});

/*
 * 全部取消选中
 */
$(".loadfiletype").on("click",".allnocheck",function(){

	$(".file-one").each(function(){
		$(".file-one").removeClass("file-one-check");
	});
	$(".allcheck").removeClass("allchecked");
});

/**
 * 右键菜单JS
 * $(".file-box .file-one").mousedown(function(e){
 * 
 */
$(".loadfiletype").on("mousedown",".file-one",function(e){
	if(3 == e.which){
		console.log("111");
	    $(document).bind("contextmenu",function(e){
	        return false;
	    });
	    if(!$(this).hasClass("file-one-check")){
	    	$(this).addClass("file-one-check");
	    	$(this).siblings(".file-one").removeClass("file-one-check");
	    	changedeletehref();
	    	changesharehref();
	    }
	    if($(this).find(".file-img").hasClass("path")){
	    	var href = $(this).find(".path a").attr("href");
	    	$(".menu .open").attr("href",href);
	    	$(".menu .open").removeClass("disabled");
	    	$(".menu .rename").removeClass("disabled");
	    	$(".menu .downloadfile").addClass("disabled");
	    	$(".menu .doshare").addClass("disabled");
	    }else{
	    	$(".menu .open").addClass("disabled");
	    	$(".menu .rename").removeClass("disabled");
	    	$(".menu .doshare").removeClass("disabled");
	    	
	    	/**
	    	 *  给下载a链接添加 href 地址目标
	    	 */
	    	$(".menu .downloadfile").removeClass("disabled");
	    	var fileid = $(this).find(".filemessage").val();
	    	console.log(fileid);
	    	$(".menu .downloadfile").attr("href","downfile?fileid="+fileid);
	    }
	    
	    
	    /**
	     * 选择超过一个禁用右键菜单中的部分a链接
	     */
	    if($(".file-one-check").length>1){
	    	$(".menu .open").addClass("disabled");
	    	$(".menu .downloadfile").addClass("disabled");
	    	$(".menu .rename").addClass("disabled");
	    }
		var oX = e.pageX;
		var oY = e.pageY;

		$(".menu").css("display","block");
		$(".menu").css("left",oX+"px");
		$(".menu").css("top",oY+"px");
		
	}
});
$(document).click(function(e){
	$(".menu").css("display","none");
});

/**
 * 重命名
 * $(".menu .rename").click(function(){
 * $(".loadfiletype").on("click",".menurename",function(){
 */
$(".loadfiletype").on("click",".menurename",function(){
	console.log("重命名！~~");
	var checked =$(".loadfiletype .file-one.file-one-check");
	checked.find(".filename").addClass("diplaynone");
	checked.find(".rename").removeClass("diplaynone");
});
$(".loadfiletype").on("click",".cansalcreate",function(){
	console.log("2312");
	var checked =$(".loadfiletype .file-one.file-one-check");
	checked.find(".rename").addClass("diplaynone");
	checked.find(".filename").removeClass("diplaynone");
});

/**
 * 文件移动、复制文件使用模态框 JS
 */
/**
 * 这里是移动
 */
$(".menu .movefile").click(function(){
	
	//alert("移动？？");
	
	console.log("进入移动模态框点击！~~");
	$("#thismodal").modal("toggle");
	$('#thismodal .modal-body').css('display', 'block');
	$("#thismodal .mc-title").html("移动到");
	$("#thismodal .morc").val(true);
	
	//获取选中的文件和文件夹
	var checkfileids = new Array();
	var checkpathids = new Array();
	checkedpaths(checkpathids,checkfileids);
	$("#thismodal .mcfileids").val(checkfileids);
	$("#thismodal .mcpathids").val(checkpathids);
	
	$("#thismodal .pathidcompare").each(function(){
		console.log($(this).attr("pathId"));
		for(var i=0;i<checkpathids.length;i++){
			if($(this).attr("pathId") == checkpathids[i]){
				console.log("is com!~~~");
				$(this).addClass("diplaynone");
				return;
			}
		}
	});
});
/**
 * 这里是复制
 */
$(".menu .copyfile").click(function(){
	console.log("进入复制模态框点击！~~");
	$("#thismodal").modal("toggle");
	$('#thismodal .modal-body').css('display', 'block');
	$("#thismodal .mc-title").html("复制到");
	$("#thismodal .morc").val(false);
	
	var checkfileids = new Array();
	var checkpathids = new Array();
	checkedpaths(checkpathids,checkfileids);
	$("#thismodal .mcfileids").val(checkfileids);
	$("#thismodal .mcpathids").val(checkpathids);
	
	$("#thismodal .pathidcompare").each(function(){
		console.log($(this).attr("pathId"));
		for(var i=0;i<checkpathids.length;i++){
			if($(this).attr("pathId") == checkpathids[i]){
				console.log("is com!~~~");
				$(this).addClass("diplaynone");
				return;
			}
		}
	});
});
/**
 * 这里是取消移动按钮
 */
$("#thismodal .box-footer").on("click",".mcmodalcancle",function(){
	console.log("dianle quxiao");
	$("#thismodal .pathidcompare").removeClass("diplaynone");
	$("#thismodal .box-footer .mctoid").val($("#thismodal .box-footer .userrootpath").val());
});

/**
 * 创建文件夹
 */
$(".topcreatepath").on("click",function(){
	$(".creatpath").removeClass("diplaynone");
});
$(".creatpath ").on("click",".cansalcreate",function(){
	$(".creatpath").addClass("diplaynone");
});


/**
 * 得到已选择得文件夹 和文件
 * @param pathids
 * @param fileids
 * @returns
 */
function checkedpaths(pathids,fileids){
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

/**
 * 改变  删除a标签的  href值（在点击选中之后来到这里）
 * @returnss(checkpathids,checkfileids);
	
 */
function changedeletehref(){
	
	//alert("来了老弟改变了哈哈哈");
	
	var checkpathids = new Array();
	var checkfileids = new Array();
	//获取当前页面中选中的文件和文件夹
	//这里怎么会改变的
	checkedpaths(checkpathids,checkfileids);
	
	console.log("checkpathids:"+checkpathids);
	console.log("checkfileids:"+checkfileids);
	
	var href = $(".box-body .topdelete").attr("href");
	
	//alert("这个是什么呀："+href);
	
	if(href!=undefined){
		
		//
		alert("这个有定义");
		
		href = href.split("&");
		console.log(href);
		newhref = href[0]+"&checkpathids="+checkpathids+"&checkfileids="+checkfileids;
		console.log(newhref);
		$(".box-body .topdelete").attr("href",newhref);
		$(".menu .delete").attr("href",newhref);
		
	}

}
/**
 * 改变分享得地址
 * @returns
 */
function changesharehref(){
	var checkpathids = new Array();
	var checkfileids = new Array();
	checkedpaths(checkpathids,checkfileids);
	console.log("checkfileids:"+checkfileids);
	
	var href = $(".menu .doshare").attr("href");
	var newhref;
	if(href!=undefined){
		//var href = "doshare?checkfileids="+checkfileids;
		href = href.split("&");
		newhref = href[0] + "&checkfileids="+checkfileids;
		$(".menu .doshare").attr("href",newhref);
	}
}
