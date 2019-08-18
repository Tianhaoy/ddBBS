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
	 * ע������û���Ϣ
	 */
	@RequestMapping("insert")
	public String insert(MultipartFile up ,User u,HttpServletRequest request) {
		//��ȡ�ļ��Ĵ�С
		long size=up.getSize();		
		if(size>0) {
			//���ѡ���ļ����ļ���
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
	 * ��¼��֤�û���Ϣ
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
	@ResponseBody //�ı�ҳ�����Ӧ��ʽ����תҳ���Ϊ��ָ����ʽ��ǰҳ�淵������
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
