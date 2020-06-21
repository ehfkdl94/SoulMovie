package com.soulmovie.dao;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.BoardVO;

@Service
@Transactional
public class BoardDAO {

	@Autowired 
	private SqlSessionFactory sqlFactory = null;
	
	public int insertBoard(BoardVO obj) {
		return sqlFactory.openSession().insert("Board.insertBoard", obj);
	}

	public int updateHit(int no) {
		return sqlFactory.openSession().update("Board.updateHit", no);
	}

	public BoardVO selectBoardOne(int no) {
		return sqlFactory.openSession().selectOne("Board.selectBoardOne", no);
	}
	
	public int selectBoardPrev(int no) {
		return sqlFactory.openSession().selectOne("Board.selectBoardPrev", no);
	}
	
	public int selectBoardNext(int no) {
		return sqlFactory.openSession().selectOne("Board.selectBoardNext", no);
	}
	
	public List<BoardVO> selectBoard(HashMap<String, Object> map) {
		return sqlFactory.openSession().selectList("Board.selectList", map);
	}
	
	public int countBoard(String text) {
		return sqlFactory.openSession().selectOne("Board.count", text);
	}
	
	public int updateBoard(BoardVO obj) {
		return sqlFactory.openSession().update("Board.updateBoardOne", obj);
	}

	public BoardVO selectBoardImg(int no) {
		return sqlFactory.openSession().selectOne("Board.selectBoardImg", no);
	}

	public int deleteBoard(BoardVO obj) {
		return sqlFactory.openSession().delete("Board.deleteBoard", obj);
	}
}


