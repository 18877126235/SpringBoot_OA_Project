/**
 * 
 */
/**
 * @author 我很快
 *
 */
package cn.gson.oasys.session;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.util.StringUtils;



public   class   SessionListener   implements   HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("session创建成功？？？？？？？？？？？？？？");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("session成功销毁？？？？？？？？？？？？？？？？？？？");
		
	}   
	
} 