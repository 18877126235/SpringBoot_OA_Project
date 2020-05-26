package com.nnxy.ldq.controller.login;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.nnxy.ldq.common.MailUitls;
import com.nnxy.ldq.common.UUIDUtils;
import com.nnxy.ldq.model.dao.roledao.RoleDao;
import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.PositionDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.user.User;


@Controller
@RequestMapping("/")
public class RegistrationController {

	@Autowired
	private UserDao uDao;
	
	
	@Autowired
	private DeptDao deptDao;
	
	@Autowired
	private PositionDao posDao;
	
	@Autowired
	private RoleDao roleDao;
	
	
	
	/*
	 * 使用ajax执行注册逻辑
	 */
	@RequestMapping(value = "zhixingzhucedaima")
	public @ResponseBody String zhixingzhuce(String userName , String password,String eamil) {
		
		
		//System.out.println("看看能否获取用户名："+username);
		//获取表单数据
		//System.out.println(userName + password+ eamil);
		User user = uDao.findByUserName(userName);
		
		//说明用户名已存在
		if(user != null) {
			return "error1";
		}
		
		//首先新建对象
		User user1 = new User();
		user1.setUserName(userName);
		user1.setPassword(password);
		user1.setEamil(eamil);
		
		//设置未激活，先禁用
		user1.setIsLock(1); //禁用，等待邮箱激活
		
		//设置默认部门为人事部
		user1.setDept( deptDao.findOne(5l) );
		
		//设置权限和职位
		user1.setPosition(posDao.findOne(26l));
		user1.setRole(roleDao.findOne(5l));
		
		
		//设置默认主题颜色
		user1.setThemeSkin("blue");
		
		//插入数据库看看
		//uDao.save(user1);
		System.out.println("注册成功");
		
		//发送邮箱信息验证激活
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		
		// 发送激活邮件;
		MailUitls mailUitls = new MailUitls();
		mailUitls.sendMail(user1.getEamil(), code,userName); //用户的邮箱号和激活码发送过去
		
		return "success"; //返回显示错误信息
	}
	
	
	/*
	 * 点击邮箱连接进行激活用户
	 */
	@RequestMapping("emailcontroller")
	public String emailcontroller(String userName,Model model) {
		
		//System.out.println("来了老弟激活码:"+userName);
		
		model.addAttribute("success", "账户激活成功，请输入密码登录");
		//返回登录界面(改为重定向)
		return "login/login";
		
	}
	
	/*
	 * 验证用户名和绑定的邮箱是否一至
	 */
	
	@RequestMapping("yanzhengyonghumingheyouxiang")
	@ResponseBody
	public String yanzhengyonghumingheyouxiang(String username,String email) {
		
		System.out.println("来了老弟:"+username+"哈哈"+email);
		
		//首先判断用户名是否存在
		User findByUserName = uDao.findByUserName(username);
		
		if( findByUserName ==null ) {
			System.out.println("用户名不存在");
			return "error1";
		}else { //判断输入的邮箱与用户所绑定的邮箱账号是否相同
			
			System.out.println("用户绑定的邮箱："+findByUserName.getEamil());
			if(  email.equals(findByUserName.getEamil()) == false ) {
				System.out.println("邮箱账号与用户所绑定邮箱账号不一致");
				return "error2";
			}
		}
		
		//发送连接修改密码
		//发送邮箱信息验证激活
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		
		// 发送激活邮件;
		MailUitls mailUitls = new MailUitls();
		mailUitls.sendMailFindUser(email,code,username); //用户的邮箱号和激活码发送过去？？
		
		
		
		return "success";
		
	}
	
	/*
	 * 跳转到修改密码界面
	 */
	@RequestMapping("updatePassword")
	public String xiugaimima(String username,HttpSession session) {
		
		System.out.println("谁要修改密码："+username);
		
		//存入session中
		session.setAttribute("updatePasswordUserName", username);
		
		return "login/updatePassword";
		
	}
	
	
	/*
	 * 执行密码修改
	 */
	
	@RequestMapping("updatePasswordToGo")
	@ResponseBody
	public String updatePasswordGo(HttpSession session,String password) {
		
		
		String username = (String)session.getAttribute("updatePasswordUserName");
		
		
		if( username == null || username == "" || username.length() == 0 ) {
			
			return "error";
			
		}
		
		session.removeAttribute("updatePasswordUserName");  //清除session
		
		//修改用户秘密
		User findByUserName = uDao.findByUserName(username);
		
		System.out.println("新密码："+password);
		
		findByUserName.setPassword(password);
		
		uDao.save(findByUserName);  //修改密码
		
		return "success";
		
	}
	
	
	
}
