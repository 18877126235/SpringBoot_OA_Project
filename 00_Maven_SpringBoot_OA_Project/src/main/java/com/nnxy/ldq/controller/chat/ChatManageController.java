package com.nnxy.ldq.controller.chat;


import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.nnxy.ldq.common.formValid.BindingResultVOUtil;
import com.nnxy.ldq.common.formValid.ResultEnum;
import com.nnxy.ldq.common.formValid.ResultVO;
import com.nnxy.ldq.model.dao.discuss.CommentDao;
import com.nnxy.ldq.model.dao.discuss.DiscussDao;
import com.nnxy.ldq.model.dao.discuss.ReplyDao;
import com.nnxy.ldq.model.dao.discuss.VoteTitleListDao;
import com.nnxy.ldq.model.dao.discuss.VoteTitlesUserDao;
import com.nnxy.ldq.model.dao.system.TypeDao;
import com.nnxy.ldq.model.dao.user.UserDao;
import com.nnxy.ldq.model.entity.discuss.Discuss;
import com.nnxy.ldq.model.entity.discuss.VoteList;
import com.nnxy.ldq.model.entity.discuss.VoteTitles;
import com.nnxy.ldq.model.entity.system.SystemTypeList;
import com.nnxy.ldq.model.entity.user.User;
import com.nnxy.ldq.services.discuss.DiscussService;
import com.nnxy.ldq.services.discuss.ReplyService;
import com.nnxy.ldq.services.discuss.VoteService;

@Controller
@RequestMapping("/")
public class ChatManageController {
	
	@Autowired
	DiscussDao discussDao;
	@Autowired
	DiscussService disService;
	@Autowired
	UserDao uDao;
	@Autowired
	TypeDao typeDao;
	@Autowired
	ReplyDao replyDao;
	@Autowired
	ReplyService replyService;
	@Autowired
	CommentDao commentDao;
	@Autowired
	VoteService voteService;
	@Autowired
	VoteTitleListDao voteTitlesDao;
	@Autowired
	VoteTitlesUserDao voteUserDao;
	

	/**
	 * 讨论区超级管理员管理
	 * @return
	 */
	@RequestMapping("adminmanage")
	public String adminManage(@RequestParam(value="page",defaultValue="0") int page,HttpSession session,
			@SessionAttribute("userId") Long userId,Model model){
		Page<Discuss> page2=disService.paging(page, null, 1L,null,null,null,null);
		setPagintMess(model, page2,"/chattable","manage","超级管理员");
		session.removeAttribute("returnUrl");
		session.setAttribute("returnUrl", "adminmanage");
		return "chat/chatmanage";
	}
	
	/**
	 * 讨论区管理
	 * @return
	 */
	@RequestMapping("chatmanage")
	public String chatManage(@RequestParam(value="page",defaultValue="0") int page,
			@SessionAttribute("userId") Long userId,Model model,HttpSession session){
		Page<Discuss> page2=disService.pagingMe(page, null, userId,null,null,null);
		setPagintMess(model, page2,"/metable","manage","我的管理");
		model.addAttribute("me", "me");
		session.removeAttribute("returnUrl");
		session.setAttribute("returnUrl", "chatmanage");
		return "chat/chatmanage";
	}
	
	/**
	 * 讨论区列表
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping("chatlist")
	public String chatList(@RequestParam(value="page",defaultValue="0") int page,Model model,HttpSession session){
		Page<Discuss> page2=disService.paging(page, null, null,null,null,null,null);
		
		setPagintMess(model, page2,"/seetable",null,"讨论列表");
		
		session.removeAttribute("returnUrl");
		session.setAttribute("returnUrl", "chatlist");
		return "chat/chatmanage";
	}
	
	/**
	 * 删除讨论区
	 * 级联删除回复表和评论表中的相关信息
	 */
	@RequestMapping("deletediscuss")
	public String deletediscuss(HttpServletRequest req,@SessionAttribute("userId") Long userId){
		String name=req.getParameter("name");
		Long discussId=Long.parseLong(req.getParameter("discussId"));
		Integer page=Integer.parseInt(req.getParameter("page"));
		System.out.println("第几页："+page);
		Discuss discuss=discussDao.findOne(discussId);
		User user=uDao.findOne(userId);
		if(user.getSuperman()){
		}else{
			if(Objects.equals(discuss.getUser().getUserId(), user.getUserId())){
			}else{
				System.out.println("权限不匹配，不能删除");
				return "redirect:/notlimit";
			}
		}
		System.out.println("删除一个讨论区");
		disService.deleteDiscuss(discussId);
		if("超级管理员".equals(name)){
			return "forward:/adminmanage?page="+page;
		}else if("我的管理".equals(name)){
			return "forward:/chatmanage?page="+page;
		}else if("讨论列表".equals(name)){
			return "forward:/chatlist?page="+page;
		}else{
		}
		return "";
	}
	
	/*
	 * 这里是查找所有帖子？？
	 */
	private void setPagintMess(Model model, Page<Discuss> page2,String url,String manage,String name) {
		
		model.addAttribute("list",disService.packaging(page2.getContent()));
		
		model.addAttribute("page", page2);
		model.addAttribute("url", url);
		model.addAttribute("name", name);
		if(!StringUtils.isEmpty(manage)){
			model.addAttribute("manage", "manage");
		}
	}
	/**
	 * 超级管理员管理页面的controller，分页处理
	 * @return
	 */
	@RequestMapping("chattable")
	public String chatTable(@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="baseKey",required=false) String baseKey,
			@RequestParam(value="type",required=false) String type,
			@RequestParam(value="time",required=false) String time,
			@RequestParam(value="visitnum",required=false) String visitnum,
			@RequestParam(value="icon",required=false) String icon,
			@SessionAttribute("userId") Long userId,Model model){
		setSomething(baseKey, type, time, visitnum,  icon, model);
		Page<Discuss> page2=disService.paging(page, baseKey, 1L,type,time,visitnum,null);
		setPagintMess(model, page2,"/chattable","manage","超级管理员");
		return "chat/chattable";
	}
	
	/**
	 * 自己管理页面的controller，分页处理
	 * @return
	 */
	@RequestMapping("metable")
	public String meTable(@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="baseKey",required=false) String baseKey,
			@RequestParam(value="type",required=false) String type,
			@RequestParam(value="time",required=false) String time,
			@RequestParam(value="visitnum",required=false) String visitnum,
			@RequestParam(value="icon",required=false) String icon,
			@SessionAttribute("userId") Long userId,Model model){
		setSomething(baseKey, type, time, visitnum,  icon, model);
		Page<Discuss> page2=disService.pagingMe(page, baseKey, userId,type,time,visitnum);
		setPagintMess(model, page2,"/metable","manage","我的管理");
		return "chat/chattable";
	}
	
	/**
	 * 查看列表页面的controller，分页处理
	 * @return
	 */
	@RequestMapping("seetable")
	public String seeTable(@RequestParam(value="page",defaultValue="0") int page,
			@RequestParam(value="baseKey",required=false) String baseKey,
			@RequestParam(value="type",required=false) String type,
			@RequestParam(value="time",required=false) String time,
			@RequestParam(value="visitnum",required=false) String visitnum,
			@RequestParam(value="icon",required=false) String icon,
			@SessionAttribute("userId") Long userId,Model model){
		setSomething(baseKey, type, time, visitnum,  icon, model);
		//传过去的userid为null；
		Page<Discuss> page2=disService.paging(page, baseKey, null,type,time,visitnum,null);
		setPagintMess(model, page2,"/seetable",null,"讨论列表");
		return "chat/chattable";
	}
	
	//专门使用一个controller来重定向到查看界面，在这个controller中加访问数加1，这样就不会再刷新当前界面使得访问数+1
	@RequestMapping("seediscuss")
	public String seeDiscuss(@RequestParam(value="id") Long id,@RequestParam(value="pageNumber") Integer pageNumber,HttpSession session){
		//访问数量加一
		disService.addOneDiscuss(id);
		
		session.removeAttribute("id"); //原来的帖子id删除
		
		session.setAttribute("id", id);//设置新查看帖子
		//待定？？？
		session.setAttribute("pageNumber", pageNumber);
		//重定向到查看帖子页面
		return "redirect:/replymanage";
	}
	
	/**
	 * 查看讨论
	 * @return将要操作在界面有没有可✘掉的图标，需要有管理员权限；
	 */
	@RequestMapping("replymanage")
	public String replyManage(Model model,HttpSession session,
			@RequestParam(value="page",defaultValue="0") int page, //分页的吧
			@RequestParam(value="size",defaultValue="5") int size, //这个待定
			@SessionAttribute("userId") Long userId){ //获取当前用户id
		//获取当前要查看的帖子的id
		Long id=Long.parseLong(session.getAttribute("id")+"");
		User user=uDao.findOne(userId);
		Discuss discuss=discussDao.findOne(id); //获取当前帖子对象
		//用来处理vote相关的数据（处理投票的帖子）
		voteService.voteServiceHandle(model, user, discuss);
		
		if(user.getSuperman()){ //如果当前用户是超级管理员
			//信息提示
			model.addAttribute("manage", "具有管理权限");
			
		}else{//否则就是普通用户查看了
			//如果是自己的帖子，那也可以管理（放置一个manage标记  算了你的帖子你也不能管理）
//			if(Objects.equals(user.getUserId(), discuss.getUser().getUserId())){
//				model.addAttribute("manage", "具有管理权限"); //可以删除评论
//			}
			
		}
		
		
		
		//封装数据显示出来
		disService.setDiscussMess(model, id,userId,page,size);
		System.out.println(user.getUserName()+"明明经过这里了呀********************************************");
		model.addAttribute("user",user); //放置用户对象
		return "chat/replaymanage";
	}

	
	/**
	 * 编写讨论区
	 * @param req
	 * @return
	 */
	@RequestMapping("writechat")
	public String writeChat(HttpServletRequest req,@SessionAttribute(value="userId")Long userId,Model model){
		HttpSession session=req.getSession();
		session.removeAttribute("id");
		if(!StringUtils.isEmpty(req.getParameter("id"))){
			//修改界面的显示
			Long disId=Long.parseLong(req.getParameter("id"));
			Discuss discuss=discussDao.findOne(disId);
			//回填投票的信息
			if(!Objects.isNull(discuss.getVoteList())){
				model.addAttribute("voteList", discuss.getVoteList());
				List<VoteTitles> voteTitles=voteTitlesDao.findByVoteList(discuss.getVoteList());
				model.addAttribute("voteTitles", voteTitles);
			}
			//回填投票标题的信息
			session.setAttribute("id", disId);
			model.addAttribute("discuss", discuss);
			model.addAttribute("typeName", typeDao.findOne(discuss.getTypeId()).getTypeName());
		}
		if(!StringUtils.isEmpty(req.getAttribute("success"))){
			model.addAttribute("success", "成功了");
		}
		User user=uDao.findOne(userId);
		List<SystemTypeList> typeList=typeDao.findByTypeModel("chat");
		model.addAttribute("typeList", typeList);
		model.addAttribute("user", user);
		return "chat/writechat";
	}
	
	/**
	 * 新增+修改
	 */
	@RequestMapping("adddiscuss")
	public String addDiscuss(HttpServletRequest req, @Valid Discuss menu,VoteList voteList,  /*这个是啥*/BindingResult br){
		
		HttpSession session=req.getSession(); 
		Long userId=Long.parseLong(session.getAttribute("userId")+"");
		User user=uDao.findOne(userId);
		System.out.println(menu);
		ResultVO res = BindingResultVOUtil.hasErrors(br);
		// 校验失败
		if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) {
			System.out.println("输入信息有误！");
		}else{ //执行裂成
			//修改处理
			if(!StringUtils.isEmpty(session.getAttribute("id"))){ //如果是修改帖子过来的
				Long disId=Long.parseLong(session.getAttribute("id")+"");
				Discuss discuss=discussDao.findOne(disId);
				//在此处判断一下是哪种类型，投票又不一样；
				if(discuss.getTypeId()==21){
					VoteList vote=discuss.getVoteList();
					vote.setEndTime(voteList.getEndTime());
					voteService.savaVoteList(vote);
					System.out.println(discuss);
				}
				discuss.setModifyTime(new Date());
				discuss.setTitle(menu.getTitle());
				discuss.setContent(menu.getContent());
				disService.save(discuss);
				req.setAttribute("success", "成功了");
				System.out.println("成功了");
				return "forward:/chatmanage";
			}else{ //否则就是修发布的帖子过来的
			    //新增处理
				Long typeId=Long.parseLong(req.getParameter("typeId"));
				if(menu.getTypeId()==21){
					String[] title2=req.getParameterValues("votetitle");
					String[] colors=req.getParameterValues("votecolor");
					System.out.println(voteList);
					Set<VoteTitles> voteTitles=new HashSet<>();
					//处理投票标题
					for (int i = 0; i < colors.length; i++) {
						VoteTitles voteTitle=new VoteTitles();
						voteTitle.setColor(colors[i]);
						voteTitle.setTitle(title2[i]);
						voteTitle.setVoteList(voteList);
						voteTitles.add(voteTitle);
					}
					voteList.setVoteTitles(voteTitles);		//将所有投票表格保存到投票对象中
//					voteService.savaVoteList(voteList);		//将投票信息保存到投票表中
					menu.setVoteList(voteList);				//将投票对象保存到讨论表中；
					System.out.println("要开始进行投票处理了");
				}
				
				menu.setVisitNum(0);
				menu.setUser(user);
				menu.setCreateTime(new Date()); //设置时间
				disService.save(menu);
				req.setAttribute("success", "成功了");
				System.out.println("成功了");
				return "forward:/chatmanage";
			}
		}
		return null;
	}

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
