package com.nnxy.ldq.model.dao.maildao;

import java.util.List;

import com.nnxy.ldq.model.entity.mail.Mailreciver;
import com.nnxy.ldq.model.entity.mail.Pagemail;
import com.nnxy.ldq.model.entity.note.Attachment;
import com.nnxy.ldq.model.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MailreciverDao extends PagingAndSortingRepository<Mailreciver, Long>{

	//未读邮件查询
	List<Mailreciver> findByReadAndDelAndReciverId(Boolean read, Boolean del, User reciverid);
	
	@Query("select mr.mailId.mailId from Mailreciver mr where mr.reciverId=?1")
	List<Long> findByReciverId(User user);
	
	@Query("from Mailreciver mr where mr.reciverId=?1 and mr.mailId.mailId=?2")
	Mailreciver findbyReciverIdAndmailId(User user, Long id);
	
	
	
	
	//收件箱查询
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and mr.del=?2 order by list.mailCreateTime DESC")
	Page<Pagemail> findmail(User user, Boolean bo, Pageable pa);
	
	//查询已读或未读的邮件
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and mr.del=?2 and mr.read=?3 order by list.mailCreateTime DESC")
	Page<Pagemail> findisread(User user,Boolean del,Boolean isread,Pageable pa);
	
	//查询标记的重要的邮件
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and mr.del=?2 and mr.star=?3 order by list.mailCreateTime DESC")
	Page<Pagemail> findisstar(User user,Boolean del,Boolean star,Pageable pa);
	
	//查询存在附件的邮件
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and mr.del=?2 and list.mailFileid is not null  order by list.mailCreateTime DESC")
	Page<Pagemail> findhasfile(User user,Boolean del,Pageable pa);
	
	//邮件主题或者接收人的模糊查询
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and mr.del=?2 and (list.mailTitle like %?3% or list.inReceiver like %?3%) order by list.mailCreateTime DESC")
	Page<Pagemail> findmails(User user, Boolean bo, String title, Pageable pa);
	
	//根据状态查询接收邮件
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and list.mailStatusid=?2 and mr.del=?3 order by list.mailCreateTime DESC")
	Page<Pagemail> findmailbystatus(User tu, Long statusId, Boolean bo, Pageable pa);
	
	//根据状态查询接收邮件
	@Query("select new com.nnxy.ldq.model.entity.mail.Pagemail(list.mailId,list.mailType,list.mailStatusid,list.mailTitle,list.inReceiver,list.mailFileid.attachmentId,list.mailCreateTime,mr.star,mr.read) "
			+ "from Mailreciver as mr ,Inmaillist as list where list.mailId=mr.mailId.mailId and mr.reciverId=?1 and list.mailType=?2 and mr.del=?3 order by list.mailCreateTime DESC")
	Page<Pagemail> findmailbytype(User tu, Long typeid, Boolean bo, Pageable pa);

	List<Mailreciver> findByDelAndReciverId(Boolean b, User u);
	
	@Query("select mr.del from Mailreciver as mr where mr.mailId.mailId=?1 ")
	List<Boolean> findbyMailId(Long id);
	
	List<Mailreciver> findByMailId(Long id);
	
}
