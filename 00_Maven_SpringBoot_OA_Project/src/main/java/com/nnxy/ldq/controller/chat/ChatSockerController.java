package com.nnxy.ldq.controller.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nnxy.ldq.model.dao.discuss.CommentDao;
import com.nnxy.ldq.model.dao.discuss.DiscussDao;
import com.nnxy.ldq.model.dao.discuss.ReplyDao;
import com.nnxy.ldq.model.dao.discuss.VoteTitleListDao;
import com.nnxy.ldq.model.dao.discuss.VoteTitlesUserDao;
import com.nnxy.ldq.model.dao.system.TypeDao;
import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.user.Dept;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.services.discuss.DiscussService;
import com.nnxy.ldq.services.discuss.ReplyService;
import com.nnxy.ldq.services.discuss.VoteService;

@Controller
@RequestMapping("/")
public class ChatSockerController {

	@Autowired
	DiscussDao discussDao;
	@Autowired
	DiscussService disService;
	@Autowired
	UserDao uDao;
	@Autowired
	TypeDao typeDao;
	@Autowired
	ReplyDao replyDao;
	@Autowired
	ReplyService replyService;
	@Autowired
	CommentDao commentDao;
	@Autowired
	VoteService voteService;
	@Autowired
	VoteTitleListDao voteTitlesDao;
	@Autowired
	VoteTitlesUserDao voteUserDao;
	@Autowired
	DeptDao depDao;
	/*
	 * 显示初始页面
	 */
	@RequestMapping("testController01")
	public String testController01(Model model) {
		
		
		//System.out.println("难点来了");
		//获取所有的部门信息
		Iterable<Dept> findAll = depDao.findAll();

//		for (Dept dept : findAll) {
//			System.out.println("获取所有的部门信息："+dept.getDeptName());
//		}
		
		
		Dept findOne = depDao.findOne(1l);
		//获取总经办的所有用户
		List<User> findByDept = uDao.findByDept(findOne);
		
		for (User user : findByDept) {
			System.out.println(user.getUserName());
		}
		
		//部门列表
		model.addAttribute("deplist", findAll);
		
		//总经办的成员
		model.addAttribute("catalogs", findByDept);
		
		return "chat/chatindexmanage";
	}
	
	/*
	 * iframe显示右侧聊天界面
	 */
	@RequestMapping("testController02")
	public String testController02() {
		
		
		System.out.println("完蛋咯来了");
		
		return "user/login2";
	}
	
	/*
	 * ajax加载部门成员列表
	 */
	@RequestMapping("testController03")
	public String testController03(String depid,Model model) {
		
		//System.out.println(depid);
		Dept findOne = depDao.findOne(Long.parseLong(depid));
		
		List<User> findByDept = uDao.findByDept(findOne);
		
		model.addAttribute("catalogs", findByDept);
		
		return "chat/chatuser";
	}
	
}
