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

import com.music.entity.UserSongLists;
import com.music.service.UserSongListsService;

@Controller
@RequestMapping("/usersong")
public class UserSongListsController {

	@Autowired
	private UserSongListsService service;

	@ResponseBody
	@RequestMapping("/findAllL")
	public List<UserSongLists> findAllL(int userlistid,HttpServletRequest request) {
		List<UserSongLists> findAllL = service.findAll(userlistid);
		request.setAttribute("findAllL", findAllL);
		return findAllL;
	}
	
	@RequestMapping("/delSong")
	public void delSong(int songid,HttpServletRequest request, HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (service.delete(songid)) {
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
