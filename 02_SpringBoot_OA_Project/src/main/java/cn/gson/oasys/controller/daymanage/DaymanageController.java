package cn.gson.oasys.controller.daymanage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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

import cn.gson.oasys.model.dao.daymanagedao.DaymanageDao;
import cn.gson.oasys.model.dao.system.StatusDao;
import cn.gson.oasys.model.dao.system.TypeDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.entity.schedule.ScheduleList;
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
			@RequestParam(value="size",defaultValue="10") int size
			) {
		
		//System.out.println("傲虎；；‘；’‘’‘’‘’‘’‘’‘；’；‘’‘；’；‘；；；；；；；；；；；");
		
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
		Page<ScheduleList> myday = daydao.findByUserOrUsers(user,users, pa);
		
		
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
	 * 新建或修改日程显示页面
	 */
	@RequestMapping("dayedit")
	private String dayedit(@RequestParam(value="rcid",required=false) Long rcid,
			@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size,
			Model model,
			@SessionAttribute("userId") Long userid//之前犯了个错误，就是用String 来接收userid，导致获取到null
			
			){

		ps.user(page, size, model);
		List<SystemTypeList> types = typedao.findByTypeModel("aoa_schedule_list");
		List<SystemStatusList> statuses = statusdao.findByStatusModel("aoa_schedule_list");
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
		
		return "daymanage/editday";
	}
	
	/*
	 * 执行新增日程逻辑
	 */
	@RequestMapping("addandchangeday")
	public String addandchangeday(ScheduleList scheduleList, //填写的日程对象
			@RequestParam("shareuser") String shareuser, //指定的接收者
			BindingResult br, //表单后台校验
			@SessionAttribute("userId") Long userid //当前用户id
		){
		
		User user = udao.findOne(userid); //当前用户
		
		System.out.println(shareuser); //输出当前日程对象
		
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
		
		System.out.println(scheduleList); //输出日程对象
		
		daydao.save(scheduleList); //保存
		
		//返回日程列表页面
		return "/daymanage";
	}
	
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
