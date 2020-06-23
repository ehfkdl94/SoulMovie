package com.soulmovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.MovieVO;

public interface MovieMapper {
	@Select({"SELECT MOVIE_CODE, MOVIE_TITLE, MOVIE_DATE FROM MOVIE WHERE MOVIE_TITLE LIKE '%'|| #{text} ||'%'"})
	public List<MovieVO> selectMovie(@Param("text") String text);
	
	@Select({"SELECT MOVIE_TITLE FROM MOVIE WHERE MOVIE_CODE=#{chk}"})
	public String findMovieTitle(@Param("chk") String chk);
}
