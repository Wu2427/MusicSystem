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

import com.music.entity.Singer;
import com.music.service.SingerService;

@Controller
@RequestMapping("/singer")
public class SingerController {
	@Autowired
	private SingerService singerService;
	
	@ResponseBody
	@RequestMapping("/findSortSinger")
	public List<Singer> findSortSinger(HttpServletRequest request) {
		List<Singer> findSortList=singerService.findSort();
		request.setAttribute("sortsingerList", findSortList);
		return findSortList;
	}
	
	@RequestMapping("/findSinger")
	public String findSinger(HttpServletRequest request) {
		List<Singer> findList=singerService.findAll();
		request.setAttribute("allsinger", findList);
		return "admin/singerUser";
	}
	
	@RequestMapping("/selectOneSinger")
	public String selectOneSinger(Integer singerid, HttpServletRequest request) {
		List<Singer> selectOne=singerService.selectOne(singerid);
		request.setAttribute("singleSinger", selectOne);
		return "user/singleSinger";
	}
	
	@RequestMapping("/OneSinger")
	public String OneSinger(Integer singerid, HttpServletRequest request) {
		List<Singer> selectOne=singerService.selectOne(singerid);
		request.setAttribute("oneSinger", selectOne);
		return "admin/singleSinger";
	}
	
	@RequestMapping("/getAllSinger")
	public String getAllSinger(HttpServletRequest request) {
		List<Singer> findAll = singerService.findAll();
		request.setAttribute("singerList", findAll);
		return "user/allSinger";
	}

	@RequestMapping("/toAddSinger")
	public String toAddSinger(HttpServletRequest request) {
		return "/addSinger";
	}

	@RequestMapping("/addSinger")
	public String addSinger(Singer singer, HttpServletRequest request) {
		singerService.add(singer);
		return "redirect:/singer/findSinger";
	}
	
	@RequestMapping("/addSingerSong")
	public String addSingerSong(Singer singer, HttpServletRequest request) {
		Integer singerid=(Integer) request.getSession().getAttribute("singerid");
		singer.setSingerid(singerid);
		singerService.addSingerSong(singer, singerid);
		return "redirect:/singer/OneSinger";
	}

	@RequestMapping("/delSinger")
	public void delSinger(int id, HttpServletRequest request, HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (singerService.delete(id)) {
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

	@RequestMapping("/updateSinger")
	public String updateSinger(Singer singer, HttpServletRequest request) {
		if (singerService.update(singer)) {
			singer = singerService.findById(singer.getId());
			request.setAttribute("singer", singer);
			return "redirect:/singer/getAllSinger";
		} else {
			return "admin/404";
		}
	}

	@RequestMapping("/getSinger")
	public String getSinger(int id, HttpServletRequest request) {
		request.setAttribute("singer", singerService.findById(id));
		return "/editSinger";
	}
}
