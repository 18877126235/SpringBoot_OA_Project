package cn.gson.oasys.model.dao.daymanagedao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import cn.gson.oasys.model.entity.schedule.ScheduleList;
import cn.gson.oasys.model.entity.schedule.ScheduleUser;

public interface ScheduleNserDao extends JpaRepository<ScheduleUser,Long>{
	
	//根据日程id查找所有中间表数据
	List<ScheduleUser> findByRcid(Long rcid);
	
}
