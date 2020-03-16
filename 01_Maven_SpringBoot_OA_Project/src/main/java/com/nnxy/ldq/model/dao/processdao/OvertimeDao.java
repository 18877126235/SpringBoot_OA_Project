package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.Overtime;
import com.nnxy.ldq.model.entity.process.ProcessList;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface OvertimeDao extends PagingAndSortingRepository<Overtime, Long>{

	Overtime findByProId(ProcessList pro);

}
