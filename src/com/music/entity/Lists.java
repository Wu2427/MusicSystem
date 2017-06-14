package com.music.entity;

public class Lists {//网站上的歌单
	private Integer id;//ID
	private String listname;//歌单名称
	private int listid;

	
	public Integer getListid() {
		return listid;
	}

	public void setListid(Integer listid) {
		this.listid = listid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getListname() {
		return listname;
	}

	public void setListname(String listname) {
		this.listname = listname;
	}

}
