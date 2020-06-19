package com.soulmovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.MovieVO;



@Service
@Transactional
public class HomeDAO {
	@Autowired // @Bean�쑝濡� 留뚮뱾�뼱吏� 媛앹껜瑜� 諛쏆븘�샂.
	private SqlSessionFactory sqlFatory = null;
	
	public List<MovieVO> selectBoard() {
		return sqlFatory.openSession().selectList("Home.homelist");
	}
	
	public MovieVO selectBoardImg(int no) {
		return sqlFatory.openSession().selectOne("Home.selectMovieImg", no);
	}
}
