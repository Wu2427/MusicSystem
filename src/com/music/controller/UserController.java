package com.music.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.music.entity.User;
import com.music.service.AdminService;
import com.music.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	private AdminService adminService;
	
	@ResponseBody
	@RequestMapping("/getAllUser")
	public List<User> getAllUser(HttpServletRequest request) {
		List<User> findAllList = userService.findAll();
		request.setAttribute("userList", findAllList);
		return findAllList;
	}

	@RequestMapping("/toAddUser")
	public String toAddUser(HttpServletRequest request) {
		return "user/signup";
	}

	
	@RequestMapping("/addUser")
	public String addUser(@RequestParam("username") String username, 
			@RequestParam("userpwd") String userpwd) {
		User user = new User();
		user.setUsername(username);
		user.setUserpwd(userpwd);
		userService.add(user);
		return "user/loginUser";
	}

	@RequestMapping("/updateUser")
	public String updateUser(int id, HttpServletRequest request) {
		    User user = userService.findById(id);
		    user.setUsername(request.getParameter("username"));
		    user.setUserpwd(request.getParameter("userpwd"));
			userService.update(user);
			request.setAttribute("user", user);
			return "user/index";
	}

	@RequestMapping("/getUser")
	public String getUser(int id, HttpServletRequest request) {
		request.setAttribute("user", userService.findById(id));
		return "user/profile";
	}

	@RequestMapping("/delUser")
	public void delUser(int id, HttpServletRequest request, HttpServletResponse response) {
		String result = "{\"result\":\"error\"}";
		if (userService.delete(id)) {
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
/*	
	@RequestMapping("/loginUser")
	public String loginUser(@RequestParam("username") String username, 
			@RequestParam("userpwd") String userpwd,HttpServletRequest request) {
		String type=request.getParameter("type");
		//request.getParameter("")
		if(type=="user"){
			List<User> users = userService.findUserAndPwd(username); 
			for(User user : users){
				if(username.equals(user.getUsername()) && userpwd.equals(user.getUserpwd())){
					request.getSession().setAttribute("username", user.getUsername());
					request.getSession().setAttribute("userid", user.getId());
					type= "user/index";
				}
				else{
					type= "user/fail";
				}
			}
		}else if(type=="admin"){
			String adminname=request.getParameter("adminname");
			String adminpwd=request.getParameter("adminpwd");
			List<Admin> admins = adminService.findAll(adminname);
			for(Admin admin : admins){
				if(adminname.equals(admin.getAdminname()) && adminpwd.equals(admin.getAdminpwd())){
					request.getSession().setAttribute("adminid", admin.getId());
					type= "admin/adminindex";
				}
			}
			type= "admin/404";
		}
		return type;
	}
	*/
	
	@RequestMapping("/loginUser")
	public String loginUser(@RequestParam("username") String username, 
			@RequestParam("userpwd") String userpwd,HttpServletRequest request) {
			List<User> users = userService.findUserAndPwd(username); 
			for(User user : users){
				if(username.equals(user.getUsername()) && userpwd.equals(user.getUserpwd())){
					request.getSession().setAttribute("username", user.getUsername());
					request.getSession().setAttribute("userid", user.getId());
					return "user/index";
				}
			}
			return "user/fail";
		}
			
		@RequestMapping("/logout")
		public String logout(HttpSession session){
			session.invalidate();
			return "user/loginUser";
		}
}
