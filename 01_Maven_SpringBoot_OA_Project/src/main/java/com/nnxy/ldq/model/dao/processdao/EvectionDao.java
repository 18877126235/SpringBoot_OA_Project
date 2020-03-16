package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.Evection;
import com.nnxy.ldq.model.entity.process.ProcessList;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface EvectionDao extends PagingAndSortingRepository<Evection, Long> {

	Evection findByProId(ProcessList process);

}
