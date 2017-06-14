package com.music.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.music.entity.Admin;
import com.music.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping("/getAdmin")
	public String getAdmin(int id,HttpServletRequest request) {
		request.setAttribute("admin", adminService.findById(id));
		return "admin/editAdmin";
	}
	
	@RequestMapping("/updateAdmin")
	public String updateAdmin(int id,HttpServletRequest request) {
			Admin admin=adminService.findById(id);
			admin.setAdminname(request.getParameter("adminname"));
			admin.setAdminpwd(request.getParameter("adminpwd"));
			adminService.update(admin);
			request.setAttribute("admin", admin);
			return "admin/adminindex";
	}
	
	@RequestMapping("/loginAdmin")
	public String loginAdmin(@RequestParam("adminname") String adminname, 
			@RequestParam("adminpwd") String adminpwd,
			HttpServletRequest request) {
		List<Admin> admins = adminService.findAll(adminname);
		for(Admin admin : admins){
			if(adminname.equals(admin.getAdminname()) && adminpwd.equals(admin.getAdminpwd())){
				request.getSession().setAttribute("adminid", admin.getId());
				return "admin/adminindex";
			}
		}
		return "admin/404";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "admin/adminLogin";
	}
}
