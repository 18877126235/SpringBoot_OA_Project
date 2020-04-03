package com.nnxy.ldq.mappers;



import java.util.List;

import com.nnxy.ldq.model.entity.chat.ChatFriends;
import com.nnxy.ldq.model.entity.chat.Userinfo;

public interface ChatFriendsMapper {
    //查询所有的好友
    List<ChatFriends> LookUserAllFriends(String userid);
    //插入好友
    void InsertUserFriend(ChatFriends chatFriends);
    //判断是否加好友
    Integer JustTwoUserIsFriend(ChatFriends chatFriends);
    //查询用户的信息
    Userinfo LkUserinfoByUserid(String userid);
}