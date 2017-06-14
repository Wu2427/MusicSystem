package com.music.entity;

public class UserSongLists {
	private int id;
	private int userlistid;
	private String listname;
	private String songname;
	private String singername;
	private int songid;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserlistid() {
		return userlistid;
	}

	public void setUserlistid(int userlistid) {
		this.userlistid = userlistid;
	}

	public String getListname() {
		return listname;
	}

	public void setListname(String listname) {
		this.listname = listname;
	}

	public int getSongid() {
		return songid;
	}

	public void setSongid(int songid) {
		this.songid = songid;
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

}
