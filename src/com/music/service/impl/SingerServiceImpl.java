package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.Singer;
import com.music.persistence.SingerMapper;
import com.music.service.SingerService;

@Service
@Transactional
public class SingerServiceImpl implements SingerService {
	@Resource
	private SingerMapper mapper;

	public List<Singer> findAll() {
		List<Singer> findAllList = mapper.findAll();
		return findAllList;
	}

	public boolean delete(int id) {
		return mapper.delete(id);
	}

	public boolean update(Singer singer) {
		return mapper.update(singer);
	}

	public Singer findById(int id) {
		Singer singer=mapper.findById(id);
		return singer;
	}

	public void add(Singer singer) {
		mapper.add(singer);
	}

	public List<Singer> selectOne(Integer id) {
		List<Singer> selectOneList=mapper.selectOne(id);
		return selectOneList;
	}

	public List<Singer> findSort() {
		List<Singer> findSortList=mapper.findSort();
		return findSortList;
	}

	public boolean addSingerSong(Singer singer,int singerid) {
		return mapper.addSingerSong(singer, singerid);
	}

}
