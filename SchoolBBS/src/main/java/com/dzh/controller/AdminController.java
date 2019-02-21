package com.dzh.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dzh.bean.Admin;
import com.dzh.bean.User;
import com.dzh.service.AdminService;

@Controller
@RequestMapping("adminController")
@SessionAttributes(value="adminList")
public class AdminController {

	@Autowired
	AdminService adminService;
	@Autowired
	PlateController plateController;
	@Autowired
	UserController userController;
	
	List<Admin> list=new ArrayList<>();
	
	/**
	 * 管理员登录判断
	 * @param admin
	 * @param map
	 * @return
	 */
	@RequestMapping("getLogin")
	public String getLogin(Admin admin, Map<Object, Object> map) {

		System.out.println(admin);
		
		//调用管理员查询方法
		list=adminService.getAdmin(admin);
		String str=list.toString();
		
		System.out.println(list);

		if (!str.equals("[]")) {

			map.put("adminList", list.get(0));
			plateController.getPlate(map);
			userController.getUser(map);
			
			return "redirect:/admin/index.jsp";//重定向 
		} else {

			return "redirect:/admin/index.jsp";//重定向 
		}
	}

	/**
	 *我要解释一下为什么注释了管理员注册这个模块，因为我没有想出一个比较安全的注册条件，而且其他人只要知道了这个地址就可以
	 *直接跳转进来进行注册，注册后就可以直接进行对其他普通用户的增删改查，非常的不安全，所以干脆直接在数据库里面进行管理员
	 *的创建，这样相对安全一些，但是controller和相应的jsp页面已经写出来了的，并不是写不出来才不写，特此在这里进行解释。
	 *
	 * 管理员注册
	 * @param admin
	 * @param map
	 * @return
	 *
	 @RequestMapping("/setSignUp")
	 public String setSignUp(Admin admin, Map<Object, Object> map) {
		
		if(adminService.getAdminName(admin).toString().equals("[]")) {
			
			//调用管理员插入方法
			adminService.setAdmin(admin);
			
			//调用管理员查询方法（获取刚刚注册的管理员信息）
			list=adminService.getAdmin(admin);
			
			map.put("adminList", list.get(0));
			
			System.out.println("管理员注册成功");
			
			return "admin";
		}else {
			
			System.err.println("管理员注册失败");
			return "redirect:/admin/index.jsp";//重定向 
		}
			
	}
	*/
	
	
	/**
	 * 退出管理员登录
	 * 
	 * @param map
	 * @return
	 *
	 */
	@RequestMapping("/adminExit")
	public String adminExit(Map<Object, Object> map) {

		map.put("adminList", "");
		return "redirect:/admin/index.jsp";// 重定向
	}
	
	
	
	
}
