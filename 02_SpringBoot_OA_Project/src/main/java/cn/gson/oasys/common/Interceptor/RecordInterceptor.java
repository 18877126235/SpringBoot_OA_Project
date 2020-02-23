package cn.gson.oasys.common.Interceptor;

import cn.gson.oasys.common.Tool;
import cn.gson.oasys.model.dao.roledao.RolepowerlistDao;
import cn.gson.oasys.model.dao.system.SystemMenuDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.dao.user.UserLogDao;
import cn.gson.oasys.model.entity.role.Rolemenu;
import cn.gson.oasys.model.entity.system.SystemMenu;
import cn.gson.oasys.model.entity.user.User;
import cn.gson.oasys.model.entity.user.UserLog;
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
		if(!StringUtils.isEmpty(session.getAttribute("userId"))){ //判断是否空(为空就进去)
		//导入用户dao类
		UserDao udao=tool.getBean(UserDao.class, request); //获取userDao
		//角色权限中间表dao（应该是通过这个对象获取权限所对应的全部功能）
		RolepowerlistDao rpdao=tool.getBean(RolepowerlistDao.class, request); 
		//获取用户id
		Long uid=Long.parseLong(session.getAttribute("userId")+""); 
		//查找登录的用户
		User user=udao.findOne(uid); 
		
		//获取当前用户的角色所拥有的父菜单（//找所有可显示的父菜单）
		List<Rolemenu> oneMenuAll=rpdao.findbyparentxianall(0L, user.getRole().getRoleId(), true,false);
		
		//找所有当前用户的角色所拥有的可显示的子菜单
		List<Rolemenu> twoMenuAll=rpdao.findbyparentsxian(0L, user.getRole().getRoleId(), true,false);
		
		List<Rolemenu>  all=new ArrayList<>();
		
		//获取当前访问的路径
		String url = request.getRequestURL().toString();
		
		//System.out.println("当前访问路径是："+url);
		
		String zhuan="notlimit"; //弹出权限不足
		
		
		if(oneMenuAll.size()>0){ //存在父菜单（除非实习生除外）
				all.addAll(oneMenuAll); //在集合里面又加入一个集合
		}
		if(twoMenuAll.size()>0){ //如果子菜单存在
			all.addAll(twoMenuAll); //子菜单赋值
		}
		
		//查看用户有无权限访问相对应的路径
		for (Rolemenu rolemenu : all) { //当前访问的路径中有和某个菜单中的路径相同，然后放行
			
			if(!rolemenu.getMenuUrl().equals(url)){
				return true; //放行
			}else{ //否则跳转到无权限页面
				request.getRequestDispatcher(zhuan).forward(request, response); //转发？？跳转页面？？
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

	//最后执行的方法（对于该方法有点懵逼）
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response,  Object handler, Exception ex)
			throws Exception {
		HttpSession session=request.getSession();
		//导入dao类
		UserDao userDao=tool.getBean(UserDao.class, request);
		
		SystemMenuDao systemMenuDao=tool.getBean(SystemMenuDao.class, request);
		
		//？？？？？？此处这个userLog的作用不懂
		UserLogDao userLogDao=tool.getBean(UserLogDao.class, request);
		
		UserLog uLog= new UserLog();
		//首先就获取ip
		InetAddress ia=null;
		ia=ia.getLocalHost();
		String ip=ia.getHostAddress();
		uLog.setIpAddr(ip); //设置ip？？
		//System.out.println(request.getRequestedSessionId());
		uLog.setUrl(request.getServletPath());
		uLog.setLogTime(new Date());
	
		//还没有登陆不能获取session
		
		uLog.setUser(new User());
//		uLog.setUser(userDao.findOne(1l));
		//从菜单表里面匹配
		List<SystemMenu> sMenus=(List<SystemMenu>) systemMenuDao.findAll();
		for (SystemMenu systemMenu : sMenus) {
			if(systemMenu.getMenuUrl().equals(request.getServletPath())){
				//只有当该记录的路径不等于第一条的时候
				if(!userLogDao.findByUserlaset(1l).getUrl().equals(systemMenu.getMenuUrl())){
				uLog.setTitle(systemMenu.getMenuName());
				//只要匹配到一个保存咯
				userLogDao.save(uLog);
				}
			}
		}
		
		
	}

}
