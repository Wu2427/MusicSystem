package com.music.service;

import java.util.List;

import com.music.entity.Lists;

public interface ListsService {
	//歌单--admin增加、删除、修改、查看全部、查看单个
		List<Lists> findAll();
		void add(Lists lists);
		List<Lists> findById(int id);
		boolean update(Lists lists);
		boolean delete(int id);
		List<Lists> selectOne(Integer listid);
		List<Lists> findSort();
}
