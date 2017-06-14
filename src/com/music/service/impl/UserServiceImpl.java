package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.User;
import com.music.persistence.UserMapper;
import com.music.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper mapper;

	public void add(User user) {
		mapper.add(user);
	}

	public boolean update(User user) {
		return mapper.update(user);
	}

	public boolean delete(int id) {
		return mapper.delete(id);
	}

	public User findById(int id) {
		User user = mapper.findById(id);
		return user;
	}

	public List<User> findAll() {
		List<User> findAllList = mapper.findAll();
		return findAllList;
	}

	public User getUserByName(String username, String userpwd) {
		User user = mapper.getUserByName(username);
		if (user != null && user.getUserpwd().equals(userpwd)) {
			return user;
		}
		return null;
	}

	public List<User> findUserAndPwd(String user) {
		return mapper.findUserAndPwd(user);
	}

}
