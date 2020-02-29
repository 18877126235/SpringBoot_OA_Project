package cn.gson.oasys.model.dao.discuss;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import cn.gson.oasys.model.entity.discuss.Discuss;
import cn.gson.oasys.model.entity.user.User;

public interface DiscussDao extends JpaRepository<Discuss, Long>{
	
	//根据用户来查找讨论区的自己所发布的；
	Page<Discuss> findByUser(User user,Pageable pa);
	
	//根据用户的标题来找
	Page<Discuss> findByUserAndTitleLike(User user,String title,Pageable pa);
	
	//根据标题来找
	Page<Discuss> findByTitleLike(String title,Pageable pa);
	//按照类型查找
	Page<Discuss> findByTypeId(Long typeid, Pageable pa);
	
	
	//只查询帖子不要投票
	Page<Discuss> findByVoteListIsNull(Pageable pa); //只有通过命名规范查询的数据才能排序，否则会报错
	
	
	
	
	//@Query(value="from Discuss where voteList is null")
	//Page<Discuss>  selecttiezi(Pageable pa);
	
	
	//List<Discuss> selecttiezi();
	
	
	
	
	
	
	
	
	
	
	
	
	//查询五条热门记录
	@Query(value="SELECT * FROM aoa_discuss_list ORDER BY visit_num DESC LIMIT 0,5",nativeQuery = true)
	List<Discuss> selectfiveremen();
	
	
}
