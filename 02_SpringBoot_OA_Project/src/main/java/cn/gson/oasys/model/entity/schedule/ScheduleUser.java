package cn.gson.oasys.model.entity.schedule;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 日程用户中间表实体类
 */

@Entity
@Table(name = "aoa_schedule_user")
public class ScheduleUser {

	@Id
	@Column(name = "su_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long suId;
	
	//日程id
	@Column(name = "rcid")
	private Long rcid;

	//用户id
	@Column(name = "user_id")
	private Long userId;

	public Long getRcid() {
		return rcid;
	}

	public void setRcid(Long rcid) {
		this.rcid = rcid;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ScheduleUser [rcid=" + rcid + ", userId=" + userId + "]";
	}
	
	
	
}
