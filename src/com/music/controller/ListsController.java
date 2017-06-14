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

import com.music.entity.Lists;
import com.music.service.ListsService;

@Controller
@RequestMapping("/lists")
public class ListsController {
	@Autowired
	private ListsService listsService;
	
	@ResponseBody
	@RequestMapping("/findSortLists")
	public List<Lists> findSortLists(HttpServletRequest request) {
		List<Lists> findSortLists=listsService.findSort();
		return findSortLists;
	}
	
	@RequestMapping("/findLists")
	public String findLists(HttpServletRequest request) {
		List<Lists> findLists=listsService.findAll();
		request.setAttribute("findLists", findLists);
		return "/admin/allLists";
	}
	
	@RequestMapping("/getAllLists")
	public String getAllLists(HttpServletRequest request) {
		List<Lists> findAllList = listsService.findAll();
		request.setAttribute("listsList", findAllList);
		return "user/allLists";
	}
	
	
	@RequestMapping("/getOneLists")
	public String getOneLists(Integer listid,HttpServletRequest request) {
		List<Lists> selectOne=listsService.selectOne(listid);
		request.setAttribute("lists", selectOne);
		return "user/singleLists";
	}

	
	@RequestMapping("/toAddLists")
	public String toAddLists(HttpServletRequest request) {
		return "addLists";
	}
	
	@RequestMapping("/AddLists")
	public String AddLists(Lists lists, HttpServletRequest request) {
		listsService.add(lists);
		return "redirect:/lists/findLists";
	}
	
	@RequestMapping("/UpdateLists")
	public String UpdateLists(int id,HttpServletRequest request) {
		//Lists lists=(Lists) listsService.findById(id);
		Lists lists=new Lists();
		lists.setListname(request.getParameter("listname"));
		listsService.update(lists);
		return "redirect:/lists/findLists";
	}
	
	
	@RequestMapping("/delLists")
	public void delLists(int id, HttpServletRequest request,
			HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (listsService.delete(id)) {
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
