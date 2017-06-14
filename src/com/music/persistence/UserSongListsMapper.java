package com.music.persistence;

import java.util.List;

import com.music.entity.UserSongLists;

public interface UserSongListsMapper {
//List<UserSongLists> findAll();
	List<UserSongLists> findAll(int userlistid);
	boolean delete(int songid);
}
