package com.dzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dzh.bean.Collect;
import com.dzh.service.CollectService;

@RequestMapping("/collectController")
@Controller
public class CollectController {

	@Autowired
	CollectService collectService;
	
	
	/**
	 * 删除收藏（按sid）
	 * @param collect
	 * @return
	 */
	@RequestMapping("/deleteCollect")
	public String deleteCollect(Collect collect) {
		
		collectService.deleteCollect(collect);
		return "redirect:/index.jsp";//重定向
	}
	
	/**
	 * 删除收藏（按userid和fid）
	 * @param collect
	 * @return
	 */
	@RequestMapping("/deleteCollectUseridAndFid")
	public String deleteCollectUseridAndFid(Collect collect) {
		
		System.out.println(collect);
		collectService.deleteCollectUseridAndFid(collect);
		return "redirect:../userController/getMyself";//重定向
	}
	
	/**
	 * 添加收藏
	 * @param collect
	 * @return
	 */
	@RequestMapping("/setCollect")
	public String setCollect(Collect collect) {
		
		System.out.println(collect);
		collectService.setCollect(collect);
		return "redirect:/index.jsp";//重定向
	}
	
}
