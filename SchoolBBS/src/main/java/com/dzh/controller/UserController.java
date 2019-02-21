package com.dzh.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.dzh.bean.Article;
import com.dzh.bean.Attention;
import com.dzh.bean.Collect;
import com.dzh.bean.Comment;
import com.dzh.bean.User;
import com.dzh.service.ArticleService;
import com.dzh.service.AttentionService;
import com.dzh.service.CollectService;
import com.dzh.service.CommentService;
import com.dzh.service.UserService;
import com.dzh.service.ViaService;
import com.dzh.utils.PathUtil;
import com.dzh.utils.PropertyUtil;

@RequestMapping("/userController")
@SessionAttributes(value = { "username", "userid","password","email" })
@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	ArticleController articleController;
	@Autowired
	ArticleService articleService;
	@Autowired
	CommentController commentController;
	@Autowired
	CommentService commentService;
	@Autowired
	ViaService viaService;
	@Autowired
	AttentionService attentionService;
	@Autowired
	CollectService collectService;

	/**
	 * 用户登录判断-ajax
	 * 
	 * @param user
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/getLoginAjax")
	@ResponseBody
	public String getLoginAjax(User user, Map<Object, Object> map,HttpServletRequest request) {

		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
		
		//按用户名密码查询
		List<User> listUser = userService.getUser(user);

		if (!listUser.toString().equals("[]")) {

			int userid = listUser.get(0).getUserid();
			String name = listUser.get(0).getName();
			String password = listUser.get(0).getPassword();
			String email = listUser.get(0).getEmail();

			map.put("userid", userid);
			map.put("username", name);
			map.put("password", password);
			map.put("email", email);

			return "OK";
		} else {

			return "NO";
		}
	}
	
//	/**
//	 * 用户登录判断
//	 * 
//	 * @param user
//	 * @param map
//	 * @return
//	 */
//	@RequestMapping("/getLogin")
//	public String getLogin(User user, Map<Object, Object> map) {
//
//		//按用户名密码查询
//		List<User> listUser = userService.getUser(user);
//
//		if (!listUser.toString().equals("[]")) {
//
//			int userid = listUser.get(0).getUserid();
//			String name = listUser.get(0).getName();
//			String password = listUser.get(0).getPassword();
//			String email = listUser.get(0).getEmail();
//
//			// System.out.println(userid);
//			// System.out.println(name);
//
//			map.put("userid", userid);
//			map.put("username", name);
//			map.put("password", password);
//			map.put("email", email);
//
//			return "redirect:/index.jsp";// 重定向
//		} else {
//
//			return "redirect:/index.jsp";// 重定向
//		}
//	}

	/**
	 * 注册
	 * 
	 * @param user
	 * @param map
	 * @return
	 */
	@RequestMapping("/setSignUp")
	@ResponseBody
	public String setSignUp(User user, Map<Object, Object> map,HttpServletRequest request) {

		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("pass"));
		user.setEmail(request.getParameter("email"));
		//判断该用户是否已经存在
		if (userService.getUserName(user).toString().equals("[]")&&request.getParameter("name")!="") {
			//判断两次输入密码是否相同
			if(request.getParameter("pass").equals(request.getParameter("repass"))) {
				userService.setUser(user);
				System.out.println("用户注册成功");
					
				//按用户名查询
				List<User> listUser = userService.getUserName(user);
				int userid = listUser.get(0).getUserid();
				String name = user.getName();
				String password = user.getPassword();
				String email = user.getEmail();
				
				map.put("userid", userid);
				map.put("username", name);
				map.put("password", password);
				map.put("email", email);
				return "OK";
			}
			return "PASS";
		} else {

			System.err.println("用户注册失败");
			return "NO";
		}

	}

	/**
	 * 退出登录
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("/userExit")
	public String userExit(Map<Object, Object> map) {

		map.put("userid", "");
		map.put("username", "");
		return "redirect:/index.jsp";// 重定向
	}

	/**
	 * 个人主页
	 * 
	 * @return
	 */
	@RequestMapping("/getMyself")
	public String getMyself(HttpSession session, Map<Object, Object> map,Map<Object, Object> map2) {
		
		int userid=(int) session.getAttribute("userid");
		
		/**
		 * 按userid查询用户信息
		 */
		List<User> myListUser = userService.getUserId(userid);
		if (myListUser.get(0).getSex() == null) {
			myListUser.get(0).setSex("保密");
		}
		if (myListUser.get(0).getIntro() == null) {
			myListUser.get(0).setIntro("无");
		}
		map.put("myListUser", myListUser.get(0));
		
		/**
		 * 按userid查询帖子信息（动态）
		 */
		List<Article> myListArticles = articleService.getArticleId(userid);
		map.put("myListArticles", myListArticles);
		
		/**
		 * 按fid查询每个帖子下对应的评论信息（动态）
		 */
		for (int i = 0; i < myListArticles.size(); i++) {

			// 将每一条帖子对应的id单独抽出来
			int fid = myListArticles.get(i).getFid();

			// 再通过每一个帖子的id查找出对应的评论信息
			commentController.getCommentFid(fid, map);
			// 将上一步查出的对应的评论信息存放到listComment里
			List<Comment> myListComment = (List<Comment>) map.get("listComment");
			System.out.println("myListComment-"+i+":"+myListComment);

			// 为map预设一个随帖子id变化而变化的key
			String myListCommentFid = "myListComment_" + fid;
			// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
			map.put(myListCommentFid, myListComment);

			// 再将map存入map2
			map2.put("map", map);
		}
		
		/**
		 * 按userid查询评论信息（回复）
		 */
		List<Comment> myComments=commentService.getCommentUserid(userid);
		map.put("myComments_huifu", myComments);
		for (int i = 0; i < myComments.size(); i++) {
			
			// 将每一条评论对应的fid单独抽出来
			int fid = myComments.get(i).getFid();
			
			Article myArticle = articleService.getArticleKey(fid);
			System.out.println("myArticle:"+myArticle);
			
			map.put("myArticle_"+fid, myArticle);
			map2.put("map_huifu", map);
			
			// 再通过每一个帖子的id查找出对应的评论信息
			commentController.getCommentFid(fid, map);
			// 将上一步查出的对应的评论信息存放到listComment里
			List<Comment> myListComment_huifu = (List<Comment>) map.get("listComment");
			System.out.println("myListComment_huifu-"+i+":"+myListComment_huifu);

			// 为map预设一个随帖子id变化而变化的key
			String myListCommentFid_huifu_fid = "myListComment_huifu_" + fid;
			// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
			map.put(myListCommentFid_huifu_fid, myListComment_huifu);

			// 再将map存入map2
			map2.put("map_huifu_p", map);
		}
		
		/**
		 * 按userid查询关注信息（你关注了谁）
		 */
		List<Attention> attentions = attentionService.getAttention(userid);
		List<User> myListUserAttention = new ArrayList<User>();
		for(Attention attention : attentions) {
			//通过beuserid查询用户信息
			int beuserid=attention.getBeuserid();
			myListUserAttention.add(userService.getUserKey(beuserid));
		}
		map.put("myListAttentions", myListUserAttention);
		
		/**
		 * 按beuserid查询关注信息（谁关注了你）
		 */
		List<Attention> attentions_be = attentionService.getAttentionBe(userid);
		List<User> myListUserAttention_be = new ArrayList<User>();
		for(Attention attention_be : attentions_be) {
			//通过userid查询用户信息
			myListUserAttention_be.add(userService.getUserKey(attention_be.getUserid()));
		}
		map.put("myListAttentions_be", myListUserAttention_be);
		
		/**
		 * 按userid查询收藏信息（收藏了哪些帖子）
		 */
		List<Collect> collects = collectService.getCollect(userid);
		List<Article> myListArticleCollect = new ArrayList<Article>();
		for(Collect collect : collects) {
			//通过fid查询帖子信息
			int fid=collect.getFid();
			myListArticleCollect.add(articleService.getArticleKey(fid));
		}
		map.put("myListCollects", myListArticleCollect);
		
		
		return "myself";
	}

	/**
	 * 他人主页
	 * 
	 * @return
	 */
	@RequestMapping("/getOthers")
	public String getOthers(@RequestParam(value = "userid") int userid, Map<Object, Object> map,Map<Object, Object> map2,HttpSession session) {

		//如果该用户是登录用户，则回到“个人主页”
		if(session.getAttribute("userid")!=null && session.getAttribute("userid").equals(userid)) {
			
			return "redirect:/userController/getMyself";
		}else {
			
			/**
			 * 按userid查询用户信息
			 */
			List<User> othersListUser = userService.getUserId(userid);
			if (othersListUser.get(0).getSex() == null) {
				othersListUser.get(0).setSex("保密");
			}
			if (othersListUser.get(0).getIntro() == null) {
				othersListUser.get(0).setIntro("无");
			}
			map.put("othersListUser", othersListUser.get(0));

			/**
			 * 按userid查询帖子信息
			 */
			List<Article> othersListArticles = articleService.getArticleId(userid);
			map.put("othersListArticles", othersListArticles);

			/**
			 * 按fid查询每个帖子下对应的评论信息
			 */
			for (int i = 0; i < othersListArticles.size(); i++) {

				// 将每一条帖子对应的id单独抽出来
				int fid = othersListArticles.get(i).getFid();

				// 再通过每一个帖子的id查找出对应的评论信息
				commentController.getCommentFid(fid, map);
				// 将上一步查出的对应的评论信息存放到listComment里
				List<Comment> othersListComment = (List<Comment>) map.get("listComment");
				System.out.println("othersListComment-"+i+":"+othersListComment);

				// 为map预设一个随帖子id变化而变化的key
				String othersListCommentFid = "othersListComment_" + fid;
				// 将每一个帖子下对应的所有评论存入map中（其key是随帖子id变化而变化的）
				map.put(othersListCommentFid, othersListComment);

				// 再将map存入map2
				map2.put("map", map);
			}

			return "others";
		}
		
	}
	
	/**
	 * 编辑个人资料（修改user表）
	 * @param user
	 * @return 
	 * @return
	 */
	@RequestMapping("/updateUser")
	public ModelAndView UpdateUser(User user) {
		
		System.out.println(user);
		userService.updateUser(user);
		
		//重定向到getMyself这个方法
		return new ModelAndView("redirect:/userController/getMyself");
	}

	/**
	 * 查询用户信息（无条件）
	 * @param map
	 */
	public void getUser(Map<Object, Object> map) {

		List<User> listUser = userService.getUser();
		System.out.println(listUser);
		map.put("listUser", listUser);

	}

	public void getUserId(int userid, Map<Object, Object> map) {

		List<User> listUserId = userService.getUserId(userid);
		map.put("listUserId", listUserId);
	}
	
	/**
	 * 删除用户(及其对应的头像信息、评论信息、发帖信息、关注信息)
	 * @param user
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/deleteUser")
	public String deleteUser(User user,Map<Object, Object> map,HttpSession session,HttpServletRequest request) throws IOException {
		
		String SchoolBBS;	//项目名称
		SchoolBBS = request.getSession().getServletContext().getRealPath("/");
		SchoolBBS=SchoolBBS.substring(0,SchoolBBS.length()-1);
		if (SchoolBBS.indexOf("/")==-1) {//在非linux系统下
			SchoolBBS = SchoolBBS.substring(SchoolBBS.lastIndexOf("\\"),SchoolBBS.length());
		} else {//在linux系统下
			SchoolBBS = SchoolBBS.substring(SchoolBBS.lastIndexOf("/"),SchoolBBS.length());
		}

		//文件（图片）路径
		String filePath = PathUtil.getCommonPath()+SchoolBBS+PathUtil.getUserPath();
		
		int userid=user.getUserid();
		
		//删除用户信息（不包含头像）
		userService.deleteUser(user);
		
		System.out.println(viaService.getVia(userid));
		//对应的有头像的用户才进行以下操作
		if(viaService.getVia(userid)!=null) {
		
			// 获取取要删除用户对应的头像的文件名（通过userid获取头像信息）
			String fileName = viaService.getVia(userid).getPhoto();
			System.out.println("文件名："+fileName);
			// 封装上传文件位置的全路径
			File targetFile = new File(filePath, fileName);
			System.out.println("拼接全文件名："+targetFile);
			
			//删除用户对应的头像（实际删除）
			targetFile.delete();
			
			//删除用户对应的头像信息(数据库)
			viaService.deleteVia(userid);
		}
		
		//删除该用户对应的所有评论信息(按userid)
		commentService.deleteCommentUserid(userid);
		
		List<Article> listArticle=articleService.getArticleId(userid);
		System.out.println(listArticle);
		//对应的有发过帖子的用户才进行以下操作
		if(listArticle.toString()!="[]") {
		
			for(int i=0; i<listArticle.size();i++) {
				
				int fid=listArticle.get(i).getFid();
				articleController.articlePhotoDelete(fid,request);
			}
			
			//删除用户对应的帖子信息(数据库)
			articleService.deleteArticleUserid(userid);
		}
		
		//删除该用户对应的关注和被关注信息
		attentionService.deleteAttentionUseridOrBeuserid(userid);
		
		//删除该用户对应的收藏信息(按userid)
		collectService.deleteCollectUserid(userid);
		
		//如果删除的是当前登录用户，则清空对应的session
		if(session.getAttribute("userid")!=null && session.getAttribute("userid").equals(userid)) {
			map.put("userid", "");
			map.put("username", "");
		}

		return "redirect:/admin/index.jsp";
	}
	
	
	/**
	 * 修改基本设置处的用户信息（即：用户名、密码、邮箱）
	 * @param user
	 * @param session
	 * @param map
	 * @return
	 */
	@RequestMapping("/updateUserSetup")
	public ModelAndView updateUserSetup(User user,HttpSession session,Map<Object, Object> map) {
		
		boolean name=user.getName().equals(session.getAttribute("username"));
		boolean password=user.getPassword().equals(session.getAttribute("password"));
		boolean email=user.getEmail().equals(session.getAttribute("email"));
		Article article = new Article();
		article.setUserid(user.getUserid());
		article.setUsername(user.getName());

		if(name && password && email) {
		
			System.out.println("没改动任何信息，不做数据库修改工作。");
		}else{
			//1，修改user表
			userService.updateUserSetup(user);
			//2，修改article表中的username
			articleService.updateArticleSetup(article);
			map.put("username", user.getName());
			map.put("password", user.getPassword());
			map.put("email", user.getEmail());
		}
		
		//重定向到getMyself这个方法
		return new ModelAndView("redirect:/userController/getMyself");
	}

	
}
