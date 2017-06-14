package com.music.persistence;

import java.util.List;

import com.music.entity.Song;


public interface SongMapper {
//增删改查（单个）、下载、收藏
	List<Song> findAll();
	boolean delete(int id);
	void add(Song song);
	boolean update(Song song);
	Song findById(int id);
	Song selectOne(int id);
	void collectSong(int songid, int userlistid);
	List<Song> findSort();
}
