package com.music.persistence;

import java.util.List;

import com.music.entity.UserLists;

public interface UserListsMapper {
//用户增加、删除、修改、查看
	boolean add(UserLists userlists);
	boolean update(UserLists userlists);
	boolean delete(int id);
	UserLists findById(int id);
	List<UserLists> findAll();
	//boolean update(int id);
}
