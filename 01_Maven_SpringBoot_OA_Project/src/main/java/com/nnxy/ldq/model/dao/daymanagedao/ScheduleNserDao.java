package com.nnxy.ldq.model.dao.daymanagedao;

import java.util.List;

import com.nnxy.ldq.model.entity.schedule.ScheduleUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleNserDao extends JpaRepository<ScheduleUser,Long>{
	
	//根据日程id查找所有中间表数据
	List<ScheduleUser> findByRcid(Long rcid);
	
}
