package com.yq.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.yq.bean.User;

public interface UserDao {
	@Insert("insert into tbl_user(uname,upass,head,regtime,gender) value(#{uname},#{upass},#{head},#{regtime},#{gender})")
	public void insert(User user);
	@Select("select * from tbl_user where uname=#{uname} and upass=#{upass}")
	public List<User> login(User user);
	@Select("select * from tbl_user where uname=#{uname}")
	public List<User> check(String uname);
}
