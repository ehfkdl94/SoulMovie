package com.soulmovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.MovieVO;

@Service
@Transactional
public class movieDAO {
	
	@Autowired
	private SqlSessionFactory sqlFatory = null;
	public List<MovieVO> selectBoard() {
		return sqlFatory.openSession().selectList("Movie.moviedetail"); //영화 상세정보 출력
	}
}
