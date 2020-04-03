package com.nnxy.ldq.controller.user;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Controller;
//import org.springframework.test.annotation.Rollback;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.util.StringUtil;
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

import com.nnxy.ldq.model.dao.roledao.RoleDao;
import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.PositionDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.role.Role;
import com.nnxy.ldq.model.entity.user.Dept;
import com.nnxy.ldq.model.entity.user.Position;
import com.nnxy.ldq.model.entity.user.User;

@Controller
@RequestMapping("/")
public class UserController {
	
	@Autowired
	UserDao udao;
	@Autowired
	DeptDao ddao;
	@Autowired
	PositionDao pdao;
	@Autowired
	RoleDao rdao;
	
	@RequestMapping("userlogmanage")
	public String userlogmanage() {
		return "user/userlogmanage";
	}
	
	
	
	
	/*
	 * 点击关闭浏览器执行方法
	 */
	@RequestMapping("closeWindow")
	public void closeWindow() {
		
		System.out.println("我操你妈逼的哈哈哈哈哈/*//////////////////////*/////////////////////////////////");
		
	}
	
	
	/*
	 * 显示在线用户
	 */
	@RequestMapping("zaixianyonghu")
	public String zaixianyonghu(Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size, HttpServletRequest request
			) {
		
		//先获取
		
		Set<HttpSession> attribute =(Set<HttpSession>)request.getSession().getServletContext().getAttribute("sessionList"); //获取集合
		
		//System.out.println("被清空了呀："+attribute);
		
		List<User> users = new ArrayList<User>();
		//遍历试试看
		for (HttpSession httpSession : attribute) {
			if( httpSession != null ) {
				Object obj = httpSession.getAttribute("userId");
				
				if(obj == null) { //说明该用户已离线
					continue;
				}else {
					Long userId = Long.parseLong(httpSession.getAttribute("userId")+"");
					users.add(udao.findOne(userId)); //加入集合
				}	
			}
			
		}	
		

		
		/*Sort sort=new Sort(new Order(Direction.ASC,"dept")); //一个排序对象
		
		Pageable pa=new PageRequest(page, size,sort);

		Page<User> userspage = udao.findByIsLogin(pa);  //查询在线用户

		List<User> users = userspage.getContent();*/

		model.addAttribute("users",users);
		//model.addAttribute("page", userspage);
		//model.addAttribute("url", "usermanagepaging");
		return "user/usermanage_login";

		//return "847494979";
		
	}
	
	//上传头像
	/*
	 * 文件上传SpringMVC简单方式
	 */
	@RequestMapping(value="/fileUpload2")
	//MultipartFile upload就代表所上传的文件的对象
	public String fileUpload2( HttpServletRequest request,MultipartFile upload) throws Exception {
		System.out.println("文件上传MVC");
		//使用fileupload组件来上传文件
		//先指定文件的上传位置
		//String path = "static/image/";
		//判断该路径是否存在
		///E:\WEB-workPath\02_SpringBoot_OA_Project\src\main\webapp\
		String realPath = request.getSession().getServletContext().getRealPath("");
		String path = realPath.substring(0, realPath.indexOf("src")) +"static/image";
		
		//System.out.println(path);
		
		File file = new File(path);
		
		//System.out.println();
		
		if(!file.exists()) { //如果不存在
			
			System.out.println("文件不存在");
			//创建文件夹
			file.mkdirs();
		}
		//获取上传文件名
		String filename = upload.getOriginalFilename();
		//把文件名称设置成唯一值
		String uuid = UUID.randomUUID().toString().replace("-", "");
		filename = uuid+"_"+filename;
		//完成文件上传(传入参数:上传的目的路径，上传的文件名称)
		upload.transferTo(new File(path,filename));
		System.out.println("上传成功MVC");
		
	
		//删除原来的头像
		Long userId =  (Long) request.getSession().getAttribute("userId"); //获取当前用户id
		Long userid = userId;
		User user=udao.findOne(userid); //获取当前用户
		//System.out.println("当前用户头像:"+user.getImgPath());
		File file2 = new File(path+user.getImgPath());
		file2.delete(); //删除文件
		
		user.setImgPath(filename); //设置新的头像名称
		udao.save(user); //保存
		
		
	
		
		//String imageold =  ;
		
		//将文件路径放置域对象
		//String imagepath = "upload/" + filename;
		//System.out.println(imagepath);
		//request.getSession().setAttribute("imagepath", imagepath);
		
		
		
		return "redirect:/userpanel";
		//return "success";
		
	}
	
	
	
