package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.ProcessList;
import com.nnxy.ldq.model.entity.process.Regular;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface RegularDao extends PagingAndSortingRepository<Regular, Long>{

	Regular findByProId(ProcessList pro);

}
