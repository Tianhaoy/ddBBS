package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.yq.bean.Topic;

public interface TopicDao {
	@Select("select t.*,u.uname from tbl_topic t,tbl_user u where t.userid=u.userid "
			+ " and t.boardid=#{boardid} order by t.publishtime desc limit #{begin},#{rows}")
	public List<Topic> select(Topic topic);
	@Insert("insert into tbl_topic(title,content,publishtime,modifytime,userid,boardid) value(#{title},#{content},now(),now(),#{userid},#{boardid})")
	public void insert(Topic topic);
	
	@Select("select count(*) from tbl_topic where boardid=#{boardid}")
	public int selectcount( int boardid);
	
	@Select("select t.*,u.head,u.uname,u.regtime from tbl_topic t,tbl_user u where t.userid=u.userid and topicid=#{topicid}")
	public List<Topic> selectid(int topicid);
	
	
}
