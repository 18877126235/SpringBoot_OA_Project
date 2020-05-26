/**
 * 
 */
/**
 * @author 我很快
 *
 */
package com.nnxy.ldq.session;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.util.StringUtils;

import redis.clients.jedis.Jedis;


@WebListener //记得加上这个注解
public   class   SessionListener   implements   HttpSessionListener{

	private Jedis jedis = new Jedis();
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("session创建成功？？？？？？？？？？？？？？");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
		//Object attribute = se.getSession().getAttribute("userId");
		Long userid = Long.valueOf(se.getSession().getAttribute("userId") + "");
		
		System.out.println( "销毁前的获取"+userid );
		if(userid != null) {
			//从redis在线用户集合中移除
			jedis.srem("UserLists", userid+"");
		}
		
		
		
		
		// TODO Auto-generated method stub
		System.out.println("session成功销毁？？？？？？？？？？？？？？？？？？？");
		
	}   
	
} 