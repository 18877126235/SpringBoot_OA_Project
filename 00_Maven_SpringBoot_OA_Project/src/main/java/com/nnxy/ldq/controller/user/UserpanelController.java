package com.nnxy.ldq.controller.user;

import com.nnxy.ldq.common.formValid.BindingResultVOUtil;
import com.nnxy.ldq.common.formValid.MapToList;
import com.nnxy.ldq.common.formValid.ResultEnum;
import com.nnxy.ldq.common.formValid.ResultVO;
import com.nnxy.ldq.model.dao.informdao.InformRelationDao;
import com.nnxy.ldq.model.dao.maildao.MailreciverDao;
import com.nnxy.ldq.model.dao.processdao.NotepaperDao;
import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.PositionDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.mail.Mailreciver;
import com.nnxy.ldq.model.entity.notice.NoticeUserRelation;
import com.nnxy.ldq.model.entity.process.Notepaper;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.services.user.NotepaperService;
import com.github.pagehelper.util.StringUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.PostConstruct;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class UserpanelController {
	@Autowired
	private UserDao udao;
	
	@Autowired
	private DeptDao ddao;
	@Autowired
	private PositionDao pdao;
	@Autowired
	private InformRelationDao irdao;
	@Autowired
	private MailreciverDao mdao;
	@Autowired
	private NotepaperDao ndao;
	@Autowired
	private NotepaperService nservice;
	
//	@Value("${img.rootpath}")
	private String rootpath;

	@PostConstruct
	public void UserpanelController(){
		try {
			rootpath= ResourceUtils.getURL("classpath:").getPath().replace("/target/classes/","/static/");
			System.out.println(rootpath);

		}catch (IOException e){
			System.out.println("获取项目路径异常");
		}
	}
	
	/*
	 * 点击用户面板
	 */
	@RequestMapping("userpanel")
	public String index(@SessionAttribute("userId") Long userId,Model model,HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size){
		
		Pageable pa=new PageRequest(page, size);
		User user=null;
		if(!StringUtil.isEmpty((String) req.getAttribute("errormess"))){
			 user=(User) req.getAttribute("users");
			 req.setAttribute("errormess",req.getAttribute("errormess"));
		}
		else if(!StringUtil.isEmpty((String) req.getAttribute("success"))){
			user=(User) req.getAttribute("users"); 
			req.setAttribute("success","fds");
		}
		else{
			//找到这个用户
			user=udao.findOne(userId);
		}
		
		//找到部门名称
		String deptname=ddao.findname(user.getDept().getDeptId());
		
		//找到职位名称
		String positionname=pdao.findById(user.getPosition().getId());
		
		//找未读通知消息
		List<NoticeUserRelation> noticelist=irdao.findByReadAndUserId(false, user);
		
		//找未读邮件
		List<Mailreciver> maillist=mdao.findByReadAndDelAndReciverId(false,false, user);
		
		//找便签
		Page<Notepaper> list=ndao.findByUserIdOrderByCreateTimeDesc(user,pa);
		
		List<Notepaper> notepaperlist=list.getContent();
		
		model.addAttribute("user", user);
		model.addAttribute("deptname", deptname);
		model.addAttribute("positionname", positionname);
		model.addAttribute("noticelist", noticelist.size());
		model.addAttribute("maillist", maillist.size());
		model.addAttribute("notepaperlist", notepaperlist);
		model.addAttribute("page", list);
		model.addAttribute("url", "panel");
		
	
		return "user/userpanel";
	}
	/**
	 * 上下页
	 */
	@RequestMapping("panel")
	public String index(@SessionAttribute("userId") Long userId,Model model,
			@RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "size", defaultValue = "10") int size){
		Pageable pa=new PageRequest(page, size);
		User user=udao.findOne(userId);
		//找便签
		Page<Notepaper> list=ndao.findByUserIdOrderByCreateTimeDesc(user,pa);
		List<Notepaper> notepaperlist=list.getContent();
		model.addAttribute("notepaperlist", notepaperlist);
		model.addAttribute("page", list);
		model.addAttribute("url", "panel");
		return "user/panel";
	}
	/**
	 * 存便签
	 */
	@RequestMapping("writep")
	public String savepaper(Notepaper npaper,@SessionAttribute("userId") Long userId,@RequestParam(value="concent",required=false)String concent){
		User user=udao.findOne(userId);
		npaper.setCreateTime(new Date());
		npaper.setUserId(user);
		System.out.println("内容"+npaper.getConcent());
		if(npaper.getTitle()==null|| npaper.getTitle().equals(""))
			npaper.setTitle("无标题");
		if(npaper.getConcent()==null|| npaper.getConcent().equals(""))
			npaper.setConcent(concent);
		ndao.save(npaper);
		
		return "redirect:/userpanel";
	}
	/**
	 * 删除便签 修改为ajax方式删除
	 */
	/*@RequestMapping("notepaper")
	public String deletepaper(HttpServletRequest request,@SessionAttribute("userId") Long userId){
		User user=udao.findOne(userId);
		String paperid=request.getParameter("id");
		Long lpid = Long.parseLong(paperid);
		Notepaper note=ndao.findOne(lpid);
		if(user.getUserId().equals(note.getUserId().getUserId())){
			nservice.delete(lpid);
		}else{
			System.out.println("权限不匹配，不能删除");
			return "redirect:/notlimit";
		}
		return "redirect:/userpanel";
		
	}*/
	/*
	 * ajax方式删除便签
	 */
	@ResponseBody
	@RequestMapping("notepaper")
	public String deletepaper(HttpServletRequest request,@SessionAttribute("userId") Long userId){
		
		User user=udao.findOne(userId);
		String paperid=request.getParameter("noteid");
		
		//System.out.println("获取便签id测试看看："+paperid);
		
		Long lpid = Long.parseLong(paperid);
		Notepaper note=ndao.findOne(lpid);
		if(user.getUserId().equals(note.getUserId().getUserId())){
			nservice.delete(lpid);
		}else{
			System.out.println("权限不匹配，不能删除");
			return "error";
		}
		return "success";
		
	}
	
	/**
	 * 修改用户
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("saveuser")
	public String saveemp(/*@RequestParam("filePath")MultipartFile filePath,*/HttpServletRequest request,@Valid User user,
			BindingResult br,@SessionAttribute("userId") Long userId) throws IllegalStateException, IOException{
		
		//String imgpath=nservice.upload(filePath);
		
		User users=udao.findOne(userId);
		
		//重新set用户
		users.setRealName(user.getRealName());
		users.setUserTel(user.getUserTel());
		users.setEamil(user.getEamil());
		users.setAddress(user.getAddress());
		users.setUserEdu(user.getUserEdu());
		users.setSchool(user.getSchool());
		users.setIdCard(user.getIdCard());
		users.setBank(user.getBank());
		users.setSex(user.getSex());
		users.setThemeSkin(user.getThemeSkin());
		users.setBirth(user.getBirth());
		if(!StringUtil.isEmpty(user.getUserSign())){
			users.setUserSign(user.getUserSign());
		}
		if(!StringUtil.isEmpty(user.getPassword())){
			users.setPassword(user.getPassword());
		}
		/*if(!StringUtil.isEmpty(imgpath)){
			users.setImgPath(imgpath);
			
		}*/
		
		request.setAttribute("users", users);
		
		ResultVO res = BindingResultVOUtil.hasErrors(br);
		if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) {
			List<Object> list = new MapToList<>().mapToList(res.getData());
			request.setAttribute("errormess", list.get(0).toString());
			
			System.out.println("list错误的实体类信息：" + user);
			System.out.println("list错误详情:" + list);
			System.out.println("list错误第一条:" + list.get(0));
			System.out.println("啊啊啊错误的信息——：" + list.get(0).toString());
			
		}else{
			udao.save(users);
			request.setAttribute("success", "执行成功！");
		}
		return "forward:/userpanel";
		
	}

	//当用户访问static/image/**下的资源
	@RequestMapping({"image/**","attachment/**","file/**"})
	public void image(Model model, HttpServletResponse response, @SessionAttribute("userId") Long userId, HttpServletRequest request)
			throws Exception {
		//System.out.println("可以访问*******************");
		String projectPath = ClassUtils.getDefaultClassLoader().getResource("").getPath();
		
		//   /E:/WEB-workPath/02_SpringBoot_OA_Project/target/classes/
		//System.out.println("王八蛋终于找到你了:"+projectPath);
		
//	    /image/刘大庆/fe6cc4fa36a64bf8bcbe578fad23a1fd_QQ图片20190317202325.jpg
		String startpath = new String(URLDecoder.decode(request.getRequestURI(), "utf-8")); //设置编码
		//System.out.println("你特么又来干嘛:"+startpath);
		
		
		//  /刘大庆/fe6cc4fa36a64bf8bcbe578fad23a1fd_QQ图片20190317202325.jpg
		String path =   startpath;    //startpath.replace("", "");
		//System.out.println("这个家会很复杂："+path);
		
		File f = new File(rootpath, path);
		
		//    E:\WEB-workPath\02_SpringBoot_OA_Project\static\image\刘大庆\fe6cc4fa36a64bf8bcbe578fad23a1fd_QQ图片20190317202325.jpg
		//System.out.println("最终的访问路径吗："+f);
		
		ServletOutputStream sos = response.getOutputStream();
		
		//System.out.println("这个fgetpath是干嘛的:"+f.getPath());
		FileInputStream input = new FileInputStream(f.getPath()); ///////???????????
		byte[] data = new byte[(int) f.length()];
		IOUtils.readFully(input, data);
		// 将文件流输出到浏览器
		IOUtils.write(data, sos);
		input.close();
		sos.close();
	}

}
