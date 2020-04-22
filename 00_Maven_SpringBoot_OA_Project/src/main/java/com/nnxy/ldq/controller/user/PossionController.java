package com.nnxy.ldq.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nnxy.ldq.model.dao.user.DeptDao;
import com.nnxy.ldq.model.dao.user.PositionDao;
import com.nnxy.ldq.model.entity.user.Dept;
import com.nnxy.ldq.model.entity.user.Position;

@Controller
@RequestMapping("/")
public class PossionController {
	
	@Autowired
	PositionDao pdao;
	@Autowired
	DeptDao ddao;
	
	@RequestMapping("positionmanage")
	public String positionmanage(Model model,HttpSession session) {
		
		
		if( session.getAttribute("success")!=null) {
			model.addAttribute("success", session.getAttribute("success"));
			session.removeAttribute("success");
		}
		
		List<Position> positions = (List<Position>) pdao.findAll();
		
		model.addAttribute("positions",positions);
		
		return "user/positionmanage";
	}
	
	@RequestMapping(value = "positionedit" ,method = RequestMethod.GET)
	public String positioneditget(@RequestParam(value = "positionid",required=false) Long positionid,Model model){
		if(positionid!=null){
			
			Position position = pdao.findOne(positionid);
			System.out.println(position);
			Dept dept = ddao.findOne(position.getDeptid());
			model.addAttribute("positiondept",dept);
			model.addAttribute("position",position);
		}
		List<Dept> depts = (List<Dept>) ddao.findAll();
		model.addAttribute("depts", depts);
		System.out.println("玩我十八然后皇太后");
		return "user/positionedit";
		//return "user/positionmanage";
	}
	
	@RequestMapping(value = "positionedit" ,method = RequestMethod.POST)
	public String positioneditpost(Position position,Model model,HttpSession session){
		System.out.println("你大爷啊啊啊啊:"+position);
		
		Position psition2 = pdao.save(position);
		
		if(psition2!=null){
			//model.addAttribute("success","操作成功");
			session.setAttribute("success","操作成功");
			//return "/positionmanage";
		}
		System.out.println("修好然后热火钛合金");
		//model.addAttribute("errormess","数据插入失败");
		//return "user/positionedit";
		return "redirect:/positionmanage";
	}
	
	
	@RequestMapping("removeposition")
	public String removeposition(@RequestParam("positionid") Long positionid,Model model){
		pdao.delete(positionid);
		model.addAttribute("success",1);
		return "/positionmanage";
	}
	
	
	
}
