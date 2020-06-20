package com.soulmovie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.dao.MovieDAO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	MovieDAO mDAO = null;
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
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String boardlist() {
		
		return "/admin/boardlist";
	}
	
	@RequestMapping(value="/movie", method=RequestMethod.GET)
	public String movielist(Model model, HttpSession httpSession,
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0", required=false) int page,
			@RequestParam(value="text", defaultValue="", required=false) String text) {
		if(page==0) {
			return "redirect:"+request.getContextPath()+"/admin/movie?page=1";
		}

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page*7)-6);//�떆�옉�쐞移�
		map.put("end", page*7); //醫낅즺�쐞移�
		map.put("text", text); //寃��깋�뼱
		//紐⑸줉
		List<MovieVO> list = mDAO.selectMovie();
		
		model.addAttribute("list", list);
		return "/admin/movielist";
	}
}
