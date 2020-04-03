package com.nnxy.ldq.model.dao.address;


import com.nnxy.ldq.model.entity.note.Director;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressDao extends JpaRepository<Director, Long> {

	//根据姓名首拼模糊查询
	
}
