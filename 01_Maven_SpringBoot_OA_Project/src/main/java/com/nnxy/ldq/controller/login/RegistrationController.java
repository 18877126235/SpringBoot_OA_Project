package com.nnxy.ldq.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		//发送邮箱信息验证激活
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		
		// 发送激活邮件;
		MailUitls mailUitls = new MailUitls();
		mailUitls.sendMail(user1.getEamil(), code); //用户的邮箱号和激活码发送过去？？
		
		return "success"; //返回显示错误信息
	}
	
	
	/*
	 * 点击邮箱连接进行激活用户
	 */
	@RequestMapping("emailcontroller")
	public String emailcontroller() {
		
		System.out.println("来了老弟激活码");
		
		return "login/Registration";
		
	}

}
