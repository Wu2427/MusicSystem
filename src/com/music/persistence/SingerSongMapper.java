package com.music.persistence;

import java.util.List;

import com.music.entity.SingerSong;

public interface SingerSongMapper {
	List<SingerSong> findAll();
}
