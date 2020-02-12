package cn.gson.oasys.model.dao.user;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import cn.gson.oasys.model.entity.user.LoginRecord;
import cn.gson.oasys.model.entity.user.UserLog;

@Transactional
@Service
public class UserLogRecordService {
	
	@Autowired
	UserLogRecordDao userLogRecordDao;
	
	public Page<LoginRecord> ulogpaging(int page,String basekey,Long userid,Object time) {
		Pageable  pa=new PageRequest(page, 15);
		if(!StringUtils.isEmpty(basekey)){
			
			//System.out.println("来到这里了哈哈哈哈4");
			//模糊
			return userLogRecordDao.findbasekey(userid, basekey, pa);
		}//0为降序 1为升序
		if(!StringUtils.isEmpty(time)){
			if(time.toString().equals("0")) {	
				return userLogRecordDao.findByUserOrderBylogTimeDesc( pa);
			}	
			if(time.toString().equals("1")) {
				
				return userLogRecordDao.findByUserOrderBylogTimeAsc(userid, pa);
			}
				
		}else{
			
			System.out.println("妈的智障*********************************");
			return userLogRecordDao.findByUserOrderBylogTimeDesc( pa);
		}
		return null;
		
	}
}
