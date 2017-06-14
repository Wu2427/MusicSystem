package com.music.entity;

public class Song {
	private String songname;//歌曲名
	private String singername;//歌手名
	private int id;//ID
	private int singerid;//歌手id
	private String music;//music文件名
	
	public String getMusic() {
		return music;
	}

	public void setMusic(String music) {
		this.music = music;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSongname() {
		return songname;
	}

	public void setSongname(String songname) {
		this.songname = songname;
	}

	public String getSingername() {
		return singername;
	}

	public void setSingername(String singername) {
		this.singername = singername;
	}

	public int getSingerid() {
		return singerid;
	}

	public void setSingerid(int singerid) {
		this.singerid = singerid;
	}
}
