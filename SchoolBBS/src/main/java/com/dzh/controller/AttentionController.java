package com.dzh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dzh.bean.Attention;
import com.dzh.service.AttentionService;

@RequestMapping("/attentionController")
@Controller
public class AttentionController {

	@Autowired
	AttentionService attentionService;
	
	/**
	 * 添加关注
	 * @return
	 */
	@RequestMapping("/setAttention")
	public String setAttention(Attention attention) {
		
		attentionService.setAttention(attention);
		return "redirect:/index.jsp";//重定向
	}
	
	
	/**
	 * 取消关注（首页）
	 * @param attention
	 * @return
	 */
	@RequestMapping("/deleteAttention")
	public String deleteAttention(Attention attention) {

		attentionService.deleteAttention(attention);
		return "redirect:/index.jsp";
	}
	
	/**
	 * 取消关注（个人主页）
	 * @param attention
	 * @return
	 */
	@RequestMapping("/deleteAttentionMyself")
	public ModelAndView deleteAttentionMyself(Attention attention) {
		
		attentionService.deleteAttentionMyself(attention);
		return new ModelAndView("redirect:/userController/getMyself");
	}
	
	
}
