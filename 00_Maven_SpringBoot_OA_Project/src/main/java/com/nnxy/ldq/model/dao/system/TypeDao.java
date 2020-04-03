package com.nnxy.ldq.model.dao.system;

import java.util.List;

import com.nnxy.ldq.model.entity.system.SystemTypeList;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeDao extends PagingAndSortingRepository<SystemTypeList, Long>{
	
	//根据模块名和名称查找唯一对象
	SystemTypeList findByTypeModelAndTypeName(String typeModel, String typeName);
	
	//根据模块名查找到类型集合
	List<SystemTypeList> findByTypeModel(String typeModel);
	
	List<SystemTypeList> findByTypeNameLikeOrTypeModelLike(String name, String name2);
	
	
	
	@Query("select type.typeName from SystemTypeList type where type.typeId=:id")
	String findname(@Param("id") Long id);
	
	
}