	@RequestMapping("usermanage")
	public String usermanage(Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size
			) {
		Sort sort=new Sort(new Order(Direction.ASC,"dept"));
		Pageable pa=new PageRequest(page, size,sort);
		Page<User> userspage = udao.findByIsLock(0, pa);
		List<User> users=userspage.getContent();
		model.addAttribute("users",users);
		model.addAttribute("page", userspage);
		model.addAttribute("url", "usermanagepaging");
		return "user/usermanage";
	}
	
	@RequestMapping("usermanagepaging")
	public String userPaging(Model model,@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="size",defaultValue="10") int size,
			@RequestParam(value="usersearch",required=false) String usersearch
			){
		Sort sort=new Sort(new Order(Direction.ASC,"dept"));
		Pageable pa=new PageRequest(page, size,sort);
		Page<User> userspage = null;
		if(StringUtil.isEmpty(usersearch)){
			userspage =  udao.findByIsLock(0, pa);
		}else{
			System.out.println(usersearch);
			userspage = udao.findnamelike(usersearch, pa);
		}
		List<User> users=userspage.getContent();
		model.addAttribute("users",users);
		model.addAttribute("page", userspage);
		model.addAttribute("url", "usermanagepaging");
		
		return "user/usermanagepaging";
	}
	
	//删除用户操作
	@RequestMapping(value="useredit",method = RequestMethod.GET)
	public String usereditget(@RequestParam(value = "userid",required=false) Long userid,Model model) {
		
		
		
		if(userid!=null){
			User user = udao.findOne(userid);
			model.addAttribute("where","xg");
			model.addAttribute("user",user);
		}
		
		List<Dept> depts = (List<Dept>) ddao.findAll();
		List<Position> positions = (List<Position>) pdao.findAll();
		List<Role> roles = (List<Role>) rdao.findAll();
		
		model.addAttribute("depts", depts);
		model.addAttribute("positions", positions);
		model.addAttribute("roles", roles);
		return "user/edituser";
	}
	
	@RequestMapping(value="useredit",method = RequestMethod.POST)
	public String usereditpost(User user,
			@RequestParam("deptid") Long deptid,
			@RequestParam("positionid") Long positionid,
			@RequestParam("roleid") Long roleid,
			@RequestParam(value = "isbackpassword",required=false) boolean isbackpassword,
			Model model) throws PinyinException {
		System.out.println(user);
		System.out.println(deptid);
		System.out.println(positionid);
		System.out.println(roleid);
		Dept dept = ddao.findOne(deptid);
		Position position = pdao.findOne(positionid);
		Role role = rdao.findOne(roleid);
		if(user.getUserId()==null){
			String pinyin=PinyinHelper.convertToPinyinString(user.getUserName(), "", PinyinFormat.WITHOUT_TONE);
			user.setPinyin(pinyin);
			user.setPassword("123456");
			user.setDept(dept);
			user.setRole(role);
			user.setPosition(position);
			user.setFatherId(dept.getDeptmanager());
			udao.save(user);
		}else{
			User user2 = udao.findOne(user.getUserId());
			user2.setUserTel(user.getUserTel());
			user2.setRealName(user.getRealName());
			user2.setEamil(user.getEamil());
			user2.setAddress(user.getAddress());
			user2.setUserEdu(user.getUserEdu());
			user2.setSchool(user.getSchool());
			user2.setIdCard(user.getIdCard());
			user2.setBank(user.getBank());
			user2.setThemeSkin(user.getThemeSkin());
			user2.setSalary(user.getSalary());
			user2.setFatherId(dept.getDeptmanager());
			if(isbackpassword){
				user2.setPassword("123456");
			}
			user2.setDept(dept);
			user2.setRole(role);
			user2.setPosition(position);
			udao.save(user2);
		}
		
		model.addAttribute("success",1);
		return "/usermanage";
	}
	
	/*
	 * 这是禁用用户
	 */
	@RequestMapping("deleteuser")
	public String deleteuser(@RequestParam("userid") Long userid,Model model){
		
		
		System.out.println("来了老弟哈哈哈哈*****************************************1");
		User user = udao.findOne(userid);
		
		user.setIsLock(1);//禁用
	
		udao.save(user);
		
		model.addAttribute("success",1);
	
		return "/usermanage";
		
	}
	
	/*
	 * 以下是删除用户
	 * 算了没意义的实现
	 */
	
	
	@RequestMapping("useronlyname")
    public @ResponseBody boolean useronlyname(@RequestParam("username") String username){
		System.out.println(username);
		User user = udao.findByUserName(username);
		System.out.println(user);
		if(user==null){
			return true;
		}
		return false;
    }
	
	@RequestMapping("selectdept")
	public @ResponseBody List<Position> selectdept(@RequestParam("selectdeptid") Long deptid){
		
		return pdao.findByDeptidAndNameNotLike(deptid, "%经理");
	}
	
	
	public static void main(String[] args) {
		
		File file = new File("static/test1");

		file.mkdirs();

	}

}
