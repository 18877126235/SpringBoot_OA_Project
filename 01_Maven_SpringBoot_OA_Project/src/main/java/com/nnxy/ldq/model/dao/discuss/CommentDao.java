package com.nnxy.ldq.model.dao.discuss;

import java.util.List;

import com.nnxy.ldq.model.entity.discuss.Comment;
import com.nnxy.ldq.model.entity.discuss.Reply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CommentDao extends JpaRepository<Comment, Long>{
	
	//根据回复表来找有关的所有评论
	List<Comment> findByReply(Reply reply);
	
	@Query("from Comment t where t.reply.replyId in (?1)")
	List<Comment> findComments(Long[] taskids);
	
	
}
