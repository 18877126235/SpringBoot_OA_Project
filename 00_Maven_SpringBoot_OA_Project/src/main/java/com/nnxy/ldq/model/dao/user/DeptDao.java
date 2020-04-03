package com.nnxy.ldq.model.dao.user;

import java.util.List;

import com.nnxy.ldq.model.entity.user.Dept;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface DeptDao extends PagingAndSortingRepository<Dept, Long>{

	List<Dept> findByDeptId(Long id);
	
	
	@Query("select de.deptName from Dept de where de.deptId=:id")
	String findname(@Param("id") Long id);
}
