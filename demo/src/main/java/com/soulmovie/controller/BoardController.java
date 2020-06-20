package com.soulmovie.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.soulmovie.dao.BoardDAO;
import com.soulmovie.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardDAO bDAO =null;
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertBoard(HttpSession httpSession, Model model, HttpServletRequest request) {
		//세션에서 로그인한 사용자의 아이디값을 가져옴.
		String userid = (String)httpSession.getAttribute("SESSION_ID");
		if(userid == null) { //아이디값이 없다면 로그인되지 않은 상태
			return request.getContextPath()+"redirect:/member/login"; //로그인 페이지로 이동
		}
		//그렇지 않다면 게시판 글쓰기 화면 표시
		model.addAttribute("userid", userid);
		return request.getContextPath()+"/board/insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertBoardPost(@ModelAttribute BoardVO obj,
			@RequestParam MultipartFile[] imgs, HttpServletRequest request) throws IOException {
		if(imgs != null && imgs.length > 0) { //이미지가 첨부되었다면
			for ( MultipartFile one : imgs   ) {
				obj.setBrdimg( one.getBytes() );
			}
		}
		
		//DAO로 obj값 전달하기
		bDAO.insertBoard(obj);
		
		return request.getContextPath()+"redirect:/";
	}

}
