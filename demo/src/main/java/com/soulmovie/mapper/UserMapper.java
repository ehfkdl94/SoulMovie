package com.soulmovie.mapper;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.soulmovie.vo.UserVo;

public interface UserMapper {
	@Insert({"INSERT INTO MEMBER(USERID, USERNAME, PASSWORD, USERRNAME, USERGENDER, USERNICK, USERAGE, USEREMAIL, ADMIN, JOINDATE)"
			," VALUES (MY_GET_SEQ_MEMBER_NUMBER,#{obj.username}, #{obj.password},#{obj.userrname},#{obj.usergender},"
					+ "#{obj.usernick},#{obj.userage},#{obj.useremail},#{obj.admin},SYSDATE )"})
	
	public int insertMember(@Param("obj") UserVo obj);
	@Select({"SELECT USERNICK FROM MEMBER WHERE USERNAME=#{username}"})
	public String findUserNick(@Param("username") String username);
	
	@Select({"SELECT * FROM MEMBER WHERE USERNAME=#{username}"})
	public UserVo findByUsername(@Param("username") String username);
	
	@Select({"SELECT USERCCNT FROM MEMBER WHERE USERNAME=#{username}"})
	public int findUserCcnt(@Param("username") String username);
	
	
	@Select({"SELECT USERID FROM MEMBER WHERE USERNAME =#{username}"})
	public int findUserid(@Param("username") String username);
	@Select({"SELECT USERNICK FROM MEMBER WHERE USERID=#{username}"})
	public String findtoUseridFromUsername(@Param("username") int username);
	
	@Update({"UPDATE MEMBER SET USERNICK = #{obj.usernick}, USERAGE = #{obj.userage}, USERGENDER=#{obj.usergender}, USEREMAIL = #{obj.useremail}"
			+ "WHERE USERNAME = #{obj.username}"})
	public int updateMember(@Param("obj") UserVo obj);
	
	
	@Select({"<script>",
			"SELECT COUNT(*) FROM MEMBER WHERE USERNAME=#{username}",
		"</script>"
	})
	public int selectMemberId(@Param("username") String username);
	
	@Select({"<script>",
		"SELECT COUNT(*) FROM MEMBER WHERE USERNICK=#{usernick}",
	"</script>"
	})
	public int selectMemberNick(@Param("usernick") String usernick);
	
	
	@Update({"UPDATE MEMBER SET USERCCNT = USERCCNT + 1" + 
	"      WHERE USERID = #{userid}"})
	public int updateUserCcnt(@Param("userid") int userid);
	
	
	
	@Update({"UPDATE MEMBER SET USERCCNT = USERCCNT - 1" + 
	"      WHERE USERID = #{userid}"})
	public int deleteUserCcnt(@Param("userid") int userid);

	@Update({"UPDATE MEMBER SET PASSWORD = #{obj.password}" +
			"      WHERE USERNAME = #{obj.username}"})
	public int updateUserPassword(@Param("obj") UserVo obj );
	
	}





	
