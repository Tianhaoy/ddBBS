package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.yq.bean.Board;

public interface BoardDao {
	@Insert("insert into tbl_board(boardname,parentid,is_delete) value(#{boardname},#{parentid},#{is_delete})")
	public void insert(Board board);
	@Select("select *,(select count(*)from tbl_topic where boardid=tbl_board.boardid) count from tbl_board ")
	public List<Board> select();
	@Select("select * from tbl_board where parentid=0")
	public List<Board> selectone();
	@Select("select * from tbl_board where parentid!=0")
	public List<Board> selecttwo();
	@Delete("delete from tbl_board where boardid=#{boardid}")
	public void delete(int boardid);
	@Select("select * from tbl_board where boardid=#{boardid}")
	public Board edit(int boardid);
	@Update("update tbl_board set boardname=#{boardname},parentid=#{parentid} where boardid=#{boardid}")
	public void update(Board board);
}
