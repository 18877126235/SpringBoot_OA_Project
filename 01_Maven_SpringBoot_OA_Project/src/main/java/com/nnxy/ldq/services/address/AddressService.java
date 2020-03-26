package com.nnxy.ldq.services.address;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnxy.ldq.model.dao.address.AddressDao;
import com.nnxy.ldq.model.dao.notedao.AttachmentDao;
import com.nnxy.ldq.model.entity.note.Director;

@Service
@Transactional
public class AddressService {
	
	@Autowired
	private AddressDao addressDao;
	@Autowired
	AttachmentDao atDao;
	
	public Director sava(Director director){
		return addressDao.save(director);
	}
	public void deleteDirector(Director director){
		addressDao.delete(director);
		System.out.println("删除一个外部联系人");
	}
	
	public List<Map<String, Object>> fengzhaung(List<Map<String, Object>> addressList){
		List<Map<String, Object>> adds=new ArrayList<>();
		for (int i = 0; i < addressList.size(); i++) {
			Map<String, Object> result=new HashMap<>();
			result.put("director_users_id", addressList.get(i).get("director_users_id"));
			result.put("director_id", addressList.get(i).get("director_id"));
			result.put("user_id", addressList.get(i).get("user_id"));
			result.put("catelog_name", addressList.get(i).get("catelog_name"));
			result.put("companyname", addressList.get(i).get("companyname"));
			result.put("user_name", addressList.get(i).get("user_name"));
			result.put("sex", addressList.get(i).get("sex"));
			result.put("phone_number", addressList.get(i).get("phone_number"));
			result.put("email", addressList.get(i).get("email"));
//			!Objects.isNull(atDao.findOne(d.getAttachment()))
			if(addressList.get(i).get("attachment_id")!=null){
				//System.out.println("联系人头像路径："+atDao.findOne( Long.parseLong( (String) (addressList.get(i).get("attachment_id") ) )).getAttachmentPath());
				result.put("attachment", atDao.findOne( Long.parseLong(  String.valueOf(addressList.get(i).get("attachment_id"))   )).getAttachmentPath());
				//result.put("attachment", addressList.get(i).get("attachment") );
				
				
			}else{
				result.put("attachment", "/image/timg.jpg");
			}
			adds.add(result);
		}
		return adds;
	}

}
