package com.soulmovie.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soulmovie.vo.MemberVO;

@Service
@Transactional
public class MemberDAO {
	
	@Autowired
	private SqlSessionFactory sqlFactory = null;
	
	
	public List<MemberVO> selectMember(HashMap<String, Object> map) {
		return sqlFactory.openSession().selectList("Member.selectList", map);
	}
	
	public int countMember(String text) {
		return sqlFactory.openSession().selectOne("Member.count", text);
	}
}
