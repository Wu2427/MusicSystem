package com.music.service;

import java.util.List;

import com.music.entity.Song;

public interface SongService {
	//增删改查（单个）、下载、收藏
		List<Song> findAll();
		boolean delete(int id);
		void add(Song song);
		boolean update(Song song);
		Song findById(int id);
		Song selectOne(int id);
		void collectSong(int songid,int listid);
		List<Song> findSort();
}
