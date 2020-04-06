package com.nnxy.ldq.controller.chat;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nnxy.ldq.model.entity.chat.Login;
import com.nnxy.ldq.services.chat.LoginService;
import com.nnxy.ldq.util.Md5Util;
import com.nnxy.ldq.util.exception.R;

import javax.servlet.http.HttpSession;

@Controller
public class LoginCtrl {
	
	
    @Autowired
    LoginService loginService;
    
    
    //如果是访问根路径就跳转到登陆界面
    @GetMapping("/")
    public String tologin(){
    	//System.out.println("哈哈哈哈哈");
        return "user/login";
    }
    
    
    /**
     * 登陆
     * */
    @PostMapping("/justlogin")
    @ResponseBody
    public R login(@RequestBody Login login, HttpSession session){
    	
    	System.out.println("来了，登录验证");
    	
        login.setPassword(Md5Util.StringInMd5(login.getPassword()));
        String userid = loginService.justLogin(login);
        if(userid==null){
            return R.error().message("账号或者密码错误");
        }
        session.setAttribute("userid",userid);
        return R.ok().message("登录成功");
    }
    
}
