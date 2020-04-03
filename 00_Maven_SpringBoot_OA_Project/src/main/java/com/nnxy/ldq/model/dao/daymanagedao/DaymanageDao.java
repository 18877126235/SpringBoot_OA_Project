package com.nnxy.ldq.model.dao.daymanagedao;

import java.util.List;

import com.nnxy.ldq.model.entity.schedule.ScheduleList;
import com.nnxy.ldq.model.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DaymanageDao extends JpaRepository<ScheduleList,Long>{
	
	List<ScheduleList> findByUser(User user);
	
	List<ScheduleList> findByUsers(List<User> users);
	
	Page<ScheduleList> findByUsers(List<User> users, Pageable pa);
	
	Page<ScheduleList> findByUser(User user, Pageable pa);
	
	//查询当前日程是我创建的，并且该日程下具体谁接收
	Page<ScheduleList> findByUserAndUsers(User user, List<User> users, Pageable pa);
	
	//查询和我有关的日程
	Page<ScheduleList> findByUserOrUsers(User user, List<User> users, Pageable pa);
	
	
}
