package cn.gson.oasys.controller.daymanage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.alibaba.fastjson.JSONObject;

import cn.gson.oasys.mappers.NoticeMapper;
import cn.gson.oasys.model.dao.daymanagedao.DaymanageDao;
import cn.gson.oasys.model.dao.daymanagedao.ScheduleNserDao;
import cn.gson.oasys.model.dao.system.StatusDao;
import cn.gson.oasys.model.dao.system.TypeDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.entity.schedule.ScheduleList;
import cn.gson.oasys.model.entity.schedule.ScheduleUser;
import cn.gson.oasys.model.entity.system.SystemStatusList;
import cn.gson.oasys.model.entity.system.SystemTypeList;
import cn.gson.oasys.model.entity.user.User;
import cn.gson.oasys.services.daymanage.DaymanageServices;
import cn.gson.oasys.services.process.ProcessService;

@Controller
@RequestMapping("/")
public class DaymanageController {
	@Autowired
	DaymanageDao daydao;
	@Autowired
	UserDao udao;
	@Autowired
	DaymanageServices dayser;
	@Autowired
	StatusDao statusdao;
	@Autowired
	TypeDao typedao;
	@Autowired
	ProcessService ps;
	
	@Autowired
	private ScheduleNserDao scheduleNserDao;
	
	
	@Autowired
	private NoticeMapper nm;
	
	/**
	 * 显示个人日程表
	 * @param userid
	 * @param model
	 * @param page
	 * @param size
	 * @return
	 */
	@RequestMapping("daymanage")
	private String daymanage(@SessionAttribute("userId") Long userid,
			Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size,
			HttpServletRequest request
			) {
		
		//前台弹窗提示
		if( request.getSession().getAttribute("success_new") != null ) {
			
			request.setAttribute("success", "创建成功");
			request.getSession().removeAttribute("success_new"); //session清除
		}

		//获取所有的类型数据
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		//获取所有的状态数据
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		//一个排序规则集合
		List<Order> orders=new ArrayList<>();
		//根据状态id排序
		orders.add(new Order(Direction.DESC, "statusId"));
		//根据创建时间排序
		orders.add(new Order(Direction.DESC, "createTime"));
		//创建排序对象
		Sort sort=new Sort(orders);
		//分页对象
		Pageable pa=new PageRequest(page, size,sort);
		//当前用户
		User user = udao.findOne(userid);
		//为了查看和当前用户有关的所有所有日程
		List<User> users = new ArrayList<User>();
		users.add(user);
		//获取所有和我有关的日程
		//Page<ScheduleList> myday = daydao.findByUser(user, pa); //根据用户查询
		Page<ScheduleList> myday = daydao.findByUserOrUsers(user,users, pa); //注意这个Or和and的区别
		
		
//		List<User> users = new ArrayList<User>();
//		//User user2 = udao.findOne(36l);
//		users.add(user);
//		System.out.println("我擦，啥都没有？？？");
		//测试根据用户和中间表关联查询  
		//Page<ScheduleList> myday = daydao.findByUserAndUsers(user,users, pa); //根据用户查询
		//Page<ScheduleList> myday = daydao.findByUser(user, pa);
//		Page<ScheduleList> myday = daydao.findByUserOrUsers(user,users, pa);
//		for (ScheduleList scheduleList : myday) {
//			
//			System.out.println("看看能不能获取全部："+scheduleList);
//			
//		}
		

		//获取已经排序好的日程表
		List<ScheduleList> scheduleLists = myday.getContent();
		//日程放置域对象
		model.addAttribute("schedules",scheduleLists);
		//类型集合放置域对象
		model.addAttribute("types",types);
		//状态集合放置域对象
		model.addAttribute("statuses",statuses);
		//排序分页好的集合
		model.addAttribute("page", myday);
		//访问路径url
		model.addAttribute("url", "daymanagepaging");
		//标记可操作
		model.addAttribute("ismyday", 1);
		
		//当前用户放置，判断日程是否是自己发布的
		model.addAttribute("user",user);
		
		
		//System.out.println("来了老弟哈哈哈哈哈哈");
		
		
		return "daymanage/daymanage";
	}
	
	
	@RequestMapping("daymanagepaging")
	private String daymanagepaging(@SessionAttribute("userId") Long userid,
			Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size
			){
		
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		Sort sort=new Sort(new Order(Direction.ASC,"user"));
		Pageable pa=new PageRequest(page, size,sort);
		User user = udao.findOne(userid);
		Page<ScheduleList> myday = daydao.findByUser(user, pa);
		
		List<ScheduleList> scheduleLists = myday.getContent();
		model.addAttribute("types",types);
		model.addAttribute("statuses",statuses);
		model.addAttribute("schedules",scheduleLists);
		model.addAttribute("page", myday);
		model.addAttribute("url", "daymanagepaging");
		model.addAttribute("ismyday", 1);
		return "daymanage/daymanagepaging";
	}
	
	
	
