package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.SingerSong;
import com.music.persistence.SingerSongMapper;
import com.music.service.SingerSongService;

@Service
@Transactional
public class SingerSongServiceImpl implements SingerSongService{

	@Resource
	private SingerSongMapper mapper;
	
	public List<SingerSong> findAll() {
		List<SingerSong> findAllList=mapper.findAll();
		return findAllList;
	}

}
