package com.nnxy.ldq.model.dao.processdao;

import java.util.List;

import com.nnxy.ldq.model.entity.process.EvectionMoney;
import com.nnxy.ldq.model.entity.process.Stay;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface StayDao extends PagingAndSortingRepository<Stay, Long>{
 
	List<Stay> findByEvemoney(EvectionMoney money);
}
