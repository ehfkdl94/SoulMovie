package com.soulmovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.soulmovie.vo.MovieVO;

public interface MovieMapper {
	@Select({"SELECT MOVIE_CODE, MOVIE_TITLE, MOVIE_DATE FROM MOVIE WHERE MOVIE_TITLE LIKE '%'|| #{text} ||'%'"})
	public List<MovieVO> selectMovie(@Param("text") String text);
	
	@Select({"SELECT MOVIE_TITLE FROM MOVIE WHERE MOVIE_CODE=#{chk}"})
	public String findMovieTitle(@Param("chk") String chk);
	
	@Update({"UPDATE MOVIE SET MOVIE_CNT = MOVIE_CNT + 1 WHERE MOVIE_CODE=#{choice_code}"})
	public int addMovieCnt(@Param("choice_code") int choice_code);

	@Update({"UPDATE MOVIE SET MOVIE_CNT = MOVIE_CNT - 1 WHERE MOVIE_CODE=#{choice_code}"})
	public int deleteMovieCnt(@Param("choice_code") int choice_code);
}
