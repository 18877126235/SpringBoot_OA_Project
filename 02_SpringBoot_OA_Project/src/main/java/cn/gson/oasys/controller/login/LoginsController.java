package cn.gson.oasys.controller.login;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.Objects;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.entity.user.LoginRecord;
import cn.gson.oasys.model.entity.user.User;
import cn.gson.oasys.services.user.UserLongRecordService;
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
	 * 退出登录
	 */
	@RequestMapping("loginout") //退出登录
	public String loginout(HttpSession session){
		
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user = uDao.findOne(userId);
		user.setIsLogin(0); //设置为离线状态
		
		uDao.save(user); //保存
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
		//判断验证码是否正确
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
		}else{
			session.setAttribute("userId", user.getUserId()); //放置域对象
			
			
			
			Browser browser = UserAgent.parseUserAgentString(req.getHeader("User-Agent")).getBrowser();
			Version version = browser.getVersion(req.getHeader("User-Agent"));
			String info = browser.getName() + "/" + version.getVersion();
			String ip=InetAddress.getLocalHost().getHostAddress();
			/*新增登录记录*/
			ulService.save(new LoginRecord(ip, new Date(), info, user));
		}
		
		
		user.setIsLogin(1); //设置在线状态为1
		uDao.save(user);

		return "redirect:/index";
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
