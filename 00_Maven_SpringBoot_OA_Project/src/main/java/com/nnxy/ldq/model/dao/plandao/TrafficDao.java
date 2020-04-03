package com.nnxy.ldq.model.dao.plandao;

import java.util.List;

import com.nnxy.ldq.model.entity.process.EvectionMoney;
import com.nnxy.ldq.model.entity.process.Traffic;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface TrafficDao extends PagingAndSortingRepository<Traffic, Long>{

	List<Traffic> findByEvection(EvectionMoney money);
}
