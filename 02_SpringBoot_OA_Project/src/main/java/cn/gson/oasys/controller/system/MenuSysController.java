package cn.gson.oasys.controller.system;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.alibaba.fastjson.JSONArray;

import cn.gson.oasys.common.formValid.BindingResultVOUtil;
import cn.gson.oasys.common.formValid.MapToList;
import cn.gson.oasys.common.formValid.ResultEnum;
import cn.gson.oasys.common.formValid.ResultVO;
import cn.gson.oasys.model.dao.IndexDao;
import cn.gson.oasys.model.dao.roledao.RoleDao;
import cn.gson.oasys.model.dao.roledao.RolepowerlistDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.entity.role.Role;
import cn.gson.oasys.model.entity.role.Rolepowerlist;
import cn.gson.oasys.model.entity.system.SystemMenu;
import cn.gson.oasys.model.entity.user.User;
import cn.gson.oasys.services.role.RoleService;
import cn.gson.oasys.services.system.MenuSysService;

@Controller
@RequestMapping("/")
public class MenuSysController {

	Logger log = LoggerFactory.getLogger(getClass());

	@Autowired
	private IndexDao iDao;
	@Autowired
	private MenuSysService menuService;
	@Autowired
	private UserDao uDao;
	@Autowired
	private RoleDao rdao;
	@Autowired
	private RolepowerlistDao rldao;
	@Autowired
	private RoleService roleService;

	/**
	 *  显示菜单管理界面
	 * @param req
	 * @return
	 */
	@RequestMapping("testsysmenu")
	public String testsysmenu(HttpServletRequest req) {
		menuService.findAllMenuSys(req);
		return "systemcontrol/menumanage";
	}
	
	/**
	 * 查找菜单
	 */
	@RequestMapping("menutable")
	public String menuTable(HttpServletRequest req){
		if(!StringUtils.isEmpty(req.getParameter("name"))){
			req.setAttribute("oneMenuAll", iDao.findByMenuNameLike("%"+req.getParameter("name")+"%"));
		}
		else{
			menuService.findAllMenuSys(req);
		}
		return "systemcontrol/menutable";
	}
	
	/**
	 * 改变排序
	 * @param req
	 * @return
	 */
	@RequestMapping("changeSortId")
	public String changeSortId(HttpServletRequest req,@SessionAttribute("userId")Long userId) {
		User user=uDao.findOne(userId);
		Long parentId = Long.parseLong(req.getParameter("parentid"));
		Long menuId = Long.parseLong(req.getParameter("menuid"));
		Integer sortId = Integer.parseInt(req.getParameter("sortid"));
		Integer arithNum = Integer.parseInt(req.getParameter("num"));
		log.info("parentId:{}", parentId);
		log.info("menuId:{}", menuId);
		log.info("sortId:{}", sortId);
		log.info("arithNum:{}", arithNum);
		if (arithNum == 1) {
			int a1 = menuService.changeSortId(sortId, arithNum, parentId);
			int a2 = menuService.changeSortId2(sortId, arithNum, menuId);
			log.info("a1：{}", a1);
			log.info("a2：{}", a2);
		} else {
			int a1 = menuService.changeSortId(sortId, arithNum, parentId);
			int a2 = menuService.changeSortId2(sortId, arithNum, menuId);
			log.info("a1：{}", a1);
			log.info("a2：{}", a2);
		}
		menuService.findMenuSys(req,user);
		return "redirect:/testsysmenu";
	}
	
	/**
	 * 菜单管理的编辑界面
	 * @param req
	 * @return //点击修改菜单显示视图
	 */
	@RequestMapping("menuedit")
	public String newpage(HttpServletRequest req) {
		
		//前台消息提示
		if(!StringUtils.isEmpty(req.getAttribute("errormess"))){ //错误信息不为空
			req.setAttribute("errormess", req.getAttribute("errormess"));
		}
		if(!StringUtils.isEmpty(req.getAttribute("success"))){ //正确信息不为空
			req.setAttribute("success", req.getAttribute("success"));
		}
		
		 //说明是新增或者添加或者修改子菜单
			
			//System.out.println("获取到了父菜单："+);
			
			//获取所有的父菜单
			List<SystemMenu> parentList=iDao.findByParentIdOrderBySortId(0L);
			
			//父菜单放置域对象
			req.setAttribute("parentList", parentList);
			
			HttpSession session = req.getSession();
			
			session.removeAttribute("getId"); //把原来放置的菜单id删除
			
			if (!StringUtils.isEmpty(req.getParameter("id"))) { //如果传递过来的菜单id不为空说明要修改
				
				Long getId = Long.parseLong(req.getParameter("id")); //获取要修改的菜单id
				SystemMenu menuObj = iDao.findOne(getId); //根据id查找菜单
				
				//判断要修改的是不是父菜单
				if( menuObj.getParentId() == 0l ) {
					//前台标记
					req.setAttribute("isfathermenu", "1");
				}
				
				//获取父菜单测试
				SystemMenu fatherMesu = iDao.findOne(menuObj.getParentId());
				
				
				//如果是添加菜单的
				if (!StringUtils.isEmpty(req.getParameter("add"))) { //如果是添加菜单？？？（这里设置了只针对添加子菜单）
					Long getAdd = menuObj.getMenuId();
					String getName=menuObj.getMenuName();
					req.setAttribute("getAdd", getAdd);
					req.setAttribute("getName", getName);
					log.info("getAdd:{}", getAdd);
				} else { //否则就是修改菜单
					session.setAttribute("getId", getId);
					log.info("getId:{}", getId);
					req.setAttribute("menuObj", menuObj); //当前菜单对象
					req.setAttribute("fatherMesu", fatherMesu);
				}
				
			}
			
		
		
		
		return "systemcontrol/menuedit";
	}
	
	
	/*
	 * 点击左上角的新增菜单操作
	 */
	@RequestMapping("addfatherorchild")
	public String addfatherorchild(HttpServletRequest request) {
	
		if( !StringUtils.isEmpty(request.getParameter("father")) ) {
			request.setAttribute("biaojishifou", '1');
		}else {
			
			//获取所有的父菜单
			List<SystemMenu> parentList=iDao.findByParentIdOrderBySortId(0L);
			//父菜单放置域对象
			request.setAttribute("parentList", parentList);
			request.setAttribute("biaojishifouzi", '1');
			
		}
		
		//request.setAttribute("isnewcaidan", "1"); //标记是新建菜单
		return "systemcontrol/menuedit_new";
	}
	
	
	
	
	
