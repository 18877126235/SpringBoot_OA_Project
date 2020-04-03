package com.nnxy.ldq.services.chat;



import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.nnxy.ldq.mappers.LoginMapper;
import com.nnxy.ldq.model.entity.chat.Login;

@Service
public class LoginService {
    @Autowired
    LoginMapper loginMapper;
    public String justLogin(Login login){
        return loginMapper.justLogin(login);
    }
    public String lkUseridByUsername(String username){
        return loginMapper.lkUseridByUsername(username);
    }
}
