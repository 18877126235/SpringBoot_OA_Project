package com.nnxy.ldq.model.dao.taskdao;

import java.util.List;

import com.nnxy.ldq.model.entity.task.Tasklogger;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface TaskloggerDao extends PagingAndSortingRepository<Tasklogger, Long>{
	
	@Query("select tl from Tasklogger tl where tl.taskId.taskId=:id")
	List<Tasklogger> findByTaskId(@Param("id") Long id);
}
