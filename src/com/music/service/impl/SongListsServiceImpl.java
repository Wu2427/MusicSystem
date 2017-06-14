package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.SongLists;
import com.music.persistence.SongListsMapper;
import com.music.service.SongListsService;

@Service
@Transactional
public class SongListsServiceImpl implements SongListsService {
	@Resource
	private SongListsMapper mapper;

	public List<SongLists> findAll(int listid) {
		List<SongLists> findAll=mapper.findAll(listid);
		return findAll;
	}

	public void add(SongLists lists) {
		mapper.add(lists);
	}


}
