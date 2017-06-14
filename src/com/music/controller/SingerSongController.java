package com.music.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.entity.SingerSong;
import com.music.service.SingerSongService;

@Controller
@RequestMapping("/singersong")
public class SingerSongController {

	@Autowired
	private SingerSongService singersongService;
	
	@ResponseBody
	@RequestMapping("/findSingerSongs")
	public List<SingerSong> SingerSong(HttpServletRequest request) {
		List<SingerSong> findAllList=singersongService.findAll();
		request.setAttribute("findAllList", findAllList);
		return findAllList;
	}
}
