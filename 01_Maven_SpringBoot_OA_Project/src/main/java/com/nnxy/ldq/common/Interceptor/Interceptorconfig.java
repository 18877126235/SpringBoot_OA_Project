package com.nnxy.ldq.common.Interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

//配置拦截器
@Configuration
public class Interceptorconfig extends WebMvcConfigurerAdapter{
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	//配置拦截所有登录地址，除了login和captcha
    	 registry.addInterceptor(new RecordInterceptor()).
    	 addPathPatterns("/**").//默认拦截所有
    	 excludePathPatterns("/login"). //不包含登陆界面
    	 excludePathPatterns("/registration"). //注册界面
    	 excludePathPatterns("/captcha"). //验证码生成显示
    	 excludePathPatterns("/logins"). //执行登陆查询（查看是否已经登陆）
    	 excludePathPatterns("/zhixingzhucedaima"). //执行注册逻辑
    	 excludePathPatterns("/findUserName")//查询用户名是否相同
; 
    	 //registry.addInterceptor(new recordInterceptor()).addPathPatterns("/**").excludePathPatterns("/logins").excludePathPatterns("/index").excludePathPatterns("/test2");
    
    }
}