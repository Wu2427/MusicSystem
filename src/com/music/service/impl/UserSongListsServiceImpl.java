package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.UserSongLists;
import com.music.persistence.UserSongListsMapper;
import com.music.service.UserSongListsService;

@Service
@Transactional
public class UserSongListsServiceImpl implements UserSongListsService{

	@Resource
	private UserSongListsMapper mapper;

	@Override
	public List<UserSongLists> findAll(int userlistid) {
		List<UserSongLists> findAllList=mapper.findAll(userlistid);
		return findAllList;
	}

	public boolean delete(int songid) {
		return mapper.delete(songid);
	}

}
