package com.music.service;

import java.util.List;

import com.music.entity.UserSongLists;

public interface UserSongListsService {
	List<UserSongLists> findAll(int userlistid);
	boolean delete(int songid);
}
