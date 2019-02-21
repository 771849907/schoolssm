package com.dzh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dzh.bean.User;
import com.dzh.dao.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;

	/**
	 * 登录查询（按姓名和密码）
	 * 
	 * @param user
	 * @return
	 */
	public List<User> getUser(User user) {

		return userMapper.selectByUser(user);
	}
	
	/**
	 * 注册按用户名查询
	 * 
	 * @param user
	 * @return
	 */
	public List<User> getUserName(User user) {

		return userMapper.selectByUserName(user);
	}

	/**
	 * 注册插入
	 * 
	 * @param user
	 */
	public void setUser(User user) {

		userMapper.insert(user);
	}

	/**
	 * 查询用户信息（无条件）
	 * @return
	 */
	public List<User> getUser() {

		return userMapper.selectByUserAll();
	}

	/**
	 * 按userid查询用户信息
	 * @param userid
	 * @return
	 */
	public List<User> getUserId(int userid) {
		
		return userMapper.selectByUserId(userid);
	}

	/**
	 * 编辑个人资料（修改user表）
	 * @param user
	 */
	public void updateUser(User user) {
		
		userMapper.updateByPrimaryKey(user);
	}

	/**
	 * 删除用户
	 * @param user
	 */
	public void deleteUser(User user) {

		userMapper.deleteByPrimaryKey(user.getUserid());
	}

	/**
	 * 基本设置信息的修改
	 * @param user
	 */
	public void updateUserSetup(User user) {
		
		userMapper.updateSetupByPrimaryKey(user);
	}

	/**
	 * 按userid查询用户信息
	 * @param userid
	 * @return
	 */
	public User getUserKey(int userid) {
		
		return userMapper.selectByPrimaryKey(userid);
	}
	
	
	
}
