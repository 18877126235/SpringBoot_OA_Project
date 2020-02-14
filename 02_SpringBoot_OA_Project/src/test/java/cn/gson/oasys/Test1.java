package cn.gson.oasys;

import java.io.File;
import java.util.List;
import java.util.Map;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

import cn.gson.oasys.mappers.NoticeMapper;
import cn.gson.oasys.model.dao.attendcedao.AttendceService;
import cn.gson.oasys.model.dao.informdao.InformDao;
import cn.gson.oasys.model.dao.informdao.InformRelationDao;
import cn.gson.oasys.model.dao.processdao.NotepaperDao;
import cn.gson.oasys.model.dao.user.DeptDao;
import cn.gson.oasys.model.dao.user.PositionDao;
import cn.gson.oasys.model.dao.user.UserDao;
import cn.gson.oasys.model.dao.user.UserLogRecordDao;
import cn.gson.oasys.model.entity.notice.NoticeUserRelation;
import cn.gson.oasys.model.entity.notice.NoticesList;
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
	
	
	
	public static void main(String[] args) {
		test06();
	}

	public static void test06() {
		
		File file = new File("static/image/index");
		
		if( !file.exists() ) {
			System.out.println("哈哈哈哈哈");
			file.mkdirs();
		}
		System.out.println(file);
	}
	
	
	
}
