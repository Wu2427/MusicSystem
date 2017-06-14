package com.music.persistence;

import java.util.List;

import com.music.entity.Singer;


public interface SingerMapper {
//admin 对歌手增删修改查看，用户收藏
	List<Singer> findAll();
	boolean delete(int id);
	boolean update(Singer singer);
	Singer findById(int id);
	void add(Singer singer);
	List<Singer> selectOne(Integer id);
	List<Singer> findSort();
	boolean addSingerSong(Singer singer,int singerid);
}
