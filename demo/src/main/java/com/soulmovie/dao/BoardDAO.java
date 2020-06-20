package com.soulmovie.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.BoardVO;

@Service
@Transactional
public class BoardDAO {

	@Autowired 
	private SqlSessionFactory sqlFatory = null;
	
	public int insertBoard(BoardVO obj) {
		return sqlFatory.openSession().insert("Board.insertBoard", obj);
	}
}


