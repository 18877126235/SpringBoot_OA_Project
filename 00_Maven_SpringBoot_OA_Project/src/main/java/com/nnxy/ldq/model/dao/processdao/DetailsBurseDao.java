package com.nnxy.ldq.model.dao.processdao;

import java.util.List;

import com.nnxy.ldq.model.entity.process.Bursement;
import com.nnxy.ldq.model.entity.process.DetailsBurse;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface DetailsBurseDao extends PagingAndSortingRepository<DetailsBurse, Long>{

	List<DetailsBurse> findByBurs(Bursement bu);
}
