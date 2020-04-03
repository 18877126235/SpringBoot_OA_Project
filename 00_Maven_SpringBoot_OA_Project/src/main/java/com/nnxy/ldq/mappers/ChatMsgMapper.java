package com.nnxy.ldq.mappers;


import org.apache.ibatis.annotations.Param;

import com.nnxy.ldq.model.entity.chat.ChatMsg;

import java.util.List;

public interface ChatMsgMapper {
    //插入聊天记录
    void InsertChatMsg(ChatMsg chatMsg);
    //查询聊天记录
    List<ChatMsg>  LookTwoUserMsg(@Param("chatMsg") ChatMsg chatMsg);
}