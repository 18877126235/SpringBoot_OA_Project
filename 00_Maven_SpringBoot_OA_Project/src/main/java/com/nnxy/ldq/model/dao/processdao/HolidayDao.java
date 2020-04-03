package com.nnxy.ldq.model.dao.processdao;

import com.nnxy.ldq.model.entity.process.Holiday;
import com.nnxy.ldq.model.entity.process.ProcessList;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface HolidayDao extends PagingAndSortingRepository<Holiday, Long>{

	Holiday findByProId(ProcessList pro);

}
