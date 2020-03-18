package com.nnxy.ldq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.support.DefaultConversionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.nnxy.ldq.mappers.NoticeMapper;
import com.nnxy.ldq.model.dao.attendcedao.AttendceDao;
import com.nnxy.ldq.model.dao.daymanagedao.DaymanageDao;
import com.nnxy.ldq.model.dao.discuss.DiscussDao;
import com.nnxy.ldq.model.dao.filedao.FileListdao;
import com.nnxy.ldq.model.dao.informdao.InformRelationDao;
import com.nnxy.ldq.model.dao.maildao.MailreciverDao;
import com.nnxy.ldq.model.dao.notedao.DirectorDao;
import com.nnxy.ldq.model.dao.plandao.PlanDao;
import com.nnxy.ldq.model.dao.processdao.NotepaperDao;
import com.nnxy.ldq.model.dao.processdao.ProcessListDao;
import com.nnxy.ldq.model.dao.roledao.RolepowerlistDao;
import com.nnxy.ldq.model.dao.system.StatusDao;
import com.nnxy.ldq.model.dao.system.TypeDao;
import com.nnxy.ldq.model.dao.taskdao.TaskuserDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.dao.user.UserLogDao;
import com.nnxy.ldq.model.entity.attendce.Attends;
import com.nnxy.ldq.model.entity.mail.Mailreciver;
import com.nnxy.ldq.model.entity.notice.NoticeUserRelation;
import com.nnxy.ldq.model.entity.plan.Plan;
import com.nnxy.ldq.model.entity.process.Notepaper;
import com.nnxy.ldq.model.entity.process.ProcessList;
import com.nnxy.ldq.model.entity.role.Rolemenu;
import com.nnxy.ldq.model.entity.system.SystemStatusList;
import com.nnxy.ldq.model.entity.system.SystemTypeList;
import com.nnxy.ldq.model.entity.task.Taskuser;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.model.entity.user.UserLog;
import com.nnxy.ldq.services.daymanage.DaymanageServices;
import com.nnxy.ldq.services.inform.InformRelationService;
import com.nnxy.ldq.services.inform.InformService;
import com.nnxy.ldq.services.system.MenuSysService;

@Controller
@RequestMapping("/")
public class IndexController {

	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private MenuSysService menuService;
	@Autowired
	private NoticeMapper nm;
	@Autowired
	private StatusDao statusDao;
	@Autowired
	private TypeDao typeDao;
	@Autowired
	private UserDao uDao;
	@Autowired
	private AttendceDao attendceDao;
	@Autowired
	private DirectorDao directorDao;
	@Autowired
	private DiscussDao discussDao;
	@Autowired
	private FileListdao filedao;
	@Autowired
	private PlanDao planDao;
	@Autowired
	private NotepaperDao notepaperDao;
	@Autowired
	private UserLogDao userLogDao;
	@Autowired
	private ProcessListDao processListDao;
	@Autowired
	private InformRelationDao irdao;
	@Autowired
	private MailreciverDao mdao;
	@Autowired
	private TaskuserDao  tadao;
	@Autowired
	private RolepowerlistDao rdao;
	@Autowired
	private DaymanageServices dayser;
	@Autowired
	private InformService informService;
	@Autowired
	private DaymanageDao daydao;
	@Autowired
	private InformRelationService informrelationservice;
	
	// 格式转化导入
	DefaultConversionService service = new DefaultConversionService();

