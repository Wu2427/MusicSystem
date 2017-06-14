package com.music.service;

import java.util.List;

import com.music.entity.SongLists;

public interface SongListsService {
	//歌单--admin增加、删除、修改、查看全部、查看单个
		List<SongLists> findAll(int listid);
		void add(SongLists lists);
}
