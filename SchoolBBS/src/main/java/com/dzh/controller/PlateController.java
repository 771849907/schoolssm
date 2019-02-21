package com.dzh.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dzh.bean.Plate;
import com.dzh.service.PlateService;

@Controller
@RequestMapping("/plateController")
/*
 * 通过给Controller类添加@SessionAttributes注解，该注解的name和value属性值都是Model的key值，
 * 意思是指Model中这些key对应的数据也会存到HttpSession，不仅仅存到HttpServletRequest对象中！
 * 这样页面可以共享HttpSession中存的数据了！
 */
@SessionAttributes(value={"plate","plateEdit"}, types={String.class})
public class PlateController {

	@Autowired
	PlateService plateService;
	
	/**
	 * 查询板块信息（无条件）
	 * @param map
	 */
	@RequestMapping("/getPlate")
	public void getPlate(Map<Object, Object> map) {
		
		List<Plate> plate=plateService.getPlate();
		
		map.put("plate", plate);
		
		System.out.println(plate);
	}
	
	/**
	 * 添加板块信息
	 * @param plate
	 * @return
	 */
	@RequestMapping("/setPlate")
	@ResponseBody
	public String setPlate(Map<Object, Object> map,HttpServletRequest request) {
		
		Plate plate_add=new Plate();
		//不知为何，Plate plate_add获取的值永远不是提交过来的结果，所以使用request.getParameter("bname")来获取
		plate_add.setBname(request.getParameter("bname"));
		System.out.println("55565656::::"+plate_add);
		System.out.println(plateService.getPlateName(plate_add));
		if(plateService.getPlateName(plate_add).toString().equals("[]")) {
			plateService.setPlate(plate_add);
			System.out.println("添加板块成功");
			return "OK";
		}else {
			System.err.println("添加板块失败");
			return "NO";
		}
	}
	
	/**
	 * 获取content.jsp页面传来的数据，并将其保存在map("plateEdit")中，以便plateEdit.jsp页面使用
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/getUpdatePlate")
	public String getUpdatePlate(HttpServletRequest request,Map<Object, Object> map) {
		
		Plate plate=new Plate();
		plate.setBid(Integer.parseInt(request.getParameter("bid")));
		plate.setBname(request.getParameter("bname"));
		map.put("plateEdit", plate);
		return "redirect:/admin/plateEdit.jsp";
	}
	
	/**
	 * 修改板块
	 * @param plate
	 */
	@RequestMapping("/updatePlate")
	@ResponseBody
	public String updatePlate(HttpServletRequest request) {
		
		Plate plate=new Plate();
		plate.setBid(Integer.parseInt(request.getParameter("bid")));
		plate.setBname(request.getParameter("bname"));
		if(plateService.getPlateName(plate).toString().equals("[]")) {
			plateService.updatePlate(plate);
			return "OK";
		}else {
			return "NO";
		}
	}
	
	
	
	/**
	 * 按bid删除板块信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletePlate")
	public String deletePlate(HttpServletRequest request) {
		
		Plate plate_delete=new Plate();
		plate_delete.setBid(Integer.parseInt(request.getParameter("bid")));
		plateService.deletePlate(plate_delete);
		
		return "redirect:/admin/index.jsp";//重定向 
	}
	
	
	
}
