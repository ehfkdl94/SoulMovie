package com.soulmovie.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.ContactVO;

public interface ContactMapper {
	@Insert({"INSERT INTO CONTACT (CNO, CNAME, CEMAIL, CSUBJECT, CMESSAGE, CDATE)" + 
			"VALUES (SEQ_CONTACT_NO.NEXTVAL, #{obj.cname}," + 
			"#{obj.cemail}, #{obj.csubject}, #{obj.cmessage}, SYSDATE)"})
	public int insertContact(@Param("obj") ContactVO obj);
	
	@Select({"SELECT * FROM" , 
			"(SELECT" , 
			"CNO, CNAME, CEMAIL, CSUBJECT, CMESSAGE, CDATE," , 
			"ROW_NUMBER() OVER (ORDER BY CNO DESC) ROWN" , 
			"FROM " , 
			"CONTACT" , 
			"WHERE" , 
			"CNAME LIKE '%' || #{text} || '%')" , 
			"WHERE ROWN BETWEEN #{start} AND #{end}"})
	public List<ContactVO> selectContact(HashMap<String, Object> map);
	
	@Select({"SELECT COUNT(*) FROM CONTACT WHERE CNAME LIKE '%' || #{text} || '%' "})
	public int countContact(String text);
	
	@Select({"SELECT * FROM CONTACT WHERE CNO=#{no}"})
	public ContactVO selectContactOne(int no);
	
	
}