	/**
	 * 系统管理表单验证
	 * @param req
	 * @param menu
	 * @param br
	 * 后台校验表单数据，不通过则回填数据，显示错误信息；通过则直接执行业务，例如新增、编辑等；
	 * @return
	 */
	@RequestMapping("test111")
	public String testMess(HttpServletRequest req, @Valid SystemMenu menu, BindingResult br) {
		
		HttpSession session = req.getSession();
		
		Long menuId = null; //菜单id
		
		req.setAttribute("menuObj", menu); //放置菜单对象

		// 这里返回ResultVO对象，如果校验通过，ResultEnum.SUCCESS.getCode()返回的值为200；否则就是没有通过；
		ResultVO res = BindingResultVOUtil.hasErrors(br);
		
		//如果是从左上角添加来的
		if( req.getParameter("zuoshangjiaotianjia")!=null ) {
			
			//执行新增的代码（否则这是新增菜单执行）
			//menuService.save(menu);
			
			System.out.println("获取到了新增菜单：" + menu);
			
			//然后判断是新增父菜单还是子菜单
			if( menu.getMenuUrl() == null ) {
				//System.out.println("这是添加父菜单的呢");
				
				//然后设置父菜单为0
				menu.setParentId(0l);
				
				//设置连接地址为#
				menu.setMenuUrl("#");
				//保存
				menuService.save(menu);
				//设置只有超级管理员可见
				List<Role> roles=rdao.findAll();
				for (Role role : roles) {
					if(role.getRoleId()==1){
						roleService.sava(new Rolepowerlist(role, menu, true));
					}else{
						roleService.sava(new Rolepowerlist(role, menu, false));
					}
				}
				req.setAttribute("success", "操作成功");
			}else { //否则是子菜单
				System.out.println("这是添加子菜单的呢");
				
				//直接保存
				menuService.save(menu);
				
				//System.out.println("查看父级菜单："+menu.getParentId());
				
				//设置也只有超级管理员可见
				List<Role> roles=rdao.findAll();
				for (Role role : roles) {
					if(role.getRoleId()==1){
						roleService.sava(new Rolepowerlist(role, menu, true));
					}else{
						roleService.sava(new Rolepowerlist(role, menu, false));
					}
				}
				req.setAttribute("success", "操作成功");
			}
			
		
			
		}else {
			// 校验失败
			if (!ResultEnum.SUCCESS.getCode().equals(res.getCode())) {
				List<Object> list = new MapToList<>().mapToList(res.getData());
				req.setAttribute("errormess", list.get(0).toString());
				// 代码调试阶段，下面是错误的相关信息；
				System.out.println("list错误的实体类信息：" + menu);
				System.out.println("list错误详情:" + list);
				System.out.println("list错误第一条:" + list.get(0));
				System.out.println("啊啊啊错误的信息——：" + list.get(0).toString());
				// 下面的info信息是打印出详细的信息
				log.info("getData:{}", res.getData());
				log.info("getCode:{}", res.getCode());
				log.info("getMsg:{}", res.getMsg());
			}
			// 校验通过，下面写自己的逻辑业务
			else {
				// 判断是否从编辑界面进来的，前面有"session.setAttribute("getId",getId);",在这里获取，并remove掉；（说明是修改菜单）
				if (!StringUtils.isEmpty(session.getAttribute("getId"))) {
					menuId = (Long)session.getAttribute("getId"); // 获取进入编辑界面的menuID值
					menu.setMenuId(menuId); //设置你要修改的菜单id
					log.info("getId:{}", session.getAttribute("getId")); //日志
					session.removeAttribute("getId");
					
					System.out.println("执行修改菜单了："+menu.getMenuName());
					
					menuService.save(menu); //保存修改
				}else{ //否则执行新增菜单逻辑
					
					//执行新增的代码（否则这是新增菜单执行）
					menuService.save(menu);
					System.out.println("获取到了新增菜单：" + menu);
					//设置只有超级管理员才可以看见
					List<Role> roles=rdao.findAll();
					for (Role role : roles) {
						if(role.getRoleId()==1){
							roleService.sava(new Rolepowerlist(role, menu, true));
						}else{
							roleService.sava(new Rolepowerlist(role, menu, false));
						}
					}
					
				}
				//执行业务代码
				
				
				req.setAttribute("success", "操作成功");
			}
		}
		
		
		

		return "forward:/menuedit"; //返回去，弹出操作成功，点击确定后回到菜单管理界面
	}
	
	/**
	 * 菜单管理的删除
	 * @return
	 */
	@RequestMapping("deletethis")
	public String delete(HttpServletRequest req){
		Long menuId=Long.parseLong(req.getParameter("id"));
		int i=menuService.deleteThis(menuId);
		log.info("{}:i=",i);
		return "forward:/testsysmenu";
	}

}
