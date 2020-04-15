package com.nnxy.ldq.mappers;

import java.awt.print.Pageable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;


//以下是基于mybatis查询的
@Mapper
public interface NoticeMapper {
	
	
	//默认根据置顶、修改时间排序
	List<Map<String, Object>> findMyNotice(@Param("userId") Long userId );
	
	//全部，但是未读
	List<Map<String, Object>> findMyNoticeandNoRead(@Param("userId") Long userId);
	
	//全部，但是已读
	List<Map<String, Object>> findMyNoticeandisRead(@Param("userId") Long userId);
	
	
	//与上面一直，限制条数为5条
	List<Map<String, Object>> findMyNoticeLimit(@Param("userId") Long userId);
	
	//进行逻辑判断，来根据那个排序，类型、状态、修改时间
	List<Map<String, Object>> sortMyNotice(@Param("userId") Long userId, @Param("baseKey") String baseKey, @Param("type") Integer type, @Param("status") Integer status, @Param("time") Integer time);

	//查询公司公告，也就是全部人可见的公告
	List<Map<String, Object>> findbyisshare(long l);
	
	//查询公司未读的公告
	List<Map<String, Object>> findbyisshareNotRead(long l);
	
	//查询公司已读的公告
	List<Map<String, Object>> findbyisshareIsRead(long l);
	
	//查询部门公告
	List<Map<String, Object>> findbynoshare(long l);
	
	
	//查询部门公告（未读）
	List<Map<String, Object>> findbynoshareNotRead(long l);
	
	//查询部门公告（已读）
	List<Map<String, Object>> findbynoshareIsRead(long l);
 
	
}
