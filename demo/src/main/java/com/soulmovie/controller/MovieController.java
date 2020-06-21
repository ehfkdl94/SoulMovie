package com.soulmovie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
			,Model model) {
		MovieVO list = mDAO.selectMovieOne(movie_code);
		List<MovieVO> list2 = mDAO.selectMovie();
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		
		return request.getContextPath()+"/movie/movielist";
	}
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String movielist2() {
		
		
		return "/movie/test";
	}
}
