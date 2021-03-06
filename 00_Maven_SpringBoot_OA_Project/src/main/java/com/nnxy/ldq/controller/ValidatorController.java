package com.nnxy.ldq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.nnxy.ldq.common.formValid.BindingResultVOUtil;
import com.nnxy.ldq.common.formValid.MapToList;
import com.nnxy.ldq.common.formValid.ResultEnum;
import com.nnxy.ldq.common.formValid.ResultVO;
import com.nnxy.ldq.model.dao.roledao.RoleDao;
import com.nnxy.ldq.model.dao.system.StatusDao;
import com.nnxy.ldq.model.dao.system.TypeDao;

import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.role.Role;
import com.nnxy.ldq.model.entity.system.SystemStatusList;
import com.nnxy.ldq.model.entity.system.SystemTypeList;
import com.nnxy.ldq.model.entity.task.Tasklist;
import com.nnxy.ldq.model.entity.user.Dept;
import com.nnxy.ldq.model.entity.user.User;


@Controller
@RequestMapping("/")
public class ValidatorController {
	
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private StatusDao sdao;
	@Autowired
	private TypeDao tydao;
	@Autowired
	private UserDao udao;
	@Autowired
	private DeptDao ddao;
	@Autowired
	private RoleDao rdao;
	
	
	/*
	 * 开头就保存任务呀,单独用一个controller来保存任务
	 */
	@RequestMapping("ck_addtask")
	public String addtask(HttpServletRequest request,@Valid Tasklist tlist,BindingResult br,HttpSession session,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size){
		request.setAttribute("tasklist", tlist);
		Pageable pa=new PageRequest(page, size);
		
		// 这里返回ResultVO对象，如果校验通过，ResultEnum.SUCCESS.getCode()返回的值为200；否则就是没有通过；
		ResultVO res = BindingResultVOUtil.hasErrors(br);
		System.out.println("tlist:"+tlist);
		
		//如果校验不通过
		if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) { //表单数据校验
			List<Object> list = new MapToList<>().mapToList(res.getData());
			request.setAttribute("errormess", list.get(0).toString());
			System.out.println("list错误的实体类信息：" + tlist);
			System.out.println("list错误详情:" + list);
			System.out.println("list错误第一条:" + list.get(0));
			System.out.println("啊啊啊错误的信息——：" + list.get(0).toString());
			// 下面的info信息是打印出详细的信息
			log.info("getData:{}", res.getData());
			log.info("getCode:{}", res.getCode());
			log.info("getMsg:{}", res.getMsg());
			
			
			
			String userId = ((String) session.getAttribute("userId")).trim();
			Long userid = Long.parseLong(userId);

			
			// 查询类型表
			Iterable<SystemTypeList> typelist = tydao.findAll();
			// 查询状态表
			Iterable<SystemStatusList> statuslist = sdao.findAll();
			// 查询部门下面的员工
			Page<User> pagelist = udao.findByFatherId(userid,pa);
			List<User> emplist=pagelist.getContent();
			// 查询部门表
			Iterable<Dept> deptlist = ddao.findAll();
			// 查角色表
			Iterable<Role> rolelist = rdao.findAll();
			request.setAttribute("typelist", typelist);
			request.setAttribute("statuslist", statuslist);
			request.setAttribute("emplist", emplist);
			request.setAttribute("page", pagelist);
			request.setAttribute("deptlist", deptlist);
			request.setAttribute("rolelist", rolelist);
			
			
			return "task/addtask"; //回到原来的
		}
		else{ //否则校验通过，执行新增任务逻辑
			//
			return "forward:/addtasks"; //重定向
		}

	}

}