	@RequestMapping("index")
	public String index(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		if(StringUtils.isEmpty(session.getAttribute("userId"))){ //如果是空的
			
			
			
			return "login/login";
		}
		
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user=uDao.findOne(userId);
		menuService.findMenuSys(req,user);
		
		
		
		/*
		 * 这里暂时不搞了，太复杂了都，不要和公告搞在一起搞混了，以后有时间再设置单独模块来处理
		 */
		//查询所有的日程表（根据当前用户去查询）
		//List<ScheduleList> aboutmenotice = dayser.aboutmeschedule(userId);
		//遍历一下
		/*for (ScheduleList scheduleList : aboutmenotice) {
			
			//如果是否提醒不为空并且是flase
			if(scheduleList.getIsreminded()!=null&&!scheduleList.getIsreminded()){
				
				System.out.println(scheduleList.getStartTime());
				
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");//24小时制 
//				simpleDateFormat.parse(scheduleList.getStartTime()).getTime();  
				
				String start = simpleDateFormat.format(scheduleList.getStartTime());
				
				String now = simpleDateFormat.format(new Date());
				try {
					long now2 = simpleDateFormat.parse(now).getTime();
					long start2 = simpleDateFormat.parse(start).getTime();  
					long cha = start2-now2;
					//判断是否过期？？？
					if(0<cha && cha <86400000){
						NoticesList remindnotices = new NoticesList();
					
						remindnotices.setTypeId(11l); //类型
						remindnotices.setStatusId(15l); //状态id
						remindnotices.setTitle("您有一个日程即将开始"); //设置通知标题
						remindnotices.setUrl("/daycalendar"); //连接访问
						remindnotices.setUserId(userId); //设置通知的用户
						remindnotices.setNoticeTime(new Date());
						
						NoticesList remindnoticeok = informService.save(remindnotices);
						
						informrelationservice.save(new NoticeUserRelation(remindnoticeok, user, false));
						
						scheduleList.setIsreminded(true);
						daydao.save(scheduleList);
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}*/
		
		//获取未读的消息通知
		List<NoticeUserRelation> notice=irdao.findByReadAndUserId(false,user);//通知
		
		//未读邮件数量
		List<Mailreciver> mail=mdao.findByReadAndDelAndReciverId(false, false, user);//邮件
		
		//新任务数量
		List<Taskuser>  task=tadao.findByUserIdAndStatusId(user, 3);//新任务
		
		model.addAttribute("notice", notice.size());
		model.addAttribute("mail", mail.size());
		model.addAttribute("task", task.size());
		model.addAttribute("user", user);
		
		//展示用户操作记录 由于现在没有登陆 不能获取用户id
		List<UserLog> userLogs=userLogDao.findByUser(userId); //获取用户操作日志
		
		req.setAttribute("userLogList", userLogs);
		
		return "index/index";
	}
	/**
	 * 菜单查找
	 * @param userId
	 * @param req
	 * @return
	 */
	@RequestMapping("menucha")
	public String menucha(HttpSession session, Model model,HttpServletRequest req){
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user=uDao.findOne(userId);
		String val=null;
		if(!StringUtils.isEmpty(req.getParameter("val"))){
			val=req.getParameter("val");
		}
		if(!StringUtils.isEmpty(val)){
			List<Rolemenu> oneMenuAll=rdao.findname(0L, user.getRole().getRoleId(), true, true, val);//找父菜单
			List<Rolemenu> twoMenuAll=null;
			for (int i = 0; i < oneMenuAll.size(); i++) {
				twoMenuAll=rdao.findbyparentxianall(oneMenuAll.get(i).getMenuId(), user.getRole().getRoleId(), true, true);//找子菜单
			}
			req.setAttribute("oneMenuAll", oneMenuAll); //在这哈哈
			req.setAttribute("twoMenuAll", twoMenuAll);
		}else{
			menuService.findMenuSys(req,user);
		}
	
		return "common/leftlists";
		
	}
	@RequestMapping("userlogs")
	public String usreLog(@SessionAttribute("userId") Long userId,HttpServletRequest req){
		List<UserLog> userLogs=userLogDao.findByUser(userId);
		req.setAttribute("userLogList", userLogs);
		return "user/userlog";
	}

