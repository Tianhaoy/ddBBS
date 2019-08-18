package com.yq.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yq.bean.User;
import com.yq.dao.UserDao;

@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserDao userDao;
	
	/*
	 * 注册添加用户信息
	 */
	@RequestMapping("insert")
	public String insert(MultipartFile up ,User u,HttpServletRequest request) {
		//获取文件的大小
		long size=up.getSize();		
		if(size>0) {
			//获得选择文件的文件名
			String filename=up.getOriginalFilename();
			String realpath=request.getRealPath("image/head");
			File dest=new File(realpath, filename);
			try {
				up.transferTo(dest);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			u.setHead(filename);
		}


		
		String regtime=new Date().toLocaleString();
		u.setRegtime(regtime);
		userDao.insert(u);
		return "login";
	}
	/*
	 * 登录验证用户信息
	 */
	@RequestMapping("login")
	public String login(User u,Model model,HttpSession session) {
		List<User> list=userDao.login(u);
		if(list.size()==0) {
//			model.addAttribute("user", list);
			return "login";
		}
		session.setAttribute("u", list.get(0));
		return "forward:/board/select";
		
	}
	/*
	 * 
	 */
	@RequestMapping("check")
	@ResponseBody //改变页面的响应方式由跳转页面变为以指定格式像当前页面返回数据
	public List<User> check(String uname) {
		List<User> list=userDao.check(uname);
		return list;
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("u");
		return "forward:/board/select";
	}
}
