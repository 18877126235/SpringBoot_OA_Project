package com.nnxy.ldq.services.chat;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.nnxy.ldq.mappers.ChatMsgMapper;
import com.nnxy.ldq.mappers.UserinfoMapper;
import com.nnxy.ldq.model.entity.chat.ChatMsg;
import com.nnxy.ldq.model.entity.chat.Userinfo;

import java.util.List;

@Service
public class UserinfoService {
	
    @Autowired
    UserinfoMapper chatMsgMapper;
    
    /*@Async
    public void InsertChatMsg(ChatMsg chatMsg){
        chatMsgMapper.InsertChatMsg(chatMsg);
    }*/
    //查询所有数据
    public List<Userinfo> selectAllUserinfo(){
    	return chatMsgMapper.selectAllUserinfo();
    }
    
    //根据id查询一条数据
    public Userinfo findbyid(String userid) {
    	return chatMsgMapper.findbyid(userid);
    }
    
    //插入新数据
    public void insertuserinfo(Userinfo userinfo) {
    	
    	chatMsgMapper.insertuserinfo(userinfo);
    	
    }
    
}
