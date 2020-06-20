package com.soulmovie.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.UserVo;

public interface UserMapper {
	@Insert({"INSERT INTO MEMBER(USERID, USERNAME, PASSWORD, USERRNAME, USERGENDER, USERNICK, USERAGE, USEREMAIL, JOINDATE)"
			," VALUES (MY_GET_SEQ_MEMBER_NUMBER,#{obj.username}, #{obj.password},#{obj.userrname},#{obj.usergender},"
					+ "#{obj.usernick},#{obj.userage},#{obj.useremail},SYSDATE )"})
	public int insertMember(@Param("obj") UserVo obj);
	
	
	@Select({"SELECT * FROM MEMBER WHERE USERNAME=#{username}"})
	public UserVo findByUsername(@Param("username") String username);
	
	
	@Select({"SELECT USERID, USERNAME FROM MEMBER" 
			+ "WHERE USERNAME=#{username} AND PASSWORD=#{password}"})
	public UserVo selectMemberLogin(@Param("obj") UserVo obj);
}
