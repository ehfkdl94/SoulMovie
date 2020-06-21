package com.soulmovie.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.ChoiceVO;
import com.soulmovie.vo.UserVo;

public interface ChoiceMapper {

@Insert({"INSERT INTO CHOICE (CHOICE_NO, CHOICE_FREQ, CHOICE_REASON, CHOICE_CATEGORY, CHOICE_DATE, CHOICE_CODE, CHOICE_ID)" + 
		"VALUES (SEQ_CHOICE_NO.NEXTVAL, #{obj.choice_freq}, #{obj.choice_reason}," + 
		"#{obj.choice_category}, SYSDATE, #{obj.choice_code}, #{obj.choice_id})"})
public int insertChoice(@Param("obj") ChoiceVO obj);

@Select({"SELECT * FROM CHOICE WHERE CHOICE_ID=#{userid}"})
public ChoiceVO selectChoiceList(@Param("userid") int userid);
}
