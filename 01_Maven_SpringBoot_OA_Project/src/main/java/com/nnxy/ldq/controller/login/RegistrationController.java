package com.nnxy.ldq.controller.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nnxy.ldq.model.entity.user.User;

@Controller
@RequestMapping("/")
public class RegistrationController {

	
	/*
	 * 使用ajax执行注册逻辑
	 */
	
	@RequestMapping(value = "zhixingzhucedaima")
	public @ResponseBody String zhixingzhuce(String username) {
		
		
		//System.out.println("看看能否获取用户名："+username);
		
		return "success"; //返回显示错误信息
	}
	
	

}
