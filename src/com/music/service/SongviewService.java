package com.music.service;

import java.util.List;

import com.music.entity.Songview;

public interface SongviewService {
	//评论增加、删除、查看
		void add(Songview songview);
		boolean delete(int id);
		List<Songview> findAll();
		boolean addSongview(Songview songview);
		List<Songview> findAllView(int songid);
}
