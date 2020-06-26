package com.soulmovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.security.core.userdetails.User;

import com.soulmovie.vo.MovieVO;

public interface MovieMapper {
	@Select({"SELECT MOVIE_CODE, MOVIE_TITLE, MOVIE_DATE, MOVIE_IMG FROM MOVIE WHERE REPLACE(UPPER(MOVIE_TITLE),' ','') LIKE '%'|| UPPER(TRIM(#{text})) ||'%' "
			, "AND MOVIE_CODE NOT IN (SELECT CHOICE_CODE FROM CHOICE,MEMBER WHERE CHOICE_ID = USERID AND USERNAME= #{user} )"})
	public List<MovieVO> selectMovie(@Param("text") String text, @Param("user") String user);
	
	@Select({"SELECT MOVIE_TITLE FROM MOVIE WHERE MOVIE_CODE=#{chk}"})
	public String findMovieTitle(@Param("chk") String chk);
	
	@Update({"UPDATE MOVIE SET MOVIE_CNT = MOVIE_CNT + 1 WHERE MOVIE_CODE=#{choice_code}"})
	public int addMovieCnt(@Param("choice_code") int choice_code);

	@Update({"UPDATE MOVIE SET MOVIE_CNT = MOVIE_CNT - 1 WHERE MOVIE_CODE=#{choice_code}"})
	public int deleteMovieCnt(@Param("choice_code") int choice_code);
}
