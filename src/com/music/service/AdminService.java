package com.music.service;

import java.util.List;

import com.music.entity.Admin;

public interface AdminService {
	//admin 登录
		Admin login(String adminname,String adminpwd);
		//admin修改
		Admin findById(int id);
		boolean update(Admin admin);
		List<Admin> findAll(String adminname);
}
