package com.nnxy.ldq.model.dao.user;

import java.util.List;

import com.nnxy.ldq.model.entity.user.Position;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

public interface PositionDao extends PagingAndSortingRepository<Position, Long>{

	@Query("select po.name from Position po where po.id=:id")
	String findById(@Param("id") Long id);
	
	List<Position> findByDeptidAndNameNotLike(Long deptid, String name);
	
	List<Position> findByDeptidAndNameLike(Long deptid, String name);

	List<Position> findByDeptid(Long deletedeptid);
}
