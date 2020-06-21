package com.soulmovie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.dao.BoardDAO;
import com.soulmovie.dao.MovieDAO;
import com.soulmovie.vo.BoardVO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private MovieDAO mDAO = null;
	
	@Autowired
	private BoardDAO bDAO = null;
//	private MemberDAO DAO = null;
	
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest request) {
		return request.getContextPath() + "/admin/home";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		return request.getContextPath() + "/admin/login";
	}
	
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String login(HttpServletRequest request) {
//		
//		MemberVO obj1 = mDAO.selectMemberLogin(obj);
//		if (obj1 != null) { //濡쒓렇�씤 �꽦怨�
//			httpSession.setAttribute("SESSION_ID", obj.getUserid());
//			String backURL = (String) httpSession.getAttribute("CURRPAGE");
//			return "redirect:" + backURL;	
//		}
//		return "redirect:"+ request.getContextPath() +"/admin/main";
//	}
	
	
	@RequestMapping(value="/movie", method=RequestMethod.GET)
	public String movielist(Model model, HttpSession httpSession,
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0", required=false) int page,
			@RequestParam(value="text", defaultValue="", required=false) String text) {
//		if(page==0) {
//			return "redirect:"+request.getContextPath()+"/admin/movie?page=1";
//		}

		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("start", (page*7)-6);//�떆�옉�쐞移�
//		map.put("end", page*7); //醫낅즺�쐞移�
//		map.put("text", text); //寃��깋�뼱
		//紐⑸줉
		List<MovieVO> list = mDAO.selectMovie1();
		
		model.addAttribute("list", list);
		return request.getContextPath() +"/admin/movielist";
	}
	
	@RequestMapping(value = "/moviecontent", method = RequestMethod.GET)
	public String moviecontent(Model model, HttpSession httpSession, 
			@RequestParam(value="no", defaultValue = "0", required = false) int no) {
		if( no == 0) {
			return "redirect:/admin/movie";
		}
		
		MovieVO obj = mDAO.selectMovieOne1(no);
		model.addAttribute("obj", obj);
		
	
		return "/admin/moviecontent";
	}
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String boardlist(Model model, HttpSession httpSession,
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0", required=false) int page,
			@RequestParam(value="text", defaultValue="", required=false) String text) {
		if(page==0) {
			return "redirect:"+request.getContextPath()+"/admin/board?page=1";
		}

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page*6)-5);//�떆�옉�쐞移�
		map.put("end", page*6); //醫낅즺�쐞移�
		map.put("text", text); //寃��깋�뼱
		//紐⑸줉
		List<BoardVO> list = bDAO.selectBoard(map);
		System.out.println(list);
		model.addAttribute("list", list);
		return request.getContextPath() +"/admin/boardlist";
	}
	
	@RequestMapping(value = "/boardcontent", method = RequestMethod.GET)
	public String boardcontent(Model model, HttpSession httpSession, 
			@RequestParam(value="no", defaultValue = "0", required = false) int no) {
		if( no == 0) {
			return "redirect:/admin/board";
		}
		
		BoardVO obj = bDAO.selectBoardOne(no);
		model.addAttribute("obj", obj);
		
	
		return "/admin/moviecontent";
	}
}
