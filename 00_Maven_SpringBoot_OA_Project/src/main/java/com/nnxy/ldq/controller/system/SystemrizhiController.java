package com.nnxy.ldq.controller.system;

import java.awt.print.Pageable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nnxy.ldq.model.dao.IndexDao;
import com.nnxy.ldq.model.dao.roledao.RoleDao;
import com.nnxy.ldq.model.dao.roledao.RolepowerlistDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.dao.user.UserLogDao;
import com.nnxy.ldq.model.entity.system.SystemStatusList;
import com.nnxy.ldq.model.entity.user.LoginRecord;
import com.nnxy.ldq.model.entity.user.UserLog;
import com.nnxy.ldq.services.role.RoleService;
import com.nnxy.ldq.services.system.MenuSysService;

@Controller
@RequestMapping("/")
public class SystemrizhiController {

	@Autowired
	private IndexDao iDao;
	@Autowired
	private MenuSysService menuService;
	@Autowired
	private UserDao uDao;
	@Autowired
	private RoleDao rdao;
	@Autowired
	private RolepowerlistDao rldao;
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserLogDao userLogDao;
	
	/*
	 * 获取用户操作日志
	 * 
	 */
	@RequestMapping("systemrizhi")
	public String allrizhi(@RequestParam(value="page",defaultValue = "0")int page,
			HttpSession session,Model model,
			@RequestParam(value="baseKey",required=false)String basekey,
			@RequestParam(value="time",required=false)String time,
			@RequestParam(value="icon",required=false)String icon) {
		
		List<UserLog> alluserlogs = userLogDao.findalltimedesc();
		for (UserLog userLog : alluserlogs) {
			System.out.println("全部操作日志："+userLog);
		}
		model.addAttribute("userLog", alluserlogs);
		return "systemcontrol/userlogmessage";
	}
	
	
	/**
	 * 查找日志表格
	 * @param req
	 * @return
	 */
	@RequestMapping("userlogtable")
	public String userlogtable(HttpServletRequest req){
		
		if(!StringUtils.isEmpty(req.getParameter("name"))){
			String name="%"+req.getParameter("name")+"%";
			System.out.println("获取："+name);
			List<UserLog> findbaskey2 = userLogDao.findbaskey2(name);
			req.setAttribute("userLog",findbaskey2);
		}
		else{
			List<UserLog> alluserlogs = userLogDao.findalltimedesc();
			req.setAttribute("userLog",alluserlogs);
		}
		return "systemcontrol/userlogtable";
	}
	
	
}