	/*
	 * 获取签到信息
	 */
	private void showalist(Model model, Long userId) {
		
		// 显示用户当天最新的签到记录
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nowdate = sdf.format(date);
		//然后获取到最新的考勤记录
		/*//Attends aList = attendceDao.findlastest(nowdate, userId);
		if (aList != null) {
			String type = typeDao.findname(aList.getTypeId());
			
			model.addAttribute("type", type);
		}
		
		model.addAttribute("alist", aList);*/
		
		
		//改成查找某用户某天总共的记录
		int aList = attendceDao.countrecord( nowdate,  userId);
		
		//System.out.println("怎么会报错了呢："+aList);
		
		if( aList == 0 ) {
			model.addAttribute("alist", "0");
		}else if( aList == 1 ) {
			model.addAttribute("alist", "1");
		}else {
			model.addAttribute("alist", "2");
		}
		model.addAttribute("type", "1");
	}
	
	

	/**
	 * 控制面板主页
	 * 
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("test2")
	public String test2(HttpSession session, Model model, HttpServletRequest request) {
		Long userId = Long.parseLong(session.getAttribute("userId") + "");
		User user=uDao.findOne(userId);
		request.setAttribute("user", user);
		//计算三个模块的记录条数（待定。。。）
		request.setAttribute("filenum", filedao.count());
		request.setAttribute("directornum", directorDao.count());
		request.setAttribute("discussnum", discussDao.count());
		
		List<Map<String, Object>> list = nm.findMyNoticeLimit(userId);
		model.addAttribute("user", user);
		for (Map<String, Object> map : list) {
			map.put("status", statusDao.findOne((Long) map.get("status_id")).getStatusName());
			map.put("type", typeDao.findOne((Long) map.get("type_id")).getTypeName());
			map.put("statusColor", statusDao.findOne((Long) map.get("status_id")).getStatusColor());
			map.put("userName", uDao.findOne((Long) map.get("user_id")).getUserName());
			map.put("deptName", uDao.findOne((Long) map.get("user_id")).getDept().getDeptName());
		}
		// List<Map<String, Object>>
		// noticeList=informRService.setList(noticeList1);
		//获取签到信息
		showalist(model, userId);
		
		System.out.println("通知"+list);
		model.addAttribute("noticeList", list);
		
		
		//列举计划
		List<Plan> plans=planDao.findByUserlimit(userId);
		model.addAttribute("planList", plans);
		List<SystemTypeList> ptype = (List<SystemTypeList>) typeDao.findByTypeModel("aoa_plan_list");
		List<SystemStatusList> pstatus = (List<SystemStatusList>) statusDao.findByStatusModel("aoa_plan_list");
		model.addAttribute("ptypelist", ptype);
		model.addAttribute("pstatuslist", pstatus);
		
		//列举便签
		List<Notepaper> notepapers=notepaperDao.findByUserIdOrderByCreateTimeDesc(userId);
		model.addAttribute("notepaperList", notepapers);
		
		//列举几个流程记录
		List<ProcessList> pList=processListDao.findlastthree(userId);
		model.addAttribute("processlist", pList);
		List<SystemStatusList> processstatus = (List<SystemStatusList>) statusDao.findByStatusModel("aoa_process_list");
		model.addAttribute("prostatuslist", processstatus);
		return "systemcontrol/control"; //转发到首页视图
	}
	
	@RequestMapping("test3")
	public String test3() {
		return "note/noteview";
	}

	@RequestMapping("test4")
	public String test4() {
		return "mail/editaccount";
	}

	@RequestMapping("notlimit")
	public String notLimit() {
		return "common/notlimit";
	}
	// 测试系统管理

	@RequestMapping("one")
	public String witeMail() {
		return "mail/wirtemail";
	}

	@RequestMapping("two")
	public String witeMail2() {
		return "mail/seemail";
	}

	@RequestMapping("three")
	public String witeMail3() {
		return "mail/allmail";
	}

	@RequestMapping("mmm")
	public String witeMail4() {
		return "mail/mail";
	}

	@RequestMapping("ffff")
	public @ResponseBody PageInfo<Map<String, Object>> no() {
		PageHelper.startPage(2, 10);
		List<Map<String, Object>> list = nm.findMyNotice(2L);
		PageInfo<Map<String, Object>> info = new PageInfo<Map<String, Object>>(list);
		System.out.println(info);
		return info;
	}
	
	

}
