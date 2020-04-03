package com.nnxy.ldq.model.dao.discuss;

import java.util.List;

import com.nnxy.ldq.model.entity.discuss.VoteList;
import com.nnxy.ldq.model.entity.discuss.VoteTitles;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VoteTitleListDao extends JpaRepository<VoteTitles, Long>{
	
	//根据投票id来找所有投票标题的集合
	List<VoteTitles> findByVoteList(VoteList voteList);
}