	@RequestMapping("aboutmeday")
	private String aboutmeday(@SessionAttribute("userId") Long userid,
			Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size
			){
		
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		Sort sort=new Sort(new Order(Direction.ASC,"user"));
		Pageable pa=new PageRequest(page, size,sort);
		User user = udao.findOne(userid);
		List<User> users = new ArrayList<>();
		users.add(user);
		Page<ScheduleList> aboutmeday = daydao.findByUsers(users, pa);
		
		List<ScheduleList> scheduleLists = aboutmeday.getContent();
		
		model.addAttribute("schedules",scheduleLists);
		model.addAttribute("types",types);
		model.addAttribute("statuses",statuses);
		model.addAttribute("page", aboutmeday);
		model.addAttribute("url", "aboutmedaypaging");
		
		System.out.println("监控中心----------------------------------------");
		
		return "daymanage/daymanage";
	}
	
	@RequestMapping("aboutmedaypaging")
	public String aboutmedaypaging(@SessionAttribute("userId") Long userid,
			Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size
			){
		
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		Sort sort=new Sort(new Order(Direction.ASC,"user"));
		Pageable pa=new PageRequest(page, size,sort);
		User user = udao.findOne(userid);
		List<User> users = new ArrayList<>();
		users.add(user);
		Page<ScheduleList> aboutmeday = daydao.findByUsers(users, pa);
		
		List<ScheduleList> scheduleLists = aboutmeday.getContent();
		
		model.addAttribute("schedules",scheduleLists);
		model.addAttribute("types",types);
		model.addAttribute("statuses",statuses);
		model.addAttribute("page", aboutmeday);
		
		model.addAttribute("url", "aboutmedaypaging");
		
		return "daymanage/daymanagepaging";
	}
	
