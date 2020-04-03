
//定义啥
layui.use('form', function () {
    var form = layui.form
        ,layer = layui.layer;
});

function submitlogin() {
	//获取用户名和密码
    var username=$("#username").val();
    var password=$("#password").val();
    
    
    //校验正确性
    if (username.length===0) {
        layer.tips("请输入账号", '#username', {
            tips: [1, "#0FA6D8"],
            tipsMore: !1,
            time: 2000
        });
        $("#username").focus();
        return false;
    }
    if (password.length===0) {
        layer.tips("请输入密码",'#password',{
            tips: [1, "#0FA6D8"],
            tipsMore: !1,
            time: 2000
        });
        $("#password").focus();
        return false;
    }
    
    
    var object = new Object(); //创建一个存放数据的对象
    
    //键值对形式
    object["username"] = username;
    object["password"] = password;
    
    //转换为json数据
    var jsonData = JSON.stringify(object); //根据数据生成json数据
    
    //alert("这是什么东西："+basePath);
    
    //通过ajax来进行登录验证（路径可以使用相对路径来替换掉）
    $.ajax({
        url: /*basePath+*/"/justlogin",
        data: jsonData,
        contentType: "application/json;charset=UTF-8", //发送数据的格式
        type: "post",
        dataType: "json", //回调
        //在ajax执行前调用
        beforeSend: function () {
            layer.msg('登陆中', {
                icon: 16
                ,shade: 0.01
            });
        },
        //请求完成后调用
        complete: function () {
            layer.closeAll('loading');
        },
        //请求成功后调用
        success: function (data) {
        	//对返回信息校验（并提示相应的弹窗）
            if(data.status!=200){
                layer.msg(data.message, {
                    time: 1500,
                    icon: 2,
                    offset: '350px'
                });
            }else{
                layer.msg(data.message, {
                    time: 1000,
                    icon: 1,
                    offset: '350px'
                }, function () {
                    location.href=/*basePath+*/"/chat/ct";  //界面跳转
                });
            }
            
            
        }//success
    });
    
    
    
}