package cn.gson.oasys.services.discuss;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;

import cn.gson.oasys.model.dao.discuss.CommentDao;
import cn.gson.oasys.model.dao.discuss.DiscussDao;
import cn.gson.oasys.model.dao.discuss.ReplyDao;
import cn.gson.oasys.model.dao.system.TypeDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.entity.discuss.Comment;
import cn.gson.oasys.model.entity.discuss.Discuss;
import cn.gson.oasys.model.entity.discuss.Reply;
import cn.gson.oasys.model.entity.user.User;

@Service
@Transactional
public class DiscussService {
	@Autowired
	private DiscussDao discussDao;

	@Autowired
	private UserDao uDao;

	@Autowired
	private TypeDao typeDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ReplyDao replyDao;

	// 保存
	public Discuss save(Discuss d) {
		return discussDao.save(d);
	}
	
	//删除讨论区
	public void deleteDiscuss(Long discussId){
		discussDao.delete(discussId);
	}
	
	
	//查看，并将访问量+1
	public Discuss addOneDiscuss(Long id){
		Discuss discuss=discussDao.findOne(id);
		discuss.setVisitNum(discuss.getVisitNum()+1);
		return this.save(discuss);
	}
	

	// 分页处理 page分页参数
	public Page<Discuss> paging(int page, String baseKey, Long userId, String type, String time, String visitnum,Long typeid) {
		//？？不详 //设置查询规则 参数是用来设置排序的
		List<Order> orders = new ArrayList<>();
		//page是第几页，
		Pageable pa = setPageable(page, type, time, visitnum, orders); 
		
		if(StringUtils.isEmpty(userId)){ //如果用户id为空？？？
			if(typeid == null) {  //如果类型id为空
				if (!StringUtils.isEmpty(baseKey)) {
					System.out.println("查找关键字不为空");
					return discussDao.findByTitleLike("%"+baseKey+"%",pa);
				}
				System.out.println("userid是空的");
				//查询全部帖子
				//在这里改写，我暂时不要投票先，我只要帖子
				//return discussDao.findAll(pa); 
				return discussDao.findByVoteListIsNull(pa); 
				
				
				}else { //否则就是按照类型查找帖子
				System.out.println("按类型查找******************");
				return discussDao.findByTypeId(typeid,pa);
			}
			
		}else{ //如果用户id不为空
			User user=uDao.findOne(userId);
			if(user.getSuperman()){ //如果是超级管理员
				if (!StringUtils.isEmpty(baseKey)) {
					System.out.println("查找关键字不为空");
					return discussDao.findByTitleLike("%"+baseKey+"%",pa); //模糊查询  pa代表排序或者一些查询规则
				}
				System.out.println("是超级管理员");
				return discussDao.findAll(pa);
			}else{ //如果不是超级管理员
				if (!StringUtils.isEmpty(baseKey)) {
					System.out.println("查找关键字不为空");
					return discussDao.findByUserAndTitleLike(user,"%"+baseKey+"%",pa);
				}
				System.out.println("只能看自己的");
				//只是查看自己的
				return discussDao.findByUser(user, pa); //根据用户查找
			}
		}
	}
	
	/**
	 * 用户自己管理讨论区的分页
	 * @return
	 */
	public  Page<Discuss> pagingMe(int page, String baseKey, Long userId, String type, String time, String visitnum) {
		List<Order> orders = new ArrayList<>();
		Pageable pa = setPageable(page, type, time, visitnum, orders);
		User user=uDao.findOne(userId);
		if (!StringUtils.isEmpty(baseKey)) {
			System.out.println("查找关键字不为空");
			return discussDao.findByUserAndTitleLike(user,"%"+baseKey+"%",pa);
		}
		System.out.println("只能看自己的");
		return discussDao.findByUser(user, pa);
	}
	
	//这里注意排序规则在此设置
	private Pageable setPageable(int page, String type, String time, String visitnum, List<Order> orders) {
		
		int size=10; //每次查询几条数据
		
		/*if (!StringUtils.isEmpty(type)) { //不为空
			if ("1".equals(type)) {
				orders.add(new Order(Direction.ASC, "typeId"));
			} else {
				orders.add(new Order(Direction.DESC, "typeId"));
			}
		} else if (!StringUtils.isEmpty(time)) { //如果时间不为空
			if ("1".equals(time)) {
				orders.add(new Order(Direction.DESC, "modifyTime"));
			} else {
				orders.add(new Order(Direction.ASC, "modifyTime"));
			}
		} else if (!StringUtils.isEmpty(visitnum)) {
			if ("1".equals(visitnum)) {
				orders.add(new Order(Direction.DESC, "visitNum"));
			} else {
				orders.add(new Order(Direction.ASC, "visitNum"));
			}
		}else {
			orders.add(new Order(Direction.ASC, "typeId"));
			orders.add(new Order(Direction.DESC, "modifyTime"));
		}*/
		
		//统一设置为按照发布时间排序
		orders.add(new Order(Direction.DESC, "modifyTime"));
		
		//排序类
		Sort sort = new Sort(orders); //排序规则
		Pageable pa = new PageRequest(page, size, sort);
		return pa;
	}
	
	//用来显示信息
	public void setDiscussMess(Model model, Long num,Long userId,int page,int size){
		//继续调用
		discussHandle(model, num, userId, page, size,null,null);
		
	}
	//处理讨论区信息（封装显示数据）
	public void discussHandle(Model model, Long num, Long userId, int page, int size,Long selectType, Long selectSort) {
		Pageable pa; //分页规则对象
		Page<Reply> replyPage = null; //用于存储查询的回复结果集
		
		//如果想按照发布时间倒序排序
		/*if(!StringUtils.isEmpty(selectSort)&& selectSort == 1){
			pa=new PageRequest(page, size,new Sort(Direction.DESC,"replayTime")); //根据replayTime属性倒序排序
		}else{
			pa=new PageRequest(page, size,new Sort(Direction.ASC,"replayTime"));
		}*/
		pa=new PageRequest(page, size,new Sort(Direction.DESC,"replayTime"));
		
		
		//获取帖子对象
		Discuss discuss=discussDao.findOne(num);
		
		User user=uDao.findOne(userId);
		
		//判断集合中有没有自己当前用户对象
		Boolean discussContain=discuss.getUsers().contains(user);
		
		//获取点赞次数吗？？
		int discussLikeNum=discuss.getUsers().size();
		
		//获取set集合
		Set<User> setUsers=discuss.getUsers();
		
		model.addAttribute("discussContain", discussContain); //结果为true或者false
		model.addAttribute("discussLikeNum", discussLikeNum); //应该是点赞
		model.addAttribute("setUsers", setUsers); //这个是有哪些用户和这个帖子有关
		
		//这句是关键代码，从数据库拿到所有数据，也进行排序，只要在这进行判断
		if(!StringUtils.isEmpty(selectType)){
			
			User user2=uDao.findOne(selectType);
			
			replyPage=replyDao.findByDiscussAndUser(discuss, user2, pa);
			
		}else{ //空的
			//根据帖子id找到所有回复记录
			replyPage=replyDao.findByDiscuss(discuss,pa);				//根据讨论id找到所有的回复表
		}
		
		//又装到集合中干嘛
		List<Reply> replyCols=replyDao.findByDiscuss(discuss);
		//这又干嘛
		List<Reply> replyList=replyPage.getContent();	
		
		//对回复表字段进行封装，主要是为了获取到评论数
		List<Map<String, Object>> replys=this.replyPackaging(replyList,userId);		
		
		if(replyCols.size()>0){ //如果有人评论
			Long[] replyLong=new Long[replyCols.size()];//用数组来存储所有回复表的id
			for (int i = 0; i < replyCols.size(); i++) {
				replyLong[i]=replyCols.get(i).getReplyId();
			}						
			//in 查找所有回复id的所有评论（每一个评论下面又有回复）
			List<Comment> commentList=commentDao.findComments(replyLong);			
			
			//对评论字段进行封装
			List<Map<String, Object>> commentMap=this.commentPackaging(commentList);
			
			//放置域对象
			model.addAttribute("commentList", commentMap);
			
			int chatNum=commentList.size()+replyCols.size();
			
			model.addAttribute("chatNum", chatNum);
		}		
		
		model.addAttribute("replyList", replys); //当前帖子对应的回复集合
		model.addAttribute("discuss", discuss); //当前帖子对象
		model.addAttribute("page", replyPage); //这他妈用来干嘛的排序分页？？？
		model.addAttribute("user", discuss.getUser()); //帖子对应的用户
	}
	
