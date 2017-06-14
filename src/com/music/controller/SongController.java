package com.music.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.entity.Song;
import com.music.service.SongService;

@Controller
@RequestMapping("/song")
public class SongController {
	
	@Autowired
	private SongService songService;
	
	@ResponseBody
	@RequestMapping("/findSortSong")
	public List<Song> findSortSong(HttpServletRequest request) {
		List<Song> findSortSongList = songService.findSort();
		request.setAttribute("sortsongList", findSortSongList);
		return findSortSongList;

	}
	
	@RequestMapping("/selectOneSong")
	public String selectOneSong(int id, HttpServletRequest request) {
		request.setAttribute("song", songService.selectOne(id));
		request.getSession().setAttribute("songid", id);
		return "user/singleSong";
	}
	
	@ResponseBody
	@RequestMapping("/getsong")
	public List<Song> getsong(HttpServletRequest request) {
		List<Song> findAllList = songService.findAll();
		request.setAttribute("songList", findAllList);
		return findAllList;
	}
	
	@RequestMapping("/getAllSong")
	public String getAllSong(HttpServletRequest request) {
		List<Song> findAllList = songService.findAll();
		request.setAttribute("songList", findAllList);
		return "user/allSong";
	}
	
	@RequestMapping("/delSong")
	public String delSong(int id, HttpServletRequest request, HttpServletResponse response) {
		String result = null;
		if (songService.delete(id)) {
			request.setAttribute("result", "删除成功");
		}
		else{
			request.setAttribute("result", "删除失败");
		}
		return "admin/adminindex";
	}

	@RequestMapping("/addSong")
	public String addSong(Song song, HttpServletRequest request) {
		songService.add(song);
		return "admin/adminindex";
	}
	
	@RequestMapping("/addSingerSong")
	public String addSingerSong(Song song, HttpServletRequest request) {
		songService.add(song);
		return "admin/singleSinger";
	}
	
	@RequestMapping("/collectSong")
	public String collectSong(int listid,HttpServletRequest request){
		Integer songid=(Integer) request.getSession().getAttribute("songid");
		Song song=new Song();
		song.setId(songid);
		songService.collectSong(songid, listid);
		return "redirect:/song/getAllSong";
	}
	
	@RequestMapping("/updateSong")
	public String updateSong(Song song, HttpServletRequest request) {
		if (songService.update(song)) {
			song = songService.findById(song.getId());
			request.setAttribute("song", song);
			return "redirect:/song/getAllSong";
		} else {
			return "admin/404";
		}
	}

	@RequestMapping("/getSong")
	public String getSong(int id, HttpServletRequest request) {
		request.setAttribute("song", songService.findById(id));
		return "admin/editSong";
	}
}
