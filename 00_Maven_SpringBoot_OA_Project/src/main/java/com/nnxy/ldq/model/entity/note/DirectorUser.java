package com.nnxy.ldq.model.entity.note;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.nnxy.ldq.model.entity.user.User;
/*
 * (共享联系人记录表)
 */
@Entity
@Table(name="aoa_director_users")
public class DirectorUser {
	
	@Id
	@Column(name="director_users_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long directorUserId;
	
	//当前多对一，多个记录对象对应同一个联系人信息对象
	@ManyToOne
	@JoinColumn(name="director_id")
	private Director director;
	
	//当前多对一，多条记录对象针对同一个用户对象
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	//当前多对一，多条记录对象来自同一个用户
	@ManyToOne
	@JoinColumn(name="share_user_id")
	private User shareuser;
	
	//当前外部联系人所属分类名称
	@Column(name="catelog_name")
	private String catalogName;
	
	private Date sharetime=new Date();
	
	
	
	public Date getSharetime() {
		return sharetime;
	}

	public void setSharetime(Date sharetime) {
		this.sharetime = sharetime;
	}
	
	//是否是目录标记
	@Column(name="is_handle")
	private Boolean handle=false;

	
	
	public User getShareuser() {
		return shareuser;
	}

	public void setShareuser(User shareuser) {
		this.shareuser = shareuser;
	}

	public Long getDirectorUserId() {
		return directorUserId;
	}

	public void setDirectorUserId(Long directorUserId) {
		this.directorUserId = directorUserId;
	}

	public Director getDirector() {
		return director;
	}

	public void setDirector(Director director) {
		this.director = director;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCatalogName() {
		return catalogName;
	}

	public void setCatalogName(String catalogName) {
		this.catalogName = catalogName;
	}

	public Boolean getHandle() {
		return handle;
	}

	public void setHandle(Boolean handle) {
		this.handle = handle;
	}

	public DirectorUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DirectorUser(User user, String catalogName) {
		this.user = user;
		this.catalogName = catalogName;
	}

	@Override
	public String toString() {
		return "DirectorUser [directorUserId=" + directorUserId + ", catalogName=" + catalogName + ", handle=" + handle
				+ ",sharetime"+sharetime+"]";
	}
	
	
	
}