	/*
	 * 新建或修改日程显示页面（算了，为了好区分这里就只修改服务不行，出现了奇怪的符号）
	 */
	@RequestMapping("dayedit")
	private String dayedit(@RequestParam(value="rcid",required=false) Long rcid,
			@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size,
			Model model,
			@SessionAttribute("userId") Long userid//之前犯了个错误，就是用String 来接收userid，导致获取到null
			
			){ 
		//这里是用来封装追加接收人的
		ps.user(page, size, model);
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		
		//如果存在日程id的话就是修改了
		ScheduleList rc = null;
		if(rcid!=null){
			rc = daydao.findOne(rcid);
			System.out.println(rc);
			

		}
		
		model.addAttribute("types",types);
		model.addAttribute("statuses",statuses);
		model.addAttribute("rc",rc);
		
		User user = udao.findOne(userid);
		if( user.getRole().getRoleId() <= 4  ) {//如果是部门经理以上的人员，有权限为下属设置日程
			//这里只设置了超级管理员权限
			model.addAttribute("issuperman",1);
		}
		
		//获取接收者名单
		//先获取证件表数据
		List<ScheduleUser> findByRcid = scheduleNserDao.findByRcid(rcid);
		
		//存放用户集合
		List<User> users = new ArrayList<>();
		users.add(rc.getUser());
		//遍历获取所有与该日程有关的用户
		for (ScheduleUser scheduleUser : findByRcid) {
			
			users.add( udao.findOne(scheduleUser.getUserId()) );
			
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("users", users);
		model.addAttribute("map",map);

		return "daymanage/editday";
	}
	
	
	
	/*
	 * 单独的新增日程
	 */
	@RequestMapping("newdaymanage")
	public String newdaymanage(
			@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size,
			Model model,
			@SessionAttribute("userId") Long userid//之前犯了个错误，就是用String 来接收userid，导致获取到null
			) {
		
		
		//这里是用来封装追加接收人的
		ps.user(page, size, model);
		//根据模块名称获得有关的类型
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		//根据模块名称获得有关的状态
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		//将类型和状态放置域对象
		model.addAttribute("types",types);
		model.addAttribute("statuses",statuses);
		
		//获取当前用户
		User user = udao.findOne(userid);
		if( user.getRole().getRoleId() <= 4  ) {//如果是部门经理以上的人员，有权限为下属设置日程
			//这里只设置了超级管理员权限
			model.addAttribute("issuperman",1);
		}
		

		return "daymanage/editday_new";
		
	}
	
	
	
	/*
	 * 执行新增日程逻辑
	 */
	@RequestMapping("addandchangeday")
	public String addandchangeday(ScheduleList scheduleList, //填写的日程对象
			@RequestParam("shareuser") String shareuser, //指定的接收者
			BindingResult br, //表单后台校验
			@SessionAttribute("userId") Long userid, //当前用户id
			HttpServletRequest request
		){
		
		User user = udao.findOne(userid); //当前用户
		
		System.out.println(shareuser); //输出当前指定接收的用户对象的名称
		
		List<User> users = new ArrayList<>();
		
		//工具类，按照传过去的字符串对象以;分割
		StringTokenizer st = new StringTokenizer(shareuser, ";");
		//存储到集合中
		while (st.hasMoreElements()) {
			users.add(udao.findByUserName(st.nextToken()));
		}
		//设置当前日程是谁发布的
		scheduleList.setUser(user);
		
		//接收对象放置到对象集合当中
		if(users.size()>0){
			scheduleList.setUsers(users);
		}
		
		//System.out.println(scheduleList); //输出日程对象
		
		daydao.save(scheduleList); //保存
		
		
		//request.setAttribute("success", );
		request.getSession().setAttribute("success_new", "操作成功");
		
		
		//测试打印通知表数据
		//先获取所有公告通知
		List<Map<String, Object>> list = nm.findMyNotice(userid);
		for (Map<String, Object> map : list) {
			
			System.out.println("妈卖批的:"+map);
			
		}
		
		//重定向日程列表页面
		return "redirect:daymanage"; //这里使用重定向
	}
	
	
	/*
	 * 点击查看日程显示视图
	 */
	@RequestMapping("dayedit_chakan")
	public String chakanrichengxinxi(
			@RequestParam(value="rcid",required=false) Long rcid,
			@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size,
			Model model,
			@SessionAttribute("userId") Long userid//之前犯了个错误，就是用String 来接收userid，导致获取到null
			) {
		
		//ps.user(page, size, model);
		
		//List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		
		//List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
		
		//将数据封装成map集合
		
		//获取当前日程对象
		ScheduleList rc = null;
		if(rcid!=null){
			rc = daydao.findOne(rcid);
			//System.out.println(rc);
		}
		//封装数据用于显示
		Map<String,Object> map = new HashMap<String, Object>();
		
		//封装类型
		map.put("type", typedao.findOne(rc.getTypeId()).getTypeName()) ;
		//封装状态
		map.put("statuse", statusdao.findOne(rc.getStatusId()).getStatusName());
		

		//封装接收人员
		//要去日程用户中间表中查看该条日程和谁有关
		//根据日程id从中间表中获取出所有有关的用户的中间表数据
		List<ScheduleUser> findByRcid = scheduleNserDao.findByRcid(rcid);

		//存放用户集合
		List<User> users = new ArrayList<>();
		//遍历获取所有的用户
		for (ScheduleUser scheduleUser : findByRcid) {
			
			users.add( udao.findOne(scheduleUser.getUserId()) );
			
		}
		
		users.add(rc.getUser());
		
		//封装接收人数据
		map.put("users", users);
	
		
		//map集合放置域对象
		model.addAttribute("map",map);
		model.addAttribute("rc",rc);
		
		/*User user = udao.findOne(userid);
		if( user.getRole().getRoleId() <= 4  ) {//如果是部门经理以上的人员，有权限为下属设置日程
			//这里只设置了超级管理员权限
			model.addAttribute("issuperman",1);
		}*/
		
		
		
		
		
		return "daymanage/editday_chakan";
	}
	

	/*
	 * 删除日程
	 */
	@RequestMapping("dayremove")
	public String dayremove(@RequestParam(value="rcid") Long rcid){
		ScheduleList rc = daydao.findOne(rcid);
		
		daydao.delete(rc);
		
		return "/daymanage";
	}
	
	/**
	 * 第一下是日历controller
	 * @return
	 */
	@RequestMapping("daycalendar")
	private String daycalendar() {
		
		//System.out.println("呃呃呃呃咋回事");
		
		return "daymanage/daycalendar";
	}

//	@RequestMapping("mycalendarload")
//	public void mycalendarload(@SessionAttribute("userId") Long userid,HttpServletResponse response) throws IOException{
//		List<ScheduleList> se = dayser.aboutmeschedule(userid);
//		
//		for (ScheduleList scheduleList : se) {
//			System.out.println(scheduleList);
//		}
//		
//		String json = JSONObject.toJSONString(se);
//		response.setHeader("Cache-Control", "no-cache");
//		response.setContentType("text/json;charset=UTF-8");
//		response.getWriter().write(json);
//		
//	}
	
	/*
	 * ajax获取和自己有关的日程信息
	 */
	@RequestMapping("mycalendarload")
	public @ResponseBody List<ScheduleList> mycalendarload(@SessionAttribute("userId") Long userid,HttpServletResponse response) throws IOException{
		//查找日程数据
		List<ScheduleList> se = dayser.aboutmeschedule(userid);
		
		return se;
	}
	
}
