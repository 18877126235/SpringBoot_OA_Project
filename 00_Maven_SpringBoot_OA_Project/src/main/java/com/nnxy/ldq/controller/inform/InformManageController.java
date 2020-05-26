package com.nnxy.ldq.controller.inform;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.nnxy.ldq.common.formValid.BindingResultVOUtil;
import com.nnxy.ldq.common.formValid.MapToList;
import com.nnxy.ldq.common.formValid.ResultEnum;
import com.nnxy.ldq.common.formValid.ResultVO;
import com.nnxy.ldq.mappers.NoticeMapper;
import com.nnxy.ldq.model.dao.informdao.InformDao;
import com.nnxy.ldq.model.dao.informdao.InformRelationDao;
import com.nnxy.ldq.model.dao.system.StatusDao;
import com.nnxy.ldq.model.dao.system.TypeDao;
import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.notice.NoticeUserRelation;
import com.nnxy.ldq.model.entity.notice.NoticesList;
import com.nnxy.ldq.model.entity.system.SystemStatusList;
import com.nnxy.ldq.model.entity.system.SystemTypeList;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.services.inform.InformRelationService;
import com.nnxy.ldq.services.inform.InformService;

@Controller
@RequestMapping("/")
public class InformManageController {

	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private StatusDao statusDao;

	@Autowired
	private TypeDao typeDao;

	@Autowired
	private InformDao informDao;

	@Autowired
	private InformService informService;

	@Autowired
	private UserDao uDao;

	@Autowired
	private DeptDao deptDao;

	@Autowired
	private InformRelationDao informrelationDao;

	@Autowired
	private InformRelationService informrelationservice;

	@Autowired
	private NoticeMapper nm;

	
	
	/**
	 * 通知管理删除
	 */
	@RequestMapping("infromdelete")
	public String infromDelete(HttpSession session, HttpServletRequest req) {
		Long noticeId = Long.parseLong(req.getParameter("id"));
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		NoticesList notice = informDao.findOne(noticeId);
		if (!Objects.equals(userId, notice.getUserId())) {
			System.out.println("权限不匹配，不能删除");
			return "redirect:/notlimit";
		}
		System.out.println(noticeId);
		informService.deleteOne(noticeId);
		return "redirect:/infrommanage";

	}
	
	
	//使用ajax异步删除全选的公告
	@ResponseBody
	@RequestMapping("deleteAll")
	public String deleteAll(HttpSession session, HttpServletRequest req) {
		
		//System.out.println("来了老弟"+req.getParameter("noticeId"));
		//接下来根据公告id删除公告
		//informDao
		Long noticeId = Long.parseLong(req.getParameter("noticeId"));
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		NoticesList notice = informDao.findOne(noticeId); //根据公告id查询一条公告
		if ( userId != 1l ) { //如果不是超级管理员
			//System.out.println("权限不匹配，不能删除");
			
			//modelAndView.setViewName("redirect:/notlimit");
			return "error";
		}
		//System.out.println(noticeId);
		informService.deleteOne(noticeId);

		return "success";
	}
	
	
	//使用ajax异步删除全选的公告方法二
	@ResponseBody
	@RequestMapping("deleteInfombyAjax")
	public String deleteInfombyAjax(HttpSession session,String id) {
		
		System.out.println("啊哈哈哈哈:"+id);
		String infoId = id + "";
		Long noticeId = Long.parseLong(infoId);
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		//NoticesList notice = informDao.findOne(noticeId); //根据公告id查询一条公告
		if ( userId != 1l ) { //如果不是超级管理员
			//System.out.println("权限不匹配，不能删除");
			
			return "error";  //没有权限删除
		}
		informService.deleteOne(noticeId);

		return "success";
	}
	
