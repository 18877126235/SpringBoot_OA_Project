package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.EvectionMoney;
import com.nnxy.ldq.model.entity.process.ProcessList;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface EvectionMoneyDao extends PagingAndSortingRepository<EvectionMoney, Long>{

	EvectionMoney findByProId(ProcessList pro);
}
