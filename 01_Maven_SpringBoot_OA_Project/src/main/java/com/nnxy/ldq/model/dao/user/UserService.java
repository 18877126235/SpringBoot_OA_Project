package com.nnxy.ldq.model.dao.user;

import javax.transaction.Transactional;

import com.nnxy.ldq.model.entity.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Transactional
@Service
public class UserService {

	@Autowired
	UserDao userDao;
	
	//找到该管理员下面的所有用户并且分页
	public Page<User> findmyemployuser(int page, String baseKey, long parentid) {
		
		Pageable pa=new  PageRequest(page, 10); //设置分页参数
		
		if (!StringUtils.isEmpty(baseKey)) { //如果包含查询关键字
			// 模糊查询
			return userDao.findbyFatherId(baseKey, parentid, pa);
		}
		else{
			
			return userDao.findByFatherId(parentid, pa);
			
		}
		
	}
}
