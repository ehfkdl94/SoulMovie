package com.soulmovie.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soulmovie.vo.MovieVO;

public interface HomeMapper {
	@Insert({"INSERT INTO USER1 VALUES(MY_GET_SEQ_NUMBER, #{obj.username}, ",
	"#{obj.password}, #{obj.role}, SYSDATE)"})
	public int insertMember(@Param("obj") MovieVO obj);
	
	
//	@Select({"SELECT * FROM" , 
//			"			(SELECT " , 
//			"				MOVIE_CODE, MOVIE_TITLE, MOVIE_DATE, MOVIE_NATION, MOVIE_GENRE, MOVIE_DIRECTOR, MOVIE_ACTOR, MOVIE_CNT, MOVIE_FREQ" , 
//			"				ROW_NUMBER() OVER (ORDER BY MOVIE_CNT DESC) ROWN " , 
//			"			FROM " , 
//			"				MOVIE" , 
//			"			WHERE)" , 
//			"		WHERE ROWN BETWEEN 1 AND 6"})
//	public List<MovieVO> homeMovie();
	
	@Select({"SELECT MOVIE_CODE, MOVIE_IMG FROM MOVIE WHERE MOVIE_CODE=#{no}"})
	public MovieVO selectBoardImg1(int no);

}
