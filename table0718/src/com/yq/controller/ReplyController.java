package com.yq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yq.bean.Reply;
import com.yq.bean.Topic;
import com.yq.dao.ReplyDao;
import com.yq.dao.TopicDao;

@Controller
@RequestMapping("reply")
public class ReplyController {
	@Resource
	private ReplyDao replyDao;
	@Resource
	private TopicDao topicDao;
	
	/*
	 * ��ѯ �ظ�����������
	 */
	@RequestMapping("select")
	public String select(Reply reply,Model model) {
		List<Reply> list1=replyDao.select(reply);		
		model.addAttribute("rs", list1);
		List<Topic> list2=topicDao.selectid(reply.getTopicid());
		model.addAttribute("ts", list2);
		int count=replyDao.selectcount(reply.getTopicid());
		int totalpages=count%reply.getRows()==0?count/reply.getRows():count/reply.getRows()+1;
		model.addAttribute("totalpages", totalpages);
		return "detail";

	}
	/*
	 * ��� �ظ�������
	 */
	@RequestMapping("insert")
	public String insert(Reply reply) {
		replyDao.insert(reply);
		return "redirect:/reply/select?topicid="+reply.getTopicid();
	}
	/*
	 * ajax��ҳ
	 */
	@RequestMapping("ajaxselect")
	@ResponseBody
	public List<Reply> ajaxselect(Reply reply) {
		reply.setBegin((reply.getPage()-1)*reply.getRows());
		List<Reply> list =replyDao.select(reply);
		return list;
	}
	/*
	 * ɾ������
	 */
	@RequestMapping("delete")
	public String delete(Reply reply) {
		replyDao.delete(reply.getReplyid());
		return "forward:/reply/select";
	}
	/*
	 * Ԥ�޸�
	 */
	@RequestMapping("edit")
	public String  edit(Reply reply,Model model) {
		Reply r=replyDao.edit(reply.getReplyid());
		model.addAttribute("replys", r);
		return "forward:/update.jsp?replyid="+reply.getReplyid();
	}
		
	/*
	 * �޸Ļ���
	 */
	@RequestMapping("update")
	public String update(Reply reply) {
		replyDao.update(reply);
		return "redirect:/reply/select?topicid="+reply.getTopicid();
	}

}
