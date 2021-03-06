package com.nnxy.ldq.services.daymanage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnxy.ldq.model.dao.daymanagedao.DaymanageDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.schedule.ScheduleList;
import com.nnxy.ldq.model.entity.user.User;

@Service
public class DaymanageServices {
	@Autowired
	UserDao udao;
	@Autowired
	DaymanageDao daydao;

	
	public List<ScheduleList> aboutmeschedule(Long userId){
		
		User user = udao.findOne(userId);
		List<User> users = new ArrayList<>();
		users.add(user); //日程与日程所发表的用户肯定相关
		
		//创建日程集合
		List<ScheduleList> aboutmerc = new ArrayList<>();
		
		//首先根据用户id查找出相关的日程
		List<ScheduleList> myschedule = daydao.findByUser(user);
		
		//去日程和用户对应的中间表中查找出有关的数据
		List<ScheduleList> otherschedule = daydao.findByUsers(users);
		
		//以下合并两个集合
		for (ScheduleList scheduleList : myschedule) {
			aboutmerc.add(scheduleList);
		}
		
		for (ScheduleList scheduleList : otherschedule) {
			aboutmerc.add(scheduleList);
		}
		
//		aboutmerc.addAll(myschedule);
//		aboutmerc.addAll(otherschedule);
		//设置用户名称
		for (ScheduleList scheduleList : aboutmerc) {
			
			User user1 = scheduleList.getUser();
			
			scheduleList.setUsername(user1.getUserName());
			//System.out.println("遍历日程数据："+scheduleList);
		}
		
		return aboutmerc;
	}
}
