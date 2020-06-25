package com.soulmovie.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.soulmovie.vo.ContactVO;

public interface ContactMapper {
	@Insert({"INSERT INTO CONTACT (CNO, CNAME, CEMAIL, CSUBJECT, CMESSAGE, CDATE)" + 
			"VALUES (SEQ_CONTACT_NO.NEXTVAL, #{obj.cno}, #{obj.cname}," + 
			"#{obj.cemail}, #{obj.cmessage}, SYSDATE)"})
	public int insertContact(@Param("obj") ContactVO obj);
}
