package com.soulmovie.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.BoardChatVO;
import com.soulmovie.vo.BoardVO;

@Service
@Transactional
public class BoardDAO {

   @Autowired 
   private SqlSessionFactory sqlFactory = null;
   
   
   public List<BoardChatVO> selectChat(int no) {
      return sqlFactory.openSession().selectList("Board.selectChat", no);
   }
   public int insertBoardChat(BoardChatVO obj) {
      System.out.println(obj.toString()+"오비제이");
      
      return sqlFactory.openSession().insert("Board.insertBoardChat", obj);
   }
   public int insertBoard(BoardVO obj) {
      return sqlFactory.openSession().insert("Board.insertBoard", obj);
   }
   public int insertLikeBoard(BoardVO obj) {
      return sqlFactory.openSession().insert("Board.insertLikeBoard", obj);
   }
   public int updateHit(int no) {
      return sqlFactory.openSession().update("Board.updateHit", no);
   }
   public int updateBoardChat(BoardChatVO obj) {
      System.out.println(obj.toString()+"dbdb딥");
      return sqlFactory.openSession().update("Board.updateBoardChat", obj);
   }
   
   public int selecttLikeBoard(BoardVO obj) {
      return sqlFactory.openSession().selectOne("Board.selecttLikeBoard", obj);
   }
   public int LikeCheck(BoardVO obj) {
      if(sqlFactory.openSession().selectOne("Board.LikeCheck", obj) ==null) {
         return 0;
      }
      return sqlFactory.openSession().selectOne("Board.LikeCheck", obj);
   }
   
   public BoardVO selectBoardOne(int no) {
      return sqlFactory.openSession().selectOne("Board.selectBoardOne", no);
   }
   public BoardVO insertSelectBoard() {
      return sqlFactory.openSession().selectOne("Board.insertSelectBoard");
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
   
   public List<BoardVO> selectBoard1(HashMap<String, Object> map) {
      return sqlFactory.openSession().selectList("Board.selectList1", map);
   }
   
   public int countBoard(String text) {
      return sqlFactory.openSession().selectOne("Board.count", text);
   }
   
   public int updateBoard(BoardVO obj) {
      return sqlFactory.openSession().update("Board.updateBoardOne", obj);
   }
   public int updateLikeBoard(BoardVO obj) {
      return sqlFactory.openSession().update("Board.updateLikeBoard", obj);
   }
   public int updateLikeBoard2(BoardVO obj) {
      return sqlFactory.openSession().update("Board.updateLikeBoard2", obj);
   }
   
   public BoardVO selectBoardImg(int no) {
      return sqlFactory.openSession().selectOne("Home.selectBoardImg", no);
   }

   public int deleteBoard(BoardVO obj) {
      return sqlFactory.openSession().delete("Board.deleteBoard", obj);
   }
   public int deleteBoardChat(int no) {
      return sqlFactory.openSession().delete("Board.deleteBoardChat", no);
   }
   public int deleteLikeBoard(BoardVO obj) {
      return sqlFactory.openSession().delete("Board.deleteLikeBoard", obj);
   }
   
  
   public int selectuserid(String username) {
      return sqlFactory.openSession().selectOne("Board.selectuserid", username);
   }

   public int findId(String username) {
      return sqlFactory.openSession().selectOne("Board.findId", username);
   }
   
   
}


