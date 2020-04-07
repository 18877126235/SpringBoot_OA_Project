package com.nnxy.ldq.services.chat;





import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nnxy.ldq.mappers.ChatFriendsMapper;
import com.nnxy.ldq.model.entity.chat.ChatFriends;
import com.nnxy.ldq.model.entity.chat.Userinfo;

@Service
public class ChatFriendsService {
	
	
    @Autowired
    ChatFriendsMapper chatFriendsMapper;
    
    public List<ChatFriends> LookUserAllFriends(String userid){
    	
        return chatFriendsMapper.LookUserAllFriends(userid);
        
    }
    public void InsertUserFriend(ChatFriends chatFriends){
        chatFriendsMapper.InsertUserFriend(chatFriends);
    }
    public Integer JustTwoUserIsFriend(ChatFriends chatFriends){
        return chatFriendsMapper.JustTwoUserIsFriend(chatFriends);
    }
    public Userinfo LkUserinfoByUserid(String userid){
        return chatFriendsMapper.LkUserinfoByUserid(userid);
    }
	public ChatFriends selectbyuseridandfuserid(ChatFriends chatf) {
		// TODO Auto-generated method stub
		return chatFriendsMapper.selectbyuseridandfuserid(chatf);
	}
    
    
}
