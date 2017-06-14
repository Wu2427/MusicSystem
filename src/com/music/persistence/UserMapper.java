package com.music.persistence;

import java.util.List;

import com.music.entity.User;


public interface UserMapper {
//登录、注册、修改、删除、查看
	void add(User user);
	boolean update(User user);
	boolean delete(int id);
	User findById(int id);
	List<User> findAll();
	User getUserByName(String username);
	List<User> findUserAndPwd(String user);
}
