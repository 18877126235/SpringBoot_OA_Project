package com.nnxy.ldq.mappers;

import java.util.List;

import com.nnxy.ldq.model.entity.chat.Login;
import com.nnxy.ldq.model.entity.chat.Userinfo;

public interface UserinfoMapper {
   
	public List<Userinfo> selectAllUserinfo();

	public Userinfo findbyid(String userid);
	
	public void insertuserinfo(Userinfo userinfo);
	
}
