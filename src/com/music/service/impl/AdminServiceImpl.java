package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.Admin;
import com.music.persistence.AdminMapper;
import com.music.service.AdminService;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	@Resource
	private AdminMapper mapper;

	public Admin login(String adminname, String adminpwd) {
		Admin admin = mapper.login(adminname, adminpwd);
		if (admin != null && admin.getAdminname().equals(adminpwd)
				&& admin.getAdminname().equals(adminname)) {
			return admin;
		}
		return null;
	}

	public Admin findById(int id) {
		Admin admin=mapper.findById(id);
		return admin;
	}

	public boolean update(Admin admin) {
		return mapper.update(admin);
	}

	public List<Admin> findAll(String adminname) {
		return mapper.findAll(adminname);
	}

}
