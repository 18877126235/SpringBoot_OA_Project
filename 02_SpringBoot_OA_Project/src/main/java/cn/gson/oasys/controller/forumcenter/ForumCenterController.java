package cn.gson.oasys.controller.forumcenter;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.entity.discuss.Discuss;
import cn.gson.oasys.model.entity.user.User;
import cn.gson.oasys.services.discuss.DiscussService;

@Controller
public class ForumCenterController {

	@Autowired
	DiscussService disService;
	
	@Autowired
	private UserDao uDao;
	
	/*
	 * 论坛首页和根据类型访问显示
	 */
	@RequestMapping("ForumCenter")
	public String corumcenterindex(@RequestParam(value="page",defaultValue="0") int page,Model model,HttpSession session,
			HttpServletRequest request,
		String typeid ) //如果是按类型查找的话会携带参数
	{ 
		//System.out.println("进来了没******************"+typeid);
		
		//分页查找？？？ page是查找第几页
		Long typeId = null;
		if(typeid != null) { //如果传进来的类型id不为空
			
			typeId = Long.parseLong(typeid); //那就封装转换成Long类型
			//相关的类型下设置背景颜色
			request.setAttribute("typeid",typeId );
			
		}
		session.setAttribute("typeId", typeId);
		
		//默认是按类型排序嗯嗯
		Page<Discuss> page2=disService.paging(page, null, null,null,null,null, typeId); //类型id传过去，如果是从类型去的化就根据类型查询且分页
		
		for (Discuss discuss : page2) {
			System.out.println("打印类型id:"+discuss.getTypeId());
		}
		
		
		/*for (Discuss discuss : page2) {
			System.out.println("帖子内容"+discuss);
		}*/
		//封装查询数据
		setPagintMess(model, page2,"/seetable1",null,"讨论列表");
		session.removeAttribute("returnUrl");
		session.setAttribute("returnUrl", "ForumCenter");
		return "forumcenter/ForumCenter"; //返回显示论坛首页视图
	}
	
	
	/*
	 * 按类型查询全部帖子（比如工作）
	 */
	/*@RequestMapping("showbytype")
	public String showbytype(String typeid) {
		
		System.out.println("获取到了类型id："+typeid);
		
		return "redirect:ForumCenter";
		
	}*/
	
	
	/*
	 * 新建帖子 待续 //显示新建帖子页面
	 */
	@RequestMapping("new")
	public String newforumcenter() {
		return "forumcenter/new";
	}
	
	/*
	 * 发送新帖子
	 */
	@RequestMapping(value="newtiezi", method=RequestMethod.POST) //接收post请求
	public String newtiezi(HttpServletRequest request,HttpSession session) {
		
		Long userId=Long.parseLong(session.getAttribute("userId")+"");
		User user=uDao.findOne(userId);
		
		//System.out.println("执行成功*****************************"+userid);
		//根据id查找用户
		
		
		//System.out.println("打印用户名称："+user.getUserName());
		
		//获取表单请求参数
		String title = request.getParameter("title"); //标题
		String content = request.getParameter("content"); //正文
		Long typeId = Long.parseLong(request.getParameter("typeId")) ; //类型
		
		//System.out.println("请求参数获取："+title+content+tytle);
		
		Discuss tiezi = new Discuss(); //创建帖子对象
		tiezi.setUser(user); //设置用户
		tiezi.setTitle(title); //设置帖子标题
		tiezi.setTypeId(typeId); //设置是什么类型
		tiezi.setContent(content); //设置内容
		//接下来设置发布时间
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		//System.out.println(df.format(new java.util.Date()));// new Date()为获取当前系统时间
		tiezi.setCreateTime(new java.util.Date());
		
		tiezi.setVisitNum(0); //默认设置访问量为零
		
		System.out.println("打印当前系统时间:"+tiezi.getCreateTime());
		
		//接下来保存到数据库
		disService.save(tiezi);
		
		request.setAttribute("success", "操作成功"); //显示弹窗
		
		//使用转发
		return "forward:ForumCenter";
		
	}
	
	
	/*
	 * 这里是封装帖子集合数据
	 */
	private void setPagintMess(Model model, Page<Discuss> page2,String url,String manage,String name) {
		
		model.addAttribute("list",disService.packaging(page2.getContent()));
		
		model.addAttribute("page", page2);
		model.addAttribute("url", url);
		model.addAttribute("name", name);
		//根据mesege弹出相对应的提示框
		if(!StringUtils.isEmpty(manage)){ 
			model.addAttribute("manage", "manage");
		}
	}
	
	/**
	 * 查看列表页面的controller，分页处理
	 * @return
	 */
	@RequestMapping("seetable1")
	public String seeTable(@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="baseKey",required=false) String baseKey,
			@RequestParam(value="type",required=false) String type,
			@RequestParam(value="time",required=false) String time,
			@RequestParam(value="visitnum",required=false) String visitnum,
			@RequestParam(value="icon",required=false) String icon,
			@SessionAttribute("userId") Long userId,Model model,
			@SessionAttribute(value="typeId",required=false) Long typeid  //传入类型id，判断是不是在类型显示页面
			){
		
		
		
		
		System.out.println("分页执行*********************************"+typeid);
		
		setSomething(baseKey, type, time, visitnum,  icon, model);
		//传过去的userid为null；
		Page<Discuss> page2=disService.paging(page, baseKey, null,type,time,visitnum,typeid);
		setPagintMess(model, page2,"/seetable1",null,"讨论列表");
		//ajax请求响应，重新加载哪个页面
		return "forumcenter/ForumCentertable";
	}
	//设置分页属性
	private void setSomething(String baseKey, String type, String time, String visitnum,String icon,
			Model model) {
		if(!StringUtils.isEmpty(icon)){
			model.addAttribute("icon", icon);
			if(!StringUtils.isEmpty(type)){
				model.addAttribute("type", type);
				if("1".equals(type)){
					model.addAttribute("sort", "&type=1&icon="+icon);
				}else{
					model.addAttribute("sort", "&type=0&icon="+icon);
				}
			}
			if(!StringUtils.isEmpty(visitnum)){
				model.addAttribute("visitnum", visitnum);
				if("1".equals(visitnum)){
					model.addAttribute("sort", "&visitnum=1&icon="+icon);
				}else{
					model.addAttribute("sort", "&visitnum=0&icon="+icon);
				}
			}
			if(!StringUtils.isEmpty(time)){
				model.addAttribute("time", time);
				if("1".equals(time)){
					model.addAttribute("sort", "&time=1&icon="+icon);
				}else{
					model.addAttribute("sort", "&time=0&icon="+icon);
				}
			}
		}
		if(!StringUtils.isEmpty(baseKey)){
			model.addAttribute("baseKey", baseKey);
		}
	}
	
	
}
