package com.yq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yq.bean.Board;
import com.yq.bean.Topic;
import com.yq.dao.BoardDao;
import com.yq.dao.TopicDao;

@Controller
@RequestMapping("board")
public class BoardController {
	@Resource
	private BoardDao boardDao;
	@Resource
	private TopicDao topicDao;
	/*
	 * 添加板块信息
	 */
	@RequestMapping("insert")
	public String insert(Board board) {
		boardDao.insert(board);
		return "redirect:/board/select";
	}
	
	/*
	 * 查询获得parentid=0 为主板块的集合
	 */
	@RequestMapping("selectone")
	public String selectone(Model model) {
		List<Board> list=boardDao.selectone();
		model.addAttribute("boards", list);
		return "forward:/board.jsp";
	}
	/*
	 * 查询所有模板信息
	 */
	@RequestMapping("select")
	public String select(Model model) {
		List<Board> list=boardDao.select();
		if(list.size()!=0) {
			for(Board b:list) {
				Topic t=new Topic();
				t.setBoardid(b.getBoardid());
				List<Topic> topics=topicDao.select(t);
				if(topics.size()!=0) {
					Topic topic=topics.get(0); 
					b.setTopic(topic);
				}
			}
		}
		model.addAttribute("boards", list);
		return "index";
	}
	/*
	 * 删除模版信息
	 */
	@RequestMapping("delete")
	public String delete(int boardid) {
		boardDao.delete(boardid);
		return "forward:/board/select";
	}
	/*
	 * 修改模版信息预加载
	 */
	@RequestMapping("edit")
	public String edit(int boardid,Model model) {
		Board board =boardDao.edit(boardid);
		model.addAttribute("three", board);
		
		List<Board> list=boardDao.selectone();
		model.addAttribute("boards", list);
		return "forward:/boardEdit.jsp";
	}
	/*
	 * 修改模版信息
	 */
	@RequestMapping("update")
	public String update(Board board) {
		boardDao.update(board);
		return "forward:/board/select";
	}

}
