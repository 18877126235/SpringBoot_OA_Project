package cn.gson.oasys.model.dao.taskdao;

import java.util.List;


import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import cn.gson.oasys.model.entity.system.SystemStatusList;
import cn.gson.oasys.model.entity.task.Tasklist;
import cn.gson.oasys.model.entity.task.Taskuser;
import cn.gson.oasys.model.entity.user.User;

public interface TaskuserDao extends PagingAndSortingRepository<Taskuser, Long> {

	//这里是根据任务id返回所有状态id集合
	@Query("select tu.statusId from Taskuser tu where tu.taskId.taskId=:id ")
	List<Integer> findByTaskId(@Param("id")Long id);
	
	//修改任务中间表状态
	@Query("update Taskuser ta set ta.statusId=:statusid where ta.taskId.taskId=:taskid")
	@Modifying
	int updatestatus(@Param("taskid")Long taskid,@Param("statusid")Integer statusid);
	
	@Query("select tu.taskId.taskId from Taskuser tu where tu.userId.userId=:userid ")
	List<Long> findByUserId(@Param("userid")Long userid);
	
	//根据接收人id和任务id查找状态id（注意这里返回状态id）
	@Query("select tu.statusId from Taskuser tu where tu.userId.userId=:userid and tu.taskId.taskId=:taskid ")
	Long findByuserIdAndTaskId(@Param("userid")Long userid,@Param("taskid")Long taskid);
	
	//与上类似，只不过是返回对象
	@Query("select tu from Taskuser tu where tu.userId.userId=:userid and tu.taskId.taskId=:taskid ")
	Taskuser finduserIdAndTaskId(@Param("userid")Long userid,@Param("taskid")Long taskid);
	
	
	//根据任务id查询所有中间表数据对象集合
	List<Taskuser> findByTaskId(Tasklist taskId);
	
	
	//找新任务
	List<Taskuser> findByUserIdAndStatusId(User user,Integer id);
}
