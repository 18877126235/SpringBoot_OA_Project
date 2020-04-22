package com.nnxy.ldq.controller.login;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Random;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.user.LoginRecord;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.services.user.UserLongRecordService;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.UserAgent;
import eu.bitwalker.useragentutils.Version;



@Controller
@RequestMapping("/")
public class LoginsController {
	
	@Autowired
	private UserDao uDao;
	@Autowired
	UserLongRecordService ulService;
	
	public static final String CAPTCHA_KEY = "session_captcha";

	public Set<HttpSession> sessionList =  new HashSet<HttpSession>();  //用于记录在线用户
	
	private Random rnd = new Random();
	
	/**
	 * 登录界面的显示
	 * @return
	 */
	@RequestMapping(value="login",method=RequestMethod.GET)
	public String login(){

		return "login/login";
	}
	
	/*
	 * 注册页面的显示  
	 */
	@RequestMapping(value="registration",method=RequestMethod.GET)
	public String registration(){

		return "login/Registration";
	}
	

	
	/*
	 * 退出登录
	 */
	@RequestMapping("loginout") //退出登录
	public String loginout(HttpSession session){
		
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		
		
		//搞这个是否登录标记差点害了自己
		//User user = uDao.findOne(userId);
		//user.setIsLogin(0); //设置为离线状态
		
		//uDao.save(user); //保存
		session.removeAttribute("userId");
		
		return "redirect:/login";
	}
	
	/**
	 * 登录检查；
	 * 1、根据(用户名或电话号码)+密码进行查找
	 * 2、判断使用是否被冻结；
	 * @return
	 * @throws UnknownHostException 
	 */
	@RequestMapping(value="logins",method = RequestMethod.POST)
	public String loginCheck(HttpSession session,HttpServletRequest req,Model model) throws UnknownHostException{
		
		String userName=req.getParameter("userName").trim(); //trim()表示去掉输入框前面和后面的空格
		String password=req.getParameter("password");
		String ca=req.getParameter("code").toLowerCase(); //验证码
		
		model.addAttribute("userName", userName); //代表登录
		
		//System.out.println("来了老弟******************************************************");
		
		
		
		/*
		 * //判断验证码是否正确
		 */
		//String sesionCode = (String) req.getSession().getAttribute(CAPTCHA_KEY); //获取系统生成的验证码
		/*if(!ca.equals(sesionCode.toLowerCase())){
			System.out.println("验证码输入错误!");
			model.addAttribute("errormess", "验证码输入错误!");
			req.setAttribute("errormess","验证码输入错误!");
			return "login/login"; //返回登陆界面
		}*/
		/*
		 * 将用户名分开查找；用户名或者电话号码；
		 * */
		//接下来验证用户是否存在
		User user=uDao.findOneUser(userName, password); //根据用户名和密码寻找用户
		
		if(Objects.isNull(user)){ //判断对象是否为空（为空就代表没有）
			System.out.println(user);
			System.out.println("账号或密码错误!");
			model.addAttribute("errormess", "账号或密码错误!");
			return "login/login";
		}
		//验证用户是否被禁用
		System.out.println("是否被锁："+user.getIsLock()); //判断是否
		if(user.getIsLock()==1){
			System.out.println("账号已被冻结!");
			model.addAttribute("errormess", "账号已被冻结!");
			return "login/login";
		}
		Object sessionId=session.getAttribute("userId"); //
		System.out.println(user);
		if(sessionId==user.getUserId()){
			System.out.println("当前用户已经登录了；不能重复登录");
			model.addAttribute("hasmess", "当前用户已经登录了；不能重复登录");
			session.setAttribute("thisuser", user);
			return "login/login";
		}else{  //没有登录呢，重新登录
			session.setAttribute("userId", user.getUserId()); //放置域对象
			
			/*
			 * 将session放入context对象中
			 */
			sessionList.add(session); //登录，放置session到session集合中
			//System.out.println("大小："+sessionList.size());
			ServletContext servletContext = session.getServletContext();//获取全局域对象
			servletContext.setAttribute("sessionList", sessionList); //把集合放置到全局域对象
			//再把全局域对象放置到管理员的session中
//			Long userId = Long.parseLong(session.getAttribute("userId") + "");
//			User userSup = uDao.findOne(userId);
//			if(userSup.getSuperman() == true) { //如果是超级管理员
//				//再把全局域对象放置到禅机管理员的session中去
//				session.setAttribute("SessionListContext", servletContext);
//			}		
			
			
			Browser browser = UserAgent.parseUserAgentString(req.getHeader("User-Agent")).getBrowser();
			Version version = browser.getVersion(req.getHeader("User-Agent"));
			String info = browser.getName() + "/" + version.getVersion();
			String ip=InetAddress.getLocalHost().getHostAddress();
			/*新增登录记录*/
			ulService.save(new LoginRecord(ip, new Date(), info, user));
		}

		/*
		 * 在此启动定时器查询在线用户
		 */
		
		return "redirect:/index";
	}
	
	

	
	/*
	 * 判断用户名是否存在
	 */
	@RequestMapping(value = "findUserName")
	public  @ResponseBody String findUserName(String username) {
		
		//System.out.println("看看能否获取用户名："+username);
		System.out.println("哈哈哈来了老弟哈哈哈****************************************");
		User user = uDao.findByUserName(username);
		//System.out.println(user);
		
		if(user == null) { //如果没有这个用户名
			return "success"; //返回成功
		}

		return "error"; //返回显示错误信息
	}
	
	
	
	@RequestMapping("handlehas")
	public String handleHas(HttpSession session){
		
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user1 = uDao.findOne(userId);
		user1.setIsLogin(0); //设置为离线状态
		uDao.save(user1); //保存
		
		if(!StringUtils.isEmpty(session.getAttribute("thisuser"))){
			User user=(User) session.getAttribute("thisuser");
			System.out.println(user);
			session.removeAttribute("userId");
			session.setAttribute("userId", user.getUserId());
		}else{
			System.out.println("有问题！");
			return "login/login";
		}
		
		
		
		return "redirect:/index";
		
	}
	
	/*
	 * 生成验证码
	 */
	@RequestMapping("captcha")
	public void captcha(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException{
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		// 生成随机字串
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		
		// 生成图片
		int w = 135, h = 40;
		VerifyCodeUtils.outputImage(w, h, response.getOutputStream(), verifyCode);

		// 将验证码存储在session以便登录时校验
		session.setAttribute(CAPTCHA_KEY, verifyCode.toLowerCase());
	}
	

}
