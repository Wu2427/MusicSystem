package com.music.persistence;

import java.util.List;

import com.music.entity.SongLists;

public interface SongListsMapper {

List<SongLists> findAll(int listid);
void add(SongLists lists);
}
