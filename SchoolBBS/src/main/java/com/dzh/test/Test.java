package com.dzh.test;

import javax.servlet.http.HttpServletRequest;

public class Test {
	public static void main(String[] args) {
		
//		String projectname = System.getProperty("user.dir");
//		String pn;
//		if (projectname.indexOf("/")==-1) {//在非linux系统下
//			pn = projectname.substring(projectname.lastIndexOf("\\"),projectname.length());
//			System.out.println(pn);
//		} else {//在linux系统下
//			pn = projectname.substring(projectname.lastIndexOf("/"),projectname.length());
//			System.out.println(pn);
//		}
		
		HttpServletRequest request=null;
		System.out.println(request.getSession().getServletContext().getRealPath("/"));
		
	}
}
