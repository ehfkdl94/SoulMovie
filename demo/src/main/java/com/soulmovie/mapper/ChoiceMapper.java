package com.soulmovie.mapper;

import org.apache.ibatis.annotations.Insert;

import com.soulmovie.vo.ChoiceVO;

public interface ChoiceMapper {

@Insert({"INSERT INTO CHOICE"
		+ "(CHOICE_NO, CHOICE_FREQ, CHOICE_REASON, CHOICE_CATEGORY, CHOICE_DATE, CHOICE_CODE, CHOICE_ID)" + 
		"VALUES (SEQ_CHOICE_NO.NEXTVAL, #{obj.choice_freq}, #{obj.choice_reason}," + 
		"		#{obj.choice_category}, SYSDATE, #{obj.choice_code}, #{choice_id})"})
public int insertChoice(ChoiceVO obj);
}

