function addDate(date, days) {
	
	
	var d = new Date(date);
	var m =dateOne(d.getMonth()+ 1);
	var day=dateOne(d.getDate() + days);
	var hour=dateOne(d.getHours());
	var min=dateOne(d.getMinutes());
	var s=dateOne(d.getSeconds());
	return d.getFullYear() + '-' + m + '-' +day+' '+hour+':'+min+':'+s;
	
}

function dateOne(day){
	if(day<10){
		day='0'+day;
	}
	return day;
}

Date.prototype.Format = function(fmt) { //author: meizz 
	var o = {
		"M+": this.getMonth() + 1, //月份 
		"d+": this.getDate(), //日 
		"h+": this.getHours(), //小时 
		"m+": this.getMinutes(), //分 
		"s+": this.getSeconds(), //秒 
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
		"S": this.getMilliseconds() //毫秒 
	};
	if(/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for(var k in o)
		if(new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

	$(function(){
		
		var date=new Date(); //创建日期对象
		
		var nowDate=date.Format('yyyy-MM-dd hh:mm:ss');
		
		var startime=addDate(nowDate,0); //获取当前开始时间默认值
		
		var endtime=addDate(nowDate,1);  //获取当前结束时间默认值
		
		//判断如果为空 就赋默认值 不为空 从数据库那里读取得到值就不用赋默认值
		if($('#starTime').val()==""||$('#starTime').val()==null){
			$('#starTime').val(startime);
		}
		//同理
		if($('#endTime').val()==""||$('#endTime').val()==null){
			$('#endTime').val(endtime);
		}
			
		//当点击时间文本框
		$('#starTime').on('click',function(){
			//调用jquery函数弹出日期选择框
			//alert("怎么回事卧槽");
			
			WdatePicker({ minDate:addDate(nowDate,0),maxDate:addDate(nowDate,60),dateFmt:'yyyy-MM-dd HH:mm:ss'});
			
		});
		
		$('#starTime').on('blur',function(){ //失去焦点
			$('#endTime').val(addDate($('#starTime').val(),1));
		});
		
		//同理
		$('#endTime').on('click',function(){
			var start=$('#starTime').val();
			
			WdatePicker({ minDate:addDate(start,1),maxDate:addDate(start,60),dateFmt:'yyyy-MM-dd HH:mm:ss'});

		});
	
		$('.shijian').val(startime);
		
	
		$(".shijian").click(function(){
			var start=$('.shijian').val();
			WdatePicker({ minDate:addDate(-30,start),maxDate:addDate(start,0),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.shi').val(startime);
		
		
		$(".shi").click(function(){
			var start=$(this).val();
			WdatePicker({ minDate:addDate(-2,start),maxDate:addDate(start,60),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.food').on('click','.incar',function(){
			$(".incar").removeClass("clic");
			$(this).addClass("clic");
			var start=$(".clic").val();
			WdatePicker({ minDate:addDate(-30,start),maxDate:addDate(start,0),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		

		$('.chu').val(startime);
		
	
		$(".chu").click(function(){
			var start=$(this).val();
			WdatePicker({ minDate:addDate(start,0),maxDate:addDate(start,60),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.food').on('click','.car',function(){
			$(".car").removeClass("clic");
			$(this).addClass("clic");
			var start=$(".clic").val();
			WdatePicker({ minDate:addDate(start,0),maxDate:addDate(start,60),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.holistart').val(startime);
		
		$(".holistart").click(function(){
			var start=$(this).val();
			WdatePicker({ minDate:addDate(start,0),maxDate:addDate(start,180),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.holiend').val(startime);
		
		$(".holiend").click(function(){
			var start=$(this).val();
			WdatePicker({ minDate:addDate(start,0),maxDate:addDate(start,180),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.zhuanstart').val(startime);
		
		$(".zhuanstart").click(function(){
			var start=$(this).val();
			WdatePicker({ minDate:addDate(-90,0),maxDate:addDate(start,5),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
		$('.zhuanend').val(startime);
		
		$(".zhuanend").click(function(){
			var start=$(this).val();
			WdatePicker({ minDate:addDate(start,0),maxDate:addDate(start,5),dateFmt:'yyyy-MM-dd HH:mm:ss'});
		});
		
	});
	
	