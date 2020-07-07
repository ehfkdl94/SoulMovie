package com.soulmovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.soulmovie.vo.ChoiceVO;
import com.soulmovie.vo.insertDateVO;




public interface ChoiceMapper {

	@Insert({"INSERT INTO CHOICE (CHOICE_NO, CHOICE_FREQ, CHOICE_REASON, CHOICE_CATEGORY, CHOICE_DATE, CHOICE_CODE, CHOICE_ID)" + 
			"VALUES (SEQ_CHOICE_NO.NEXTVAL, #{obj.choice_freq}, #{obj.choice_reason}," + 
			"#{obj.choice_category}, SYSDATE, #{obj.choice_code}, #{obj.choice_id})"})
	public int insertChoice(@Param("obj") ChoiceVO obj);
	
	
	@Select({"SELECT * FROM CHOICE WHERE CHOICE_NO = #{choice_code}"})
	public ChoiceVO selectChoice(@Param("choice_code") int choice_code);
	
	@Select({"SELECT MOVIE_TITLE FROM MOVIE WHERE MOVIE_CODE = #{choice_code}"})
	public String selectMovieTitle(@Param("choice_code") int choice_code);
	
	@Select({"<script>",
			"SELECT * FROM " ,
			"(SELECT MOVIE.MOVIE_TITLE, MOVIE.MOVIE_IMG, CHOICE.CHOICE_NO, CHOICE.CHOICE_FREQ, CHOICE.CHOICE_REASON, CHOICE.CHOICE_CATEGORY, CHOICE.CHOICE_DATE, CHOICE.CHOICE_ID, CHOICE.CHOICE_CODE,", 
			"ROW_NUMBER() OVER (ORDER BY CHOICE_NO DESC) ROWN FROM MOVIE " ,
			"INNER JOIN CHOICE " ,
			"ON CHOICE.CHOICE_CODE = MOVIE.MOVIE_CODE) WHERE CHOICE_ID = #{userid}",
			"</script>"})
	public List<ChoiceVO> selectChoiceList(@Param("userid") int userid);
	
	
	@Update({"UPDATE CHOICE SET CHOICE_FREQ = #{obj.choice_freq}, CHOICE_REASON=#{obj.choice_reason}, CHOICE_CATEGORY = #{obj.choice_category}"
			+ "WHERE CHOICE_NO = #{obj.choice_no}"})
	public int updateChoice(@Param("obj") ChoiceVO obj);
	
	@Select({"SELECT substr(CHOICE_DATE,0,8) CHOICEDATE, count(*) COUNT FROM CHOICE group by substr(CHOICE_DATE,0,8) ORDER BY CHOICEDATE"})
	public List<insertDateVO> InsertDate();
	
	@Delete({"DELETE FROM CHOICE WHERE CHOICE_NO = #{choiceno}"})
	public int deleteChoice(@Param("choiceno") int choiceno);

	@Select({"SELECT CHOICE_ID FROM CHOICE WHERE CHOICE_NO=#{choiceno}"})
	public int findChoiceId(@Param("choiceno") int choiceno);
	
	@Select({"SELECT CHOICE_CODE FROM CHOICE WHERE CHOICE_NO=#{choiceno}"})
	public int findChoiceCode(@Param("choiceno") int choiceno);
	
	@Select({"SELECT COUNT(*) FROM CHOICE WHERE CHOICE_ID = #{choice_id} AND CHOICE_CODE = #{choice_code}"})
	public int checkChoiceCode(@Param("choice_id") int choice_id, @Param("choice_code") int choice_code);
	
}




