package com.nnxy.ldq.common.Interceptor;

import com.nnxy.ldq.common.Tool;
import com.nnxy.ldq.model.dao.roledao.RolepowerlistDao;
import com.nnxy.ldq.model.dao.system.SystemMenuDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.dao.user.UserLogDao;
import com.nnxy.ldq.model.entity.role.Rolemenu;
import com.nnxy.ldq.model.entity.system.SystemMenu;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.model.entity.user.UserLog;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*
 *  经过该拦截器为获取当前登录登陆对象的属性
 */
@Component 
public class RecordInterceptor extends HandlerInterceptorAdapter{

	
	Tool tool;

	//最先执行的方法
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//System.out.println("都来这里吗？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？");
		HttpSession session=request.getSession(); //先判断是否处在登录状态
		//System.out.println("难道为空？？？？？"+session.getAttribute("userId")); //这王八蛋不见了null我去
		//System.out.println("难道为空真的去都没有了？？？？？"+session); //这家会还在哈哈哈哈哈
		if(!StringUtils.isEmpty(session.getAttribute("userId"))){ //判断是否空(不为空就进去)
		//导入用户dao类
		UserDao udao=tool.getBean(UserDao.class, request); //获取userDao
		//角色权限中间表dao（应该是通过这个对象获取权限所对应的全部功能）
		RolepowerlistDao rpdao=tool.getBean(RolepowerlistDao.class, request); 
		//获取用户id
		Long uid=Long.parseLong(session.getAttribute("userId")+""); 
		//查找登录的用户
		User user=udao.findOne(uid); 
		
		//获取当前用户所没有的父菜单（//找所有可显示的父菜单）
		List<Rolemenu> oneMenuAll=rpdao.findbyparentxianall(0L, user.getRole().getRoleId(), true,false);
//		for (Rolemenu rolemenu : oneMenuAll) {
//			System.out.println("父菜单："+rolemenu.getMenuUrl());
//		}
		//找所有当前用户的角色无法看到的子菜单
		List<Rolemenu> twoMenuAll=rpdao.findbyparentsxian(0L, user.getRole().getRoleId(), true,false);
//		for (Rolemenu rolemenu : twoMenuAll) {
//			System.out.println("子菜单："+rolemenu.getMenuUrl());
//		}
		List<Rolemenu>  all=new ArrayList<>();
		
		//获取当前访问的路径
		//String url = request.getRequestURL().toString();
		String usrl2 = request.getServletPath();
		//System.out.println("当前访问路径是哈哈哈："+url);
		//System.out.println("当前访问路径是哈哈哈："+usrl2);
		String zhuan="notlimit"; //弹出权限不足的访问路径

		if(oneMenuAll.size()>0){ //存在父菜单（除非实习生除外）
				all.addAll(oneMenuAll); //在集合里面又加入一个集合
		}
		if(twoMenuAll.size()>0){ //如果子菜单存在
			all.addAll(twoMenuAll); //子菜单赋值
		}
		
		//判断用户要访问的路径与上述的一样，
		for (Rolemenu rolemenu : all) { //当前访问的路径中有和某个菜单中的路径相同，然后放行
			//System.out.println("这里让我摸不着头脑了");
			if(!rolemenu.getMenuUrl().equals(usrl2)){
				//return true; //放行
				continue;
			}else{ //否则跳转到无权限页面
				request.getRequestDispatcher(zhuan).forward(request, response); //转发？？跳转页面？？
				//return false;
			}
			
		}
			
		}else{ //没有登录就滚
//			System.out.println("没有登录，滚开*******************************************************"
//					+ "\n**************************************************"
//					+ "\n**************************************");
			response.sendRedirect("/login");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

	//最后执行的方法,请求结束后页面加载完毕执行的方法（对于该方法有点懵逼，用来添加操作日志的）
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,  Object handler, Exception ex)
			throws Exception {
		HttpSession session=request.getSession();
		
		if(!StringUtils.isEmpty(session.getAttribute("userId"))){ //判断是否空(不为空就进去)
			//导入dao类
			UserDao userDao=tool.getBean(UserDao.class, request);
			
			SystemMenuDao systemMenuDao=tool.getBean(SystemMenuDao.class, request);
			
			//？？？？？？此处这个userLog的作用不懂
			UserLogDao userLogDao=tool.getBean(UserLogDao.class, request);
			
			UserLog uLog= new UserLog(); //创建日志对象
			//首先就获取ip
			InetAddress ia=null;
			ia=ia.getLocalHost();
			String ip=ia.getHostAddress();
			uLog.setIpAddr(ip); //设置ip？？
			//System.out.println(request.getRequestedSessionId());
			uLog.setUrl(request.getServletPath());
			uLog.setLogTime(new Date());
		
			//还没有登陆不能获取session
			
			//uLog.setUser(new User());
			uLog.setUser(userDao.findOne( Long.parseLong(session.getAttribute("userId")+"") ));
			
			//System.out.println("打印日志信息："+uLog);
			
			//从菜单表里面匹配
			List<SystemMenu> sMenus=(List<SystemMenu>) systemMenuDao.findAll(); //查找所有菜单
			for (SystemMenu systemMenu : sMenus) {
				//System.out.println(systemMenu.getMenuUrl()+"对比：" + request.getServletPath());
				if(systemMenu.getMenuUrl().equals(request.getServletPath())){ //有相同的
					//只有当该记录的路径不等于第一条的时候（也就是判断你上一条访问地址是否和当前的访问地址相同）
					//查询最新记录
					UserLog findByUserlaset = userLogDao.findByUserlaset(1l);
					if( findByUserlaset == null ) {
						uLog.setTitle(systemMenu.getMenuName());
						userLogDao.save(uLog);
					}else {
						if(!findByUserlaset.getUrl().equals(systemMenu.getMenuUrl())){
							uLog.setTitle(systemMenu.getMenuName());
							userLogDao.save(uLog); //保存新操作记录
						}
							
							
						}
					}
					
				}
			}
		}
	
}