	/**
	 * 通知管理面板
	 * 
	 * @return
	 */
	@RequestMapping("infrommanage")
	public String inform(@RequestParam(value = "page", defaultValue = "0") int page,@SessionAttribute("userId") Long userId,Model model) {
		
		Page<NoticesList> page2 = informService.pageThis(page,userId); //分页对象
		
		List<NoticesList> noticeList=page2.getContent();
		
		List<Map<String, Object>> list=informService.fengZhuang(noticeList);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page2);
		//设置变量，需要load的url；
		model.addAttribute("url", "infrommanagepaging");
		return "inform/informmanage";
	}
	
	@RequestMapping("forwardother")
	public String forwardOther(@SessionAttribute("userId")Long userId,@RequestParam(value="noticeId")Long noticeId){
		List<User> users=uDao.findByFatherId(userId);
		NoticesList nl=informDao.findOne(noticeId);
		List<NoticeUserRelation> nurs=new  ArrayList<>();
		for (User user : users) {
			nurs.add(new NoticeUserRelation(nl, user, false));
		}
		informrelationservice.saves(nurs);
		return "redirect:/infromlist";
	}



	/**
	 * 通知列表删除
	 */
	@RequestMapping("informlistdelete")  
	public String informListDelete(HttpServletRequest req, HttpSession session) {
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		Long noticeId = Long.parseLong(req.getParameter("id"));
		NoticeUserRelation relation = informrelationDao.findByUserIdAndNoticeId(uDao.findOne(userId),
				informDao.findOne(noticeId));
		if (Objects.isNull(relation)) {
			System.out.println("权限不匹配，不能删除");
			return "redirect:/notlimit";
		}
		informrelationservice.deleteOne(relation);
		return "forward:/infromlist";
	}

	/**
	 * 本部门公告通知列表（）改成跳转到通知列表
	 * 
	 * @return
	 */
	//@RequestMapping("infromlist")
	@RequestMapping("nitifyall")
	public String infromList(HttpSession session, HttpServletRequest req, Model model,
			@RequestParam(value="pageNum",defaultValue="1") int page
			
			) {
		
		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		
		com.github.pagehelper.Page<Object> page1 = PageHelper.startPage(page, 10); //设置分页查询参数
		//待定？？？
		List<Map<String, Object>> list = nm.findMyNotice(userId);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		List<Map<String, Object>> list2=informrelationservice.setList(list);
	
		model.addAttribute("url", "informlistpaging"); //点击下一页后跳转页面
		model.addAttribute("list", list2);
		
		model.addAttribute("page", pageinfo);
		

		
		//是否有权限操作公告
		User findOne = uDao.findOne(userId);
		
		if( findOne.getRole().getRoleId() <= 4 ) {
			model.addAttribute("hasrole", "yes");
		}
		
		//return "inform/informlist";  
		return "inform/infomasege";
		
	}
	
	/*
	 * 查询全部可见的公告
	 */
	@RequestMapping("/infolist3")
	public String infolist3(HttpSession session,Model model
			,@RequestParam(value="pageNum",defaultValue="1") int page
			,@RequestParam(value = "baseKey", required = false) String baseKey
			) {
		System.out.println("查询："+baseKey);
		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		PageHelper.startPage(page, 10); //设置分页查询参数
		//待定？？？
		List<Map<String, Object>> list = nm.findMyNotice(userId);

		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		
		List<Map<String, Object>> list2=informrelationservice.setList(list);
		model.addAttribute("url", "informlistpaging");//点击下一页后跳转到的连接
		
		//待定使用
		//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
		
		model.addAttribute("list", list2);
	
		model.addAttribute("page", pageinfo);

		return "inform/informlistpaging";
		
	}
	
	
	/*
	 * 
	 * ajax异步加载公告列表（查询公司公告）
	 */
	@RequestMapping("/infolist1")
	public String infolist(HttpSession session,Model model
			,@RequestParam(value="pageNum",defaultValue="1") int page
			) {

		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		PageHelper.startPage(page, 10); //设置分页查询参数
		//待定？？？
		List<Map<String, Object>> list = nm.findbyisshare(userId);

		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		
		List<Map<String, Object>> list2=informrelationservice.setList(list);
		model.addAttribute("url", "infolist1");//点击下一页后跳转到的连接
		
		//待定使用
		//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
		
		model.addAttribute("list", list2);
		
		model.addAttribute("page", pageinfo);

		return "inform/informlistpaging";
		
	}
	
	//查询全部未读
		@RequestMapping("/quanbuweidu") 
		public String quanbuweidu(HttpSession session,Model model,
				@RequestParam(value="pageNum",defaultValue="1") int page
				) {
			
			Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
			PageHelper.startPage(page, 10); //设置分页查询参数
			//待定？？？
			List<Map<String, Object>> list = nm.findMyNoticeandNoRead(userId);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			List<Map<String, Object>> list2=informrelationservice.setList(list);
			model.addAttribute("url", "quanbuweidu");//点击下一页后跳转到的连接
			//待定使用
			//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
			model.addAttribute("list", list2);
			model.addAttribute("page", pageinfo);

			return "inform/informlistpaging";
		}
		
		//查询全部已读
		@RequestMapping("/quanbuyidu") 
		public String quanbuyidu(HttpSession session,Model model,
				@RequestParam(value="pageNum",defaultValue="1") int page
				) {
			
			Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
			PageHelper.startPage(page, 10); //设置分页查询参数
			//待定？？？
			List<Map<String, Object>> list = nm.findMyNoticeandisRead(userId);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			List<Map<String, Object>> list2=informrelationservice.setList(list);
			model.addAttribute("url", "quanbuyidu");//点击下一页后跳转到的连接
			//待定使用
			//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
			model.addAttribute("list", list2);
			model.addAttribute("page", pageinfo);

			return "inform/informlistpaging";
		}
	
	
		//查询公司公告未读
		@RequestMapping("/infomCompanyNotRead") 
		public String infomCompanyNotRead(HttpSession session,Model model,
				@RequestParam(value="pageNum",defaultValue="1") int page
				) {
			
			Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
			PageHelper.startPage(page, 10); //设置分页查询参数
			//待定？？？
			List<Map<String, Object>> list = nm.findbyisshareNotRead(userId);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			List<Map<String, Object>> list2=informrelationservice.setList(list);
			model.addAttribute("url", "infomCompanyNotRead");//点击下一页后跳转到的连接
			//待定使用
			//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
			model.addAttribute("list", list2);
			model.addAttribute("page", pageinfo);

			return "inform/informlistpaging";
		}
		
		//查询公司公告已读
		@RequestMapping("/infomCompanyIsRead") 
		public String infomCompanyIsRead(HttpSession session,Model model,
				@RequestParam(value="pageNum",defaultValue="1") int page
				) {
			
			Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
			PageHelper.startPage(page, 10); //设置分页查询参数
			//待定？？？
			List<Map<String, Object>> list = nm.findbyisshareIsRead(userId);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			List<Map<String, Object>> list2=informrelationservice.setList(list);
			model.addAttribute("url", "infomCompanyIsRead");//点击下一页后跳转到的连接
			//待定使用
			//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
			model.addAttribute("list", list2);
			model.addAttribute("page", pageinfo);

			return "inform/informlistpaging";
		}
		
		
	/*
	 * 查询本部门公告
	 */
	@RequestMapping("/infolist2")
	public String infolist2(HttpSession session,Model model
			,@RequestParam(value="pageNum",defaultValue="1") int page
			) {
		System.out.println("查询本部门公告");
		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		Long fatherId = uDao.findOne(userId).getFatherId();
		PageHelper.startPage(page, 10); //设置分页查询参数
		System.out.println("我的上司id是："+fatherId);
		//待定？？？
		List<Map<String, Object>> list = nm.findbynoshare(uDao.findOne(userId));  //获取本部门上司发布的部门公告

		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		
		List<Map<String, Object>> list2=informrelationservice.setList(list);
		
		model.addAttribute("url", "infolist2");//点击下一页后跳转到的连接
		
		//待定使用
		//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
		
		model.addAttribute("list", list2);
		
		model.addAttribute("page", pageinfo);

		return "inform/informlistpaging";
	}
	
	/*
	 * 查询本部门公告（未读）
	 */
	@RequestMapping("/infomDeptNotRead")
	public String infomDeptNotRead(HttpSession session,Model model
			,@RequestParam(value="pageNum",defaultValue="1") int page
			) {

		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		PageHelper.startPage(page, 10); //设置分页查询参数
		//待定？？？
		List<Map<String, Object>> list = nm.findbynoshareNotRead(userId);

		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		
		List<Map<String, Object>> list2=informrelationservice.setList(list);
		
		model.addAttribute("url", "infomDeptNotRead");//点击下一页后跳转到的连接
		
		//待定使用
		//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
		
		model.addAttribute("list", list2);
		
		model.addAttribute("page", pageinfo);

		return "inform/informlistpaging";
	}
	
	/*
	 * 查询本部门公告（已读）
	 */
	@RequestMapping("/infomDeptIsRead")
	public String infomDeptIsRead(HttpSession session,Model model
			,@RequestParam(value="pageNum",defaultValue="1") int page
			) {

		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		PageHelper.startPage(page, 10); //设置分页查询参数
		//待定？？？
		List<Map<String, Object>> list = nm.findbynoshareIsRead(userId);

		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		
		List<Map<String, Object>> list2=informrelationservice.setList(list);
		
		model.addAttribute("url", "infomDeptIsRead");//点击下一页后跳转到的连接
		
		//待定使用
		//session.setAttribute("infolisttype", "company");//标记此时显示的列表是公司公告
		
		model.addAttribute("list", list2);
		
		model.addAttribute("page", pageinfo);

		return "inform/informlistpaging";
	}
	

	/*
	 * 点击显示最新公告
	 */
	/*@RequestMapping("newmasege")
	public String newinfromlist(HttpSession session,Model model) {
		
		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		
		//查询和当前用户相关，且未读的公告(通知)
		//先获取所有公告
		List<Map<String, Object>> list = nm.findMyNotice(userId);
		
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		//再去除已读的公告
		for (Map<String, Object> map : list) { //每一个list里面都放置了一个map（每一个map都放置了公告信息属性的键值对）
			int is_read = (int)map.get("is_read");
			if(  is_read  == 0  ) { //如果是读公告
				System.out.println(map);	
				list2.add(map);
			}
		}
		
		//封装公告数据
		List<Map<String, Object>> list3=informrelationservice.setList(list2);

		model.addAttribute("list", list3);
		return "inform/newinformlist";
		
	}*/
	
	

	/**
	 * 编辑通知界面
	 */
	@RequestMapping("informedit")
	public String infromEdit(HttpServletRequest req, HttpSession session, Model model) {
		
		//System.out.println("你来这里干嘛呀*******************************************");
		session.removeAttribute("noticeId");
		
		List<SystemTypeList> typeList = typeDao.findByTypeModel("inform");
		List<SystemStatusList> statusList = statusDao.findByStatusModel("inform");
		
		if (!StringUtils.isEmpty(req.getAttribute("errormess"))) {
			req.setAttribute("errormess", req.getAttribute("errormess"));
		}
		if (!StringUtils.isEmpty(req.getAttribute("success"))) {
			req.setAttribute("success", "数据保存成功");
		}
		req.setAttribute("typeList", typeList);
		req.setAttribute("statusList", statusList);
		if (!StringUtils.isEmpty(req.getParameter("id"))) {
			Long noticeId = Long.parseLong(req.getParameter("id"));
			NoticesList noticeList = informDao.findOne(noticeId);
			model.addAttribute("noticeList", noticeList);
			model.addAttribute("typeName", typeDao.findOne(noticeList.getTypeId()).getTypeName());
			model.addAttribute("statusName", statusDao.findOne(noticeList.getStatusId()).getStatusName());
			session.setAttribute("noticeId", noticeId);
		}

		//是否有权限发布公司公告
		Long userId = Long.parseLong(session.getAttribute("userId") + ""); //获取当前用户id
		if( userId <=3l ) {  //只有管理员和总经理才有资格发布公司公告
		
			model.addAttribute("ishaveqx", "yes");
			
		}
		
		
		
		return "inform/informedit";
	}

	/**
	 * 详细通知显示
	 */
	@RequestMapping("informshow")
	public String informShow(HttpServletRequest req, Model model) {
		
		Long noticeId = Long.parseLong(req.getParameter("id"));
		
		String isnew = req.getParameter("isnew");
		
		if( isnew== null ) {
			model.addAttribute("isnew","");  //放置判断是否从最新公告来了哈哈
		}else {
			model.addAttribute("isnew",isnew);  //放置判断是否从最新公告来了哈哈
		}
		
		
		
		System.out.println("打印测试看看对不对：***********************"+isnew);
		
		if (!StringUtils.isEmpty(req.getParameter("read"))) {
			if (("0").equals(req.getParameter("read"))) {
				Long relationId = Long.parseLong(req.getParameter("relationid"));
				NoticeUserRelation relation = informrelationDao.findOne(relationId);
				relation.setRead(true); //设为已读状态
				informrelationservice.save(relation);
			}
		}
		NoticesList notice = informDao.findOne(noticeId);
		
		//System.out.println("打印这条公告试试看:"+notice);
		
		User user = uDao.findOne(notice.getUserId()); //获取公告发布人
		//System.out.println("发布人："+user);
		
		model.addAttribute("notice", notice);
		model.addAttribute("userName", user.getUserName());
		return "inform/informshow";
	}

	/**
	 * 系统管理表单验证
	 * 
	 * 后台校验表单数据，不通过则回填数据，显示错误信息；通过则直接执行业务，例如新增、编辑等；
	 * @return
	 */
	@RequestMapping("informcheck")
	public String testMess(HttpServletRequest req, @Valid NoticesList menu, BindingResult br) {
		
		HttpSession session = req.getSession();
		Long menuId = null;
		
		req.setAttribute("menuObj", menu);
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		
		menu.setUserId(userId);

		// 这里返回ResultVO对象，如果校验通过，ResultEnum.SUCCESS.getCode()返回的值为200；否则就是没有通过；
		ResultVO res = BindingResultVOUtil.hasErrors(br);
		// 校验失败
		if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) {
			List<Object> list = new MapToList<>().mapToList(res.getData());
			req.setAttribute("errormess", list.get(0).toString());
			// 代码调试阶段，下面是错误的相关信息；
			System.out.println("list错误的实体类信息：" + menu);
			System.out.println("list错误详情:" + list);
			System.out.println("list错误第一条:" + list.get(0));
			System.out.println("啊啊啊错误的信息——：" + list.get(0).toString());
			// 下面的info信息是打印出详细的信息
			log.info("getData:{}", res.getData());
			log.info("getCode:{}", res.getCode());
			log.info("getMsg:{}", res.getMsg());
		}
		// 校验通过，下面写自己的逻辑业务
		else {

			// 判断是否从编辑界面进来的，前面有"session.setAttribute("getId",getId);",在这里获取，并remove掉；
			if (!StringUtils.isEmpty(session.getAttribute("noticeId"))) {
				menuId = (Long) session.getAttribute("noticeId"); // 获取进入编辑界面的menuID值
				
				System.out.println("我是编辑界面来的呀********************************");
				
				NoticesList inform = informDao.findOne(menuId);
				menu.setNoticeTime(inform.getNoticeTime());
				menu.setNoticeId(menuId);
				session.removeAttribute("noticeId");
				informService.save(menu);
			} else { //点击保存后来到这
				
				System.out.println("我不是编辑界面来的呀********************************");
				
				menu.setNoticeTime(new Date()); //设置当前公告时间
				menu.setUserId(userId); //设置公告的发布人
				menu.setDepId(uDao.findOne(userId).getDept().getDeptId());
				
				NoticesList noticeList = informService.save(menu); //保存当前公告
				
				
				//System.out.println("这是刚才保存的公告哈哈哈哈哈："+noticeList);
				
				User user2 = uDao.findByUserId(userId);
				
				if(menu.getIsShare() == true ) { //是否全部人可见
					
					//查找全部用户
					List<User> userList = uDao.findAll();
//					for (User user : userList) {
//						System.out.println("打印试试看:"+user);
//					}
					
					//存入用户中间表
					for (User user1 : userList) {
						informrelationservice.save(new NoticeUserRelation(noticeList, user1, false)); //false代表未读
					}
					
				}else { //否则仅该部门下用户可见
					//待定你大爷的，好复杂的程序
					List<User> userList = uDao.findByFatherId(user2.getFatherId()); //查找处同一个部门的所有用户哈哈哈哈（妈的智障，干嘛用上司的id）
					for (User user : userList) {
						System.out.println("打印试试看:"+user);
					}
					
					//通知同部门的用户接收公告(存入用户和公告对应的中间表)
					for (User user1 : userList) {
						informrelationservice.save(new NoticeUserRelation(noticeList, user1, false));
					}
					
				}
				
				
				// 设置自己对于该公告本身为已读状态
				 
				//先根据用户id和通知id获取中间表数据
				User userId2 = uDao.findOne(userId);
				NoticeUserRelation findByUserIdAndNoticeId = informrelationDao.findByUserIdAndNoticeId(userId2,noticeList );
				findByUserIdAndNoticeId.setRead(true); //设置为已读
				informrelationservice.save(findByUserIdAndNoticeId); //保存为已读
				//System.out.println(findByUserIdAndNoticeId);
				
				
				
			}
			// 执行业务代码结束************
			System.out.println("此操作是正确的");
			req.setAttribute("success", "后台验证成功");
		}
		
		System.out.println("*********是否进入最后的实体类信息：" + menu.getIsShare());
		return "redirect:/infrommanage"; //？？？？？
	}
	
	
	/*
	 * ajax异步删除公告
	 */
	

} //类括号
