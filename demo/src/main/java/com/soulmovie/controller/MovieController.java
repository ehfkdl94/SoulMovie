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

import com.soulmovie.dao.MovieDAO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {
	@Autowired
	MovieDAO mDAO = null;
	@RequestMapping(value = "/moviedetail", method = RequestMethod.GET)
	public String moviedetail(HttpServletRequest request,
			@RequestParam(value="movie_code", defaultValue="1",required= false) int movie_code
			,Model model) {
		MovieVO list = mDAO.selectMovieOne(movie_code);
		List<MovieVO> list2 = mDAO.selectMovie();
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		return request.getContextPath()+"/movie/moviedetail";
	}
	@RequestMapping(value = "/movielist", method = RequestMethod.GET)
	public String movielist(HttpServletRequest request, 
			@RequestParam(value="movie_code", defaultValue="1",required= false) int movie_code
			,@RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "text", defaultValue = "", required = false) String text,
			@RequestParam(value = "category", defaultValue = "", required = false) String category,
			HttpSession httpSession,
			Model model) {
		System.out.println(category);
		if(page == 0) {
			return "redirect:" + request.getContextPath() + "/movie/movielist?page=1"; 
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", page*6-5); 	//시작위치
		map.put("end", page*6);		//종료위치
		map.put("text", text);
		List<MovieVO> list2 = mDAO.selectPageMovieText(map);
		if(category.equals("title")) {
		list2 = mDAO.selectPageMovieText(map);
		}
		else if(category.equals("genre")) {
		list2 =mDAO.selectPageMovieGenre(map);
		}
		
		model.addAttribute("size", list2.size());
		model.addAttribute("list2", list2);
		int cnt = mDAO.countBoard(text); //검색어를 넘겨줌.
	
		model.addAttribute("cnt", (cnt-1)/6+1);
		return request.getContextPath()+"/movie/movielist";
	}
	
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String movielist2() {
		
		
		return "/movie/test";
	}
	
}
