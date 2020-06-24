package com.soulmovie.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.BoardVO;
import com.soulmovie.vo.ChoiceVO;
import com.soulmovie.vo.MovieVO;

@Service
@Transactional
public class MovieDAO {
	
	@Autowired
	private SqlSessionFactory sqlFactory = null;
	
	public List<ChoiceVO> selectMoiveReview(int movie_code) {
		return sqlFactory.openSession().selectList("Movie.selectMoiveReview",movie_code); //영화 상세정보 출력
	}
	
	
	public MovieVO selectMovieOne(int movie_code) {
		return sqlFactory.openSession().selectOne("Movie.moviedetail",movie_code); //영화 상세정보 출력
	}
	
	public MovieVO selectMovieOne1(int movie_code) {
		return sqlFactory.openSession().selectOne("Movie.moviecontent",movie_code); //영화 상세정보 출력
	}
	
	public List<MovieVO> selectMovie() {
		return sqlFactory.openSession().selectList("Movie.movielist");
	}
	public List<MovieVO> selectPageMovieText(HashMap<String, Object> map) {
		return sqlFactory.openSession().selectList("Movie.moviepagelistText",map);
	}
	public List<MovieVO> selectPageMovieGenre(HashMap<String, Object> map) {
		return sqlFactory.openSession().selectList("Movie.moviepagelistGenre",map);
	}
	
	public List<MovieVO> selectMovie1(HashMap<String, Object> map) {
		return sqlFactory.openSession().selectList("Movie.movielist1", map);
	}
	
	public int countBoard(String text) {
		return sqlFactory.openSession().selectOne("Movie.count",text);
	}
	
	public int deleteMovie(MovieVO obj) {
		return sqlFactory.openSession().delete("Movie.deleteMovie", obj);
	}
	
	public int countMovie(String text) {
		return sqlFactory.openSession().selectOne("Movie.count", text);
	}
	public ChoiceVO countMovieFreq(int no) {
		return sqlFactory.openSession().selectOne("Movie.moviefreq", no);
	}

}
