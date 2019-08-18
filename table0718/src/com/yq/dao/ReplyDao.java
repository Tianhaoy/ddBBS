package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.bean.Reply;


public interface ReplyDao {
	@Select("select r.*,u.head,u.uname,u.regtime from tbl_reply r,tbl_user u where r.userid=u.userid and topicid=#{topicid} order by r.publishtime desc limit #{begin},#{rows} ")
	public List<Reply> select(Reply reply);
	@Insert("insert into tbl_reply(title,content,publishtime,modifytime,userid,topicid) value(#{title},#{content},now(),now(),#{userid},#{topicid})")
	public void insert(Reply reply);
	@Select("select count(*) from tbl_reply where topicid=#{topicid}")
	public int selectcount(int topicid);
	@Select("select r.*,u.head,u.uname,u.regtime from tbl_reply r,tbl_user u where r.userid=u.userid and topicid=#{topicid} order by r.publishtime desc  ")
	public List<Reply> selectid(int topicid);
	@Delete("delete from tbl_reply where replyid=#{replyid}")
	public void delete(int replyid);
	@Update("update tbl_reply set title=#{title},content=#{content},modifytime=now() where replyid=#{replyid}")
	public void update(Reply reply);
	@Select("select * from tbl_reply where replyid=#{replyid}")
	public Reply edit(int replyid);
}
