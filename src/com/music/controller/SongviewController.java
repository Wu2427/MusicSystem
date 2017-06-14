package com.music.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.entity.Songview;
import com.music.service.SongviewService;

@Controller
@RequestMapping("/songview")
public class SongviewController {
	@Autowired
	private SongviewService songviewService;

	@RequestMapping("/getAllSongview")
	public String getAllSongview(HttpServletRequest request) {
		List<Songview> findAllList = songviewService.findAll();
		request.setAttribute("findAllList", findAllList);
		return "admin/songview";
	}
	
	@ResponseBody
	@RequestMapping("/getSongview")
	public List<Songview> getSongview(HttpServletRequest request,int songid) {
		List<Songview> findList = songviewService.findAllView(songid);
		request.setAttribute("findList", findList);
		request.getSession().setAttribute("songid", songid);
		return findList;
	}


	@RequestMapping("/toAddSongview")
	public String toAddSongview(HttpServletRequest request) {
		return "/addSongview";
	}

	@RequestMapping("/addsongview")
	public String addsongview(Songview songview,HttpServletRequest request) {
		Integer userid=(Integer) request.getSession().getAttribute("userid");
		songview.setUserid(userid);
		songviewService.add(songview);
		return "redirect:/song/getAllSong";
	}
	
	@RequestMapping("/delSongview")
	public void delSongview(int id, HttpServletRequest request, HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (songviewService.delete(id)) {
			result = "{\"result\":\"success\"}";
		}
		response.setContentType("application/json");
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
