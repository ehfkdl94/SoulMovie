package com.soulmovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.ChoiceVO;
//import com.soulmovie.vo.MovieVO;


public interface ChoiceMapper {

@Insert({"INSERT INTO CHOICE (CHOICE_NO, CHOICE_FREQ, CHOICE_REASON, CHOICE_CATEGORY, CHOICE_DATE, CHOICE_CODE, CHOICE_ID)" + 
		"VALUES (SEQ_CHOICE_NO.NEXTVAL, #{obj.choice_freq}, #{obj.choice_reason}," + 
		"#{obj.choice_category}, SYSDATE, #{obj.choice_code}, #{obj.choice_id})"})
public int insertChoice(@Param("obj") ChoiceVO obj);

@Select({"SELECT MEMBER.USERNICK, T1.MOVIE_TITLE, T1.CHOICE_REASON, T1.CHOICE_CATEGORY, T1.CHOICE_DATE, T1.CHOICE_ID "
		+ "FROM MEMBER" + 
		"INNER JOIN " + 
		"(SELECT MOVIE.MOVIE_TITLE, CHOICE.CHOICE_REASON, CHOICE.CHOICE_CATEGORY, CHOICE.CHOICE_DATE, CHOICE.CHOICE_ID, "
		+ "ROW_NUMBER() OVER (ORDER BY CHOICE_NO DESC) ROWN " + 
		"FROM MOVIE" + 
		"INNER JOIN" + 
		"CHOICE" + 
		"ON CHOICE.CHOICE_CODE = MOVIE.MOVIE_CODE) T1" + 
		"ON MEMBER.USERID = T1.CHOICE_ID WHERE USERID = #{userid}"})
public List<ChoiceVO> selectChoiceList(@Param("userid") int userid);
}
