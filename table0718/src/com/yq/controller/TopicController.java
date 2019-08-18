package com.yq.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yq.bean.Board;
import com.yq.bean.Topic;
import com.yq.bean.User;
import com.yq.dao.BoardDao;
import com.yq.dao.TopicDao;

@Controller
@RequestMapping("topic")
public class TopicController {
	@Resource
	private TopicDao topicDao;
	
	@Resource
	private BoardDao boardDao;
	
	//ajax分页
	@RequestMapping("ajaxselect")
	@ResponseBody
	public List<Topic> ajaxselect(Topic topic){
		//(page-1)*rows
		//获得从下标是几的记录开始显示
		topic.setBegin((topic.getPage()-1)*topic.getRows());
		List<Topic> list=topicDao.select(topic);
		return list;
	}
	
	
	/*
	 * 查询主帖数据
	 */
	@RequestMapping("select")
	public String select(Topic topic,Model model) {		
		List<Topic> list=topicDao.select(topic);
		model.addAttribute("topics", list);
		model.addAttribute("board", topic);	
		int count=topicDao.selectcount(topic.getBoardid());
		int totalpages=count%topic.getRows()==0?count/topic.getRows():count/topic.getRows()+1;
		model.addAttribute("totalpages", totalpages);
		return "list";
	}
	/*
	 * 添加新帖子
	 */
	@RequestMapping("insert")
	public String insert(Topic topic) {	
		topicDao.insert(topic);	
		return "redirect:/topic/select?boardid="+topic.getBoardid()+"&boardname="+topic.getBoardname();
	}
	
}

