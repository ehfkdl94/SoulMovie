package com.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.example.vo.UserVo;

public interface UserMapper {
	@Insert({"INSERT INTO MEMBER VALUES(MY_GET_SEQ_MEMBER_NUMBER,#{obj.password},"
			,"#{obj.userrname},#{obj.usernick},#{obj.userage},#{obj.usergender},#{obj.useremail},"
			, "#{obj.userccnt},#{obj.admin},SYSDATE,#{obj.username})"})
	public int insertMember(@Param("obj") UserVo obj);
	
	@Select({"SELECT * FROM MEMBER WHERE USERNAME=#{username}"})
	public UserVo findByUsername(@Param("username") String username);
}
