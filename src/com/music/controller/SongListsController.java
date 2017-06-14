package com.music.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.music.entity.SongLists;
import com.music.service.SongListsService;

@Controller
@RequestMapping("/songlist")
public class SongListsController {

	@Autowired
	private SongListsService songListService;
	
	@RequestMapping("/getSongList")
	public String getSongList(int listid,HttpServletRequest request) {
		List<SongLists> findLists=songListService.findAll(listid);
		request.setAttribute("findLists", findLists);
		request.getSession().setAttribute("listid", listid);
		return "user/singleLists";
	}
	
	@RequestMapping("/getAdminSongList")
	public String getAdminSongList(int listid,HttpServletRequest request) {
		List<SongLists> findLists=songListService.findAll(listid);
		request.setAttribute("songLists", findLists);
		request.getSession().setAttribute("listid", listid);
		return "admin/singleLists";
	}
	
	@RequestMapping("/addSong")
	public String addSong(Integer listid,HttpServletRequest request,SongLists songLists) {
		listid=(Integer) request.getSession().getAttribute("listid");
		SongLists lists=new SongLists();
		lists.setListid(listid);
		songListService.add(lists);
		return "redirect:/lists/findLists";
	}
}
