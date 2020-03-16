package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.Bursement;
import com.nnxy.ldq.model.entity.process.ProcessList;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface BursementDao extends PagingAndSortingRepository<Bursement, Long>{

	Bursement findByProId(ProcessList process);
	
	

}
