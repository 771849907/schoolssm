package com.dzh.utils;

import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {

	/**
	 * 获取配置文件pathconfig.properties的信息
	 * @return
	 */
	public static Properties getPropertiesPath() {

		// 用来保存属性文件中的键值对
		Properties prop = new Properties();
		try {
			// 获取属性文件中的内容（将属性文件中的内容读取到一个输入流中）
			InputStream in = PropertyUtil.class.getClassLoader().getResourceAsStream("pathconfig.properties");

			// 从输入流中读取属性列表
			prop.load(in);
		} catch (Exception e) {
			System.out.println("=======配置文件读取错误=======");
		}
		
		return prop;
	}

}