	//根据讨论区获取到它的评论数（获取评论数目）
	private Integer getComments(Discuss discuss){
		int chatNum=0;
		//根据帖子对象去评论表中查找有多少条评论和帖子有关，该数量就是帖子的评论数
		List<Reply> replyCols=replyDao.findByDiscuss(discuss); 
		if(replyCols.size()>0){
			Long[] replyLong=new Long[replyCols.size()];							//用数组来结束所有回复表的id
			for (int i = 0; i < replyCols.size(); i++) {
				replyLong[i]=replyCols.get(i).getReplyId();
			}						
			List<Comment> commentList=commentDao.findComments(replyLong);			//in 查找所有回复id的所有评论
			chatNum=commentList.size()+replyCols.size();
		}
		return chatNum;
	}
	
	//对回复表进行封装（传过来的是帖子的所有回复信息，还有当前的用户id）
	public List<Map<String, Object>> replyPackaging(List<Reply> replyList,Long userId){
		User user=uDao.findOne(userId);
		
		List<Map<String, Object>> replyMap=new ArrayList<>();
		
		for(int i = 0; i < replyList.size(); i++) {
			
			Map<String, Object> result=new HashMap<>();
			//没有评论内容
			if(replyList.get(i)==null||replyList.get(i).getUsers()==null){
				System.out.println("当前帖子暂时没有评论哦***********************************************");
				result.put("contain", false);
				result.put("likenum", 0);
			}else{ //有评论
				System.out.println("帖子有评论/////////////////////////////////////////////////////////");
				result.put("contain", replyList.get(i).getUsers().contains(user)); //结果为true或者false
				result.put("likenum", replyList.get(i).getUsers().size()); //这个是点赞数量？？
				
			}
			
			result.put("count",commentDao.findByReply(replyList.get(i)).size()); //这里是你的这条评论有多少人回复你
			
			result.put("replyLikeUsers", replyList.get(i).getUsers()); //你的这条评论有多少人觉得很赞
			
			result.put("replyId",replyList.get(i).getReplyId()); //这条评论的数据库中的id
			//评论时间
			result.put("replayTime",replyList.get(i).getReplayTime());
			
			result.put("content",replyList.get(i).getContent()); //这是获取评论内容
			//获取评论的用户
			result.put("user",replyList.get(i).getUser());
			//获取对应的帖子对象
			result.put("discuss",replyList.get(i).getDiscuss());
			//放入map集合
			replyMap.add(result);
		}
		return replyMap;
	}
	
	//对评论表进行封装
	public List<Map<String, Object>> commentPackaging(List<Comment> commentList){
		List<Map<String, Object>> commentMap=new ArrayList<>();
		for (int i = 0; i < commentList.size(); i++) {
			Map<String, Object> map=new HashMap<>();
			map.put("commentId", commentList.get(i).getCommentId());
			map.put("comment", commentList.get(i).getComment());
			map.put("time", commentList.get(i).getTime());
			map.put("user", commentList.get(i).getUser());
			map.put("reply", commentList.get(i).getReply().getReplyId());
			commentMap.add(map);
		}
		return commentMap;
	}
	//封装帖子数据（点赞，评论等）
	public List<Map<String, Object>> packaging(List<Discuss> list) {
		List<Map<String, Object>> listMap = new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> result = new HashMap<>();
			result.put("id", list.get(i).getDiscussId());
			
			result.put("typeName", typeDao.findOne(list.get(i).getTypeId()).getTypeName()); //根据类型名称查找？？？
			
			result.put("userName", list.get(i).getUser().getUserName());
			//放置用户头像
			result.put("userimage", list.get(i).getUser().getImgPath()); 
			
			if(list.get(i).getUsers()==null){
				result.put("likeNum", 0);  //点赞
			}else{
				result.put("likeNum", list.get(i).getUsers().size()); //获取点赞集合大小
			}
			//设置评论数
			result.put("commentsNum",getComments(list.get(i)));
			result.put("title", list.get(i).getTitle());
			result.put("createTime", list.get(i).getCreateTime());
			result.put("visitNum", list.get(i).getVisitNum());
			result.put("typecolor", typeDao.findOne(list.get(i).getTypeId()).getTypeColor());
			listMap.add(result);
		}
		return listMap;
	}

}
