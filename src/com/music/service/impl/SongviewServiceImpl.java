package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.Songview;
import com.music.persistence.SongviewMapper;
import com.music.service.SongviewService;

@Service
@Transactional
public class SongviewServiceImpl implements SongviewService{
	@Resource
	private SongviewMapper mapper;


	public boolean delete(int id) {
		return mapper.delete(id);
	}

	public List<Songview> findAll() {
		List<Songview> findAllList=mapper.findAll();
		return findAllList;
	}
	public void add(Songview songview) {
		mapper.add(songview);
		
	}

	public boolean addSongview(Songview songview) {
		return false;
	}

	public List<Songview> findAllView(int songid) {
		List<Songview> findAllView=mapper.findAllView(songid);
		return findAllView;
	}


	
}
