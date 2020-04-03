package com.nnxy.ldq.services.chat;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.nnxy.ldq.mappers.ChatMsgMapper;
import com.nnxy.ldq.model.entity.chat.ChatMsg;

import java.util.List;

@Service
public class ChatMsgService {
    @Autowired
    ChatMsgMapper chatMsgMapper;
    @Async
    public void InsertChatMsg(ChatMsg chatMsg){
        chatMsgMapper.InsertChatMsg(chatMsg);
    }
    public List<ChatMsg> LookTwoUserMsg(ChatMsg chatMsg){
        return chatMsgMapper.LookTwoUserMsg(chatMsg);
    }
}
