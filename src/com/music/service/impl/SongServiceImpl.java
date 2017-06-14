package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.music.entity.Song;
import com.music.persistence.SongMapper;
import com.music.service.SongService;

@Service
@Transactional
public class SongServiceImpl implements SongService {
	@Resource
	private SongMapper mapper;

	public List<Song> findAll() {
		List<Song> findAllList=mapper.findAll();
		return findAllList;
	}

	public boolean delete(int id) {
		return mapper.delete(id);
	}

	public void add(Song song) {
		mapper.add(song);
	}

	public boolean update(Song song) {
		return mapper.update(song);
	}

	public Song findById(int id) {
		Song song=mapper.findById(id);
		return song;
	}

	public Song selectOne(int id) {
		Song song=mapper.selectOne(id);
		return song;
	}


	public List<Song> findSort() {
		List<Song> findSortList=mapper.findSort();
		return findSortList;
	}


	public void collectSong(int songid, int listid) {
		mapper.collectSong(songid, listid);
	}

}
