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

import com.music.entity.UserLists;
import com.music.service.UserListsService;

@Controller
@RequestMapping("/userlists")
public class UserListsController {
	@Autowired
	private UserListsService userlistsService;
	
	@RequestMapping("/getAllUserLists")
	public String getAllUserLists(HttpServletRequest request) {
		List<UserLists> findAllList = userlistsService.findAll();
		request.setAttribute("userlists", findAllList);
		return "user/allUserLists";
	}
	
	@ResponseBody
	@RequestMapping("/getUserLists")
	public List<UserLists> getUserLists(int songid,HttpServletRequest request) {
		List<UserLists> findList = userlistsService.findAll();
		request.setAttribute("findList", findList);
		request.getSession().setAttribute("songid", songid);
		return findList;
	}
	
	@RequestMapping("/toAddLists")
	public String toAddLists(HttpServletRequest request) {
		return "/addlist";
	}
	
	@RequestMapping("/AddUserLists")
	public String AddUserLists(UserLists userlists, HttpServletRequest request) {
		userlistsService.add(userlists);
		return "redirect:/userlists/getAllUserLists";
	}
	
	@RequestMapping("/getLists")
	public String getLists(int id,HttpServletRequest request) {
		request.setAttribute("lists", userlistsService.findById(id));
		return "redirect:/userlists/updateUserLists";

	}
	@RequestMapping("/delUserLists")
	private void delUserLists(int id, HttpServletRequest request,
			HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (userlistsService.delete(id)) {
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

	@RequestMapping("/updateUserLists")
	public String updateUserLists(UserLists userlists, HttpServletRequest request) {
		if (userlistsService.update(userlists)) {
			userlists = userlistsService.findById(userlists.getId());
			request.setAttribute("userlists", userlists);
			return "redirect:/userlists/getAllUserLists";
		} else {
			return "user/fail";
		}
	}

}
