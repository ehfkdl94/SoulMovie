package com.soulmovie.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.UserVo;

public interface UserMapper {
	@Insert({"INSERT INTO MEMBER(USERID, USERNAME, PASSWORD, USERRNAME, USERNICK, USERAGE, USERGENDER, USEREMAIL ADMIN, JOINDATE)"
			," VALUES (MY_GET_SEQ_MEMBER_NUMBER,#{obj.username}, #{obj.password},#{obj.userrname},#{obj.usernick},#{obj.userage},"
					+ "#{obj.usergender},#{obj.useremail},#{obj.admin},SYSDATE )"})
	public int insertMember(@Param("obj") UserVo obj);
	
	@Select({"SELECT * FROM MEMBER WHERE USERNAME=#{username}"})
	public UserVo findByUsername(@Param("username") String username);
	
	
}
