package com.nnxy.ldq.controller.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nnxy.ldq.model.dao.discuss.CommentDao;
import com.nnxy.ldq.model.dao.discuss.DiscussDao;
import com.nnxy.ldq.model.dao.discuss.ReplyDao;
import com.nnxy.ldq.model.dao.discuss.VoteTitleListDao;
import com.nnxy.ldq.model.dao.discuss.VoteTitlesUserDao;
import com.nnxy.ldq.model.dao.system.TypeDao;
import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.chat.ChatFriends;
import com.nnxy.ldq.model.entity.chat.Userinfo;
import com.nnxy.ldq.model.entity.user.Dept;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.services.chat.ChatFriendsService;
import com.nnxy.ldq.services.chat.UserinfoService;
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
	@Autowired
	UserinfoService userinfoService;
	@Autowired
	ChatFriendsService chatFriendsService; 
	/*
	 * 显示初始页面
	 */
	@RequestMapping("testController01")
	public String testController01(Model model,HttpServletRequest request) {

		
		//获取所有的部门信息
		Iterable<Dept> findAll = depDao.findAll();
		Dept findOne = depDao.findOne(1l);
		//获取总经办的所有用户
		List<User> findByDept = uDao.findByDept(findOne);
		
		//部门列表
		model.addAttribute("deplist", findAll);
		//总经办的成员
		model.addAttribute("catalogs", findByDept);
		
		
		//把用户信息插入到用户信息表中
		String userid = ""+request.getSession().getAttribute("userId");
		User user = uDao.findOne(Long.parseLong(userid));
		//先获取集合测试看看
		List<Userinfo> selectAllUserinfo = userinfoService.selectAllUserinfo();
		/*for (Userinfo userinfo : selectAllUserinfo) {
			System.out.println("我特么直接黑化："+userinfo);
		}*/
		//去数据库查找一下看看有没有，如果没有就插入
		Userinfo findbyid = userinfoService.findbyid(userid);
		System.out.println(findbyid);
		if( findbyid == null ) {
			
			Userinfo userinfo = new Userinfo();
			userinfo.setNickname(user.getUserName()); //名称
			userinfo.setUserid(userid); //id
			userinfo.setUimg("/"+user.getImgPath()); //头像
			userinfo.setUsign(user.getUserSign()); //签名
			userinfoService.insertuserinfo(userinfo); //插入数据库
			System.out.println("插入数据库了哈哈哈哈");
			
		}
		
		//用户头像路径放置域对象
		request.getSession().setAttribute("mainuserimg", user.getImgPath());
		
		return "chats/chatindexmanage";
		
	}
	
	/*
	 * iframe显示右侧聊天界面
	 */
	@RequestMapping("testController02")
	public String testController02(HttpServletRequest request) {
		
		
		
		
		//System.out.println("完蛋咯来了");
		
		return "/chats/chats";
		//return "/chats/login2";
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
		
		return "chats/chatuser";
	}
	
	/*
	 * ajax加载聊天界面(待定)
	 */
	@Transactional //开启事务
	@RequestMapping("testController04")
	public String testController04(String duixiangid,Model model,HttpServletRequest request) {
		
		
		String userid = ""+request.getSession().getAttribute("userId");
		
		//先插入userinfo用户聊天信息表表中先
		//先判断有没有先
		//去数据库查找一下看看有没有，如果没有就插入
		Userinfo findbyid = userinfoService.findbyid(duixiangid);
		Userinfo userinfo = new Userinfo();
		if(findbyid == null) {
			User user = uDao.findOne(Long.parseLong(duixiangid));
			
			findbyid.setNickname(user.getUserName()); //名称
			findbyid.setUserid(duixiangid); //id
			//如果头像为空就设置默认值
			if(user.getImgPath() == null) {
				findbyid.setUimg("/"+"simpletest.jpeg"); //头像
			}else {
				findbyid.setUimg("/"+user.getImgPath()); //头像
			}
			
			findbyid.setUsign(user.getUserSign()); //签名
			userinfoService.insertuserinfo(findbyid); //插入数据库
		}
		
		//System.out.println("获取到了你要聊天的对象id"+duixiangid);
		//查看聊天列表中有没有和当前用户处于聊天列表
		ChatFriends chatf = new ChatFriends();
		chatf.setUserid(userid); //当前用户id
		chatf.setFuserid(duixiangid); //对方id
		
		ChatFriends frenduser = chatFriendsService.selectbyuseridandfuserid(chatf);
		
		if(frenduser == null) {
			System.out.println("两人还没建立聊天关系");
			
			//向数据库中插入两条表示两人建立聊天关系数据
			chatFriendsService.InsertUserFriend(chatf);
			//换一下参照对象
			chatf.setUserid( duixiangid); //当前用户id
			chatf.setFuserid(userid); //对方id
			chatFriendsService.InsertUserFriend(chatf);
			
		}else {
			System.out.println("已经简历聊天关系");
			
		}
		//放置域对象用来显示聊天界面
		request.getSession().setAttribute("fuserId", duixiangid);
		request.getSession().setAttribute("fuserName", findbyid.getNickname()); //空指针异常？？？
		//System.out.println("这东西难道为空吗："+userinfo.getNickname());
		
		return "chats/chatmsg";
	}
	
	/*
	 * 使用ajax方式来清除session缓存
	 */
	@RequestMapping("testController05")
	public void testController05(HttpServletRequest request) {
		
		//System.out.println("清除数据对吧哈哈哈哈哈哈哈"); 
		request.getSession().removeAttribute("fuserId");
		
		request.getSession().removeAttribute("fuserName");
	
	}
	
}
