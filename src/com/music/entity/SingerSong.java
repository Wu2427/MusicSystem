package com.music.entity;

public class SingerSong {
	private int id;
	private int songid;
	private int singerid;
	private String songname;
	private String singname;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSongid() {
		return songid;
	}

	public void setSongid(int songid) {
		this.songid = songid;
	}

	public int getSingerid() {
		return singerid;
	}

	public void setSingerid(int singerid) {
		this.singerid = singerid;
	}

	public String getSongname() {
		return songname;
	}

	public void setSongname(String songname) {
		this.songname = songname;
	}

	public String getSingname() {
		return singname;
	}

	public void setSingname(String singname) {
		this.singname = singname;
	}

}
