package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.UserLists;
import com.music.persistence.UserListsMapper;
import com.music.service.UserListsService;

@Service
@Transactional
public class UserListsServiceImpl implements UserListsService {
	@Resource
	private UserListsMapper mapper;

	public boolean add(UserLists userlists) {
		return mapper.add(userlists);
	}

	public boolean update(UserLists userlists) {
		return mapper.update(userlists);
	}

	public boolean delete(int id) {
		return mapper.delete(id);
	}

	public UserLists findById(int id) {
		UserLists userlists=mapper.findById(id);
		return userlists;
	}

	public List<UserLists> findAll() {
		List<UserLists> findAllList=mapper.findAll();
		return findAllList;
	}

	/*public boolean updateList( int id) {
		return mapper.updateList( id);
	}*/
}
