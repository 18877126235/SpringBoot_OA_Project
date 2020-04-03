package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.ProcessList;
import com.nnxy.ldq.model.entity.process.Resign;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ResignDao extends PagingAndSortingRepository<Resign, Long>{

	Resign findByProId(ProcessList process);

}
