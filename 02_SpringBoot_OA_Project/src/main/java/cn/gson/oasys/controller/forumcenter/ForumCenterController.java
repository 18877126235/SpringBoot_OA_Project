package cn.gson.oasys.controller.forumcenter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ForumCenterController {

	/*
	 * 论坛首页
	 */
	@RequestMapping("ForumCenter")
	public String corumcenterindex() {
		
		
		System.out.println("进来了没******************");
		
		return "forumcenter/ForumCenter"; //返回显示论坛首页视图
	}
	
}
