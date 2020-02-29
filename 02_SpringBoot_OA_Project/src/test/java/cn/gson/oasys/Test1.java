package cn.gson.oasys;

import java.io.File;
import java.util.List;
import java.util.Map;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

import cn.gson.oasys.mappers.NoticeMapper;
import cn.gson.oasys.model.dao.attendcedao.AttendceService;
import cn.gson.oasys.model.dao.discuss.DiscussDao;
import cn.gson.oasys.model.dao.informdao.InformDao;
import cn.gson.oasys.model.dao.informdao.InformRelationDao;
import cn.gson.oasys.model.dao.processdao.NotepaperDao;
import cn.gson.oasys.model.dao.roledao.RolepowerlistDao;
import cn.gson.oasys.model.dao.system.SystemMenuDao;
import cn.gson.oasys.model.dao.user.DeptDao;
import cn.gson.oasys.model.dao.user.PositionDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.dao.user.UserLogRecordDao;
import cn.gson.oasys.model.entity.discuss.Discuss;
import cn.gson.oasys.model.entity.notice.NoticeUserRelation;
import cn.gson.oasys.model.entity.notice.NoticesList;
import cn.gson.oasys.model.entity.role.Rolepowerlist;
import cn.gson.oasys.model.entity.system.SystemMenu;
import cn.gson.oasys.model.entity.user.Dept;
import cn.gson.oasys.model.entity.user.LoginRecord;
import cn.gson.oasys.model.entity.user.Position;
import cn.gson.oasys.model.entity.user.User;
import cn.gson.oasys.services.inform.InformRelationService;
import cn.gson.oasys.services.inform.InformService;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Test1 {
	@Autowired
	private NotepaperDao notepaperDao;
	
	@Autowired
	private NoticeMapper nm;
	
	@Autowired
	AttendceService attendceService;
	@Autowired
	UserDao uDao;

	@Test
	public void test(){
		PageHelper .startPage(0, 10);
		List<Map<String, Object>> list=nm.findMyNotice(1L);
		PageInfo<Map<String, Object>> info=new PageInfo<Map<String, Object>>(list);
		System.out.println(info);
	}
	
	@Test
	public void test2(){
		String str="罗祥";
		try {
			System.out.println(PinyinHelper.convertToPinyinString(str, "",PinyinFormat.WITH_TONE_MARK));
			System.out.println(PinyinHelper.convertToPinyinString(str, "",PinyinFormat.WITH_TONE_NUMBER));
			System.out.println(PinyinHelper.convertToPinyinString(str, "",PinyinFormat.WITHOUT_TONE));
			System.out.println(PinyinHelper.getShortPinyin(str));
		} catch (PinyinException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Autowired
	private UserDao userDao; //查询所有用户试试看
	
	@Autowired
	private PositionDao positionDao; 
	
	@Autowired
	private DeptDao deptDao;
	
	//妈的没有注入，怪不得空指针异常
	@Autowired
	private InformRelationService informrelationservice;
	
	@Autowired
	private InformRelationDao informRelationDao;
	
	@Autowired
	private UserLogRecordDao userLogRecordDao;
	
	@Autowired
	private InformDao informDao ;
	
	@Test
	public void test03() {
		
//		Iterable<NoticeUserRelation> findAll = informRelationDao.findAll();
//		for (NoticeUserRelation noticeUserRelation : findAll) {
//			
//			System.out.println(noticeUserRelation);
//			
//		}
		/*User user = userDao.findOne(1l);
		
		List<NoticeUserRelation> findByUserId = informRelationDao.findByUserId(user);
		
		for (NoticeUserRelation noticeUserRelation : findByUserId) {
			//System.out.println(noticeUserRelation);
			
			
			
		}*/
		
		//试试多条件cha'xu
		
		User user = userDao.findOne(1l);
		NoticesList findOne = informDao.findOne(55l);
		
		NoticeUserRelation findByUserIdAndNoticeId = informRelationDao.findByUserIdAndNoticeId(user,findOne );
		
		findByUserIdAndNoticeId.setRead(true);
		
		System.out.println(findByUserIdAndNoticeId);
		
	}
	
	/*
	 * 测试根据公告标题来查找公告
	 */
	@Autowired
	private InformService informService;
	@Test
	public void testnotice() {
		//informService.deleteOne(noticeId);
		
		System.out.println("来了哦哈哈哈哈");
		
		
//		NoticesList findByNoticeTitle = informDao.findByNoticeTitle("伊丽莎白的公告");
//		
//		System.out.println(findByNoticeTitle);
		
	}
	
	
	@Test
	public void test05() {
		
		String path = "static/";
		
		File file = new File(path);
		
		if( !file.exists() ) {
			System.out.println("哈哈哈哈哈");
			file.mkdirs();
		}
		
		System.out.println(file);
		
	}
	
	@Autowired  //数据库操作对象
	private RolepowerlistDao rolepowerlistDao;
	
	private SystemMenuDao systemMenuDao; //菜单实体类操作对象
	
	
	
	//测试删除角色和菜单中间表数据
	//开启事务
	
	@Test
	@Transactional
	@Rollback(false)
	public void test06() {
		
//		List<Rolepowerlist> findAll = rolepowerlistDao.findAll();
//		
//		for (Rolepowerlist rolepowerlist : findAll) {
//			
//			System.out.println(rolepowerlist.getMenuId());
//			
//		}
		
		/*List<Rolepowerlist> findByMesuId = rolepowerlistDao.findByMesuId(76l);
		System.out.println(findByMesuId);*/
	
		//SystemMenu menu = systemMenuDao.findOne(76l);
		
		SystemMenu menu = new SystemMenu();
		
		menu.setMenuId(82l);
		
		//System.out.println(menu);
		
		List<Rolepowerlist> findByMenuId = rolepowerlistDao.findByMenuId(menu);
		
		for (Rolepowerlist rolepowerlist : findByMenuId) {
			
			rolepowerlistDao.delete(rolepowerlist.getPkId()); //删除掉中间表这条数据
			//System.out.println(rolepowerlist.getPkId());
		}
		
		

	}
	
	
	
	//查询访问数量最多的5条论坛帖子
	
	@Autowired
	private DiscussDao discussDao; //直接去数据库找了
	@Test  //别他妈忘记加上注解呀
	public void test07() {
		
		
		
		//查询全部测试
		List<Discuss> findAll = discussDao.selectfiveremen();

		for (Discuss discuss : findAll) {
			
			System.out.println(discuss);
			
		}
		
	}
	
	
}
