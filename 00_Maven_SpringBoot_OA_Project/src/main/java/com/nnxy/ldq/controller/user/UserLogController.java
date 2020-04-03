package com.nnxy.ldq.controller.user;
import java.util.Collections;
import java.util.Comparator;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONObject;

import com.nnxy.ldq.model.dao.scheduledao.ScheduleDao;
import com.nnxy.ldq.model.dao.taskdao.TaskDao;
import com.nnxy.ldq.model.dao.taskdao.TaskuserDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.dao.user.UserLogDao;
import com.nnxy.ldq.model.dao.user.UserLogRecordDao;
import com.nnxy.ldq.model.dao.user.UserLogRecordService;
import com.nnxy.ldq.model.dao.user.UserLogService;
import com.nnxy.ldq.model.entity.schedule.ScheduleList;
import com.nnxy.ldq.model.entity.user.LoginRecord;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.model.entity.user.UserLog;

@Controller
@RequestMapping("/")
public class UserLogController {
	@Autowired
	private UserLogDao userLogDao;
	@Autowired
	private UserLogService userLogService;
	@Autowired
	private UserDao uDao;
	@Autowired
	private TaskDao taskDao;
	
	//任务接收人联系表
	@Autowired
	private TaskuserDao taskuserDao;
	
	@Autowired
	private UserLogRecordDao userLogRecordDao;
	@Autowired
	private ScheduleDao scheduleDao;
	@Autowired
	private UserLogRecordService userLogRecordService;
	
	
	//显示本周的每天的记录
	@RequestMapping("countweeklogin")
	public String dfsa(HttpServletResponse response) throws IOException{
		Integer []r=new Integer[7];
		Calendar calendar=Calendar.getInstance();
		 setToFirstDay(calendar);
		 for (int i = 0; i < 7; i++) {
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			 r[i]=userLogRecordDao.countlog(sdf.format(calendar.getTime()));
			 calendar.add(Calendar.DATE, 1);
	        }
		 String json=JSONObject.toJSONString(r);
		 System.out.println(json);
			response.setHeader("Cache-Control", "no-cache");
			response.setContentType("text/json;charset=UTF-8");
			response.getWriter().write(json);
		return null;
	}
	
