package com.soulmovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.MovieVO;

@Service
@Transactional
public class MovieDAO {
	
	@Autowired
	private SqlSessionFactory sqlFatory = null;
	public MovieVO selectMovieOne(int movie_code) {
		return sqlFatory.openSession().selectOne("Movie.moviedetail",movie_code); //영화 상세정보 출력
	}
	public List<MovieVO> selectMovie() {
		return sqlFatory.openSession().selectList("Movie.movielist");
	}
}