	private static void setToFirstDay(Calendar calendar) {
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DATE, -1);
        }
    }
	//给hashMap按照value排序
	public static ArrayList<Entry<String,Integer>> sortMap(Map map){
	     List<Entry<String, Integer>> entries = new ArrayList<Entry<String, Integer>>(map.entrySet());
	     Collections.sort(entries, new Comparator<Entry<String, Integer>>() {
	         public int compare(Entry<String, Integer> obj1 , Entry<String, Integer> obj2) {
	             return obj2.getValue() - obj1.getValue();
	         }
	     });
	      return (ArrayList<Entry<String, Integer>>) entries;
	    }
	
	//显示任务统计模块数据
	@RequestMapping("counttasknum")
	public String test3df(HttpServletResponse response) throws IOException {
		
		//查找所有用户
		List<User> uList= uDao.findAll();
		
		HashMap< String, Integer> hashMap=new HashMap<>();
		
		int i=0;
		
		for (User user : uList) {
			//遍历用户列表，然后根据每个用户的id去查看一下谁完成了几个任务
			//if(taskDao.countfinish(7l, user.getUserId())>0){  //这里可是搞错了哦，应该去任务用户中间表查找
			if(taskuserDao.countfinish(7l, user.getUserId())>0){
				
				System.out.println("查找完成任务的家伙："+user.getUserName()+taskuserDao.countfinish(7l, user.getUserId()));
				//System.out.println("查找完成任务的家伙："+user.getUserName()+taskDao.countfinish(7l, user.getUserId()));
			
			
				//hashMap.put(user.getUserName(), taskDao.countfinish(7l, user.getUserId()));
				hashMap.put(user.getUserName(), taskuserDao.countfinish(7l, user.getUserId()));
				i++;
			}
			
		}
		 ArrayList<Entry<String,Integer>> entries= sortMap(hashMap); //从大到小排序好
		 
		 ArrayList<Entry<String,Integer>> entries2=new ArrayList<Entry<String,Integer>>();
		
		 if(entries.size()>=5)
		 //获得前5个s
		 for (int j = 0; j < 5; j++) {
			entries2.add(entries.get(j));
		 }else {
			 entries2= entries;
		}
		 
		String json=JSONObject.toJSONString(entries2);
		System.out.println(json);
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().write(json);
		return null;
	}
	
	//日历的数据显示
	@RequestMapping("littlecalendar")
	public String test3df(HttpSession session,HttpServletResponse response) throws IOException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		long userid=Long.valueOf(session.getAttribute("userId")+"");
		List list=new ArrayList<>();
		List<ScheduleList>  dates=scheduleDao.findstart(userid);
		for (ScheduleList scheduleList : dates) {
			list.add(sdf.format(scheduleList.getStartTime()));
		}
		String json=JSONObject.toJSONString(list);
		System.out.println(json);
		response.setHeader("Cache-Control", "no-cache");
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().write(json);
		return null;
	}
	
	//用来查找用户记录
	@RequestMapping("morelogrecord")
	public String test3df342(@RequestParam(value="page",defaultValue = "0")int page,
			HttpSession session,Model model,
			@RequestParam(value="baseKey",required=false)String basekey,
			@RequestParam(value="time",required=false)String time,
			@RequestParam(value="icon",required=false)String icon
			) {
		
		//System.out.println("哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈");
		System.out.println("11"+basekey);

		
		
		getuserlogrecord(page, session, model, basekey, time, icon);
		
		/*List<LoginRecord> findAll = userLogRecordDao.findAll();
		
		model.addAttribute("userloglist", findAll);*/
		
		return "user/userlogrecordmanage";
	}

			 
	
	/*
	 * 我想自己写的方法
	 
	public String login_log() {
		
		List<LoginRecord> findAll = userLogRecordDao.findAll();
		
		for (LoginRecord loginRecord : findAll) {
			System.out.println(loginRecord.getUser().getUserName());
		}
		return "user/userlogrecordmanage";  //返回试图显示
	}*/
	
	
			
			//用来查找用户记录
				@RequestMapping("morelogrecordtable")
				public String test3dfrt342(@RequestParam(value="page",defaultValue = "0")int page,
						HttpSession session,Model model,
						@RequestParam(value="baseKey",required=false)String basekey,
						@RequestParam(value="time",required=false)String time,
						@RequestParam(value="icon",required=false)String icon) {
				
					
					getuserlogrecord(page, session, model, basekey, time, icon);
					return "user/userlogrecordmanagetable"; 
					
				}
	
				public void getuserlogrecord(int page, HttpSession session, Model model, String basekey, String time,
						String icon) {
					
					//System.out.println("卧槽这么牛逼");
					long userid=Long.valueOf(session.getAttribute("userId")+"");
					
					setTwo(model, basekey, time,icon);
					
					Page<LoginRecord> page4=userLogRecordService.ulogpaging(page, basekey, userid, time);
					

					model.addAttribute("page", page4);
	
					model.addAttribute("userloglist", page4.getContent());
					
					
					
					System.out.println("debug");
					for (LoginRecord loginRecord :  page4.getContent()) {
						System.out.println("000"+loginRecord);
					}
					model.addAttribute("url", "morelogrecordtable");
				}
	
	//用来查找用户记录
		@RequestMapping("morelog")
		public String test3df(@RequestParam(value="page",defaultValue = "0")int page,
				HttpSession session,Model model,
				@RequestParam(value="baseKey",required=false)String basekey,
				@RequestParam(value="time",required=false)String time,
				@RequestParam(value="icon",required=false)String icon
				) {
			System.out.println("11"+basekey);
			getuserlog(page, session, model, basekey, time, icon);
			return "user/userlogmanage";
		}

		
		
		//用来查找用户记录
			@RequestMapping("morelogtable")
			public String test3dfrt(@RequestParam(value="page",defaultValue = "0")int page,
					HttpSession session,Model model,
					@RequestParam(value="baseKey",required=false)String basekey,
					@RequestParam(value="time",required=false)String time,
					@RequestParam(value="icon",required=false)String icon) {
				getuserlog(page, session, model, basekey, time, icon);
				return "user/userlogmanagetable"; 
				
			}


			
			public void getuserlog(int page, HttpSession session, Model model, String basekey, String time,
					String icon) {
				long userid=Long.valueOf(session.getAttribute("userId")+"");
				setTwo(model, basekey, time,icon);
				Page<UserLog> page3=userLogService.ulogpaging(page, basekey, userid, time);
				model.addAttribute("page", page3);
				model.addAttribute("userloglist", page3.getContent());
				
				model.addAttribute("url", "morelogtable");
			}
			
			//记忆两种规则
			private void setTwo(Model model, String basekey, Object time,Object icon) {
				if(!StringUtils.isEmpty(time)){
					model.addAttribute("time", time);
					model.addAttribute("icon", icon);
					model.addAttribute("sort", "&time="+time+"&icon="+icon);
				}
				if(!StringUtils.isEmpty(basekey)){
					model.addAttribute("basekey", basekey);
					model.addAttribute("sort", "&basekey="+basekey);
				}
			}
	
}
