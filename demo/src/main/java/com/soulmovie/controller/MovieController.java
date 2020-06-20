package com.soulmovie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {
	@RequestMapping(value = "/moviedetail", method = RequestMethod.GET)
	public String moviedetail(HttpServletRequest request,
			@RequestParam(value="movie_code", defaultValue="1",required= false) int code) {
//		List<MovieVO> list = mDAO.selectBoard();
//		model.addAttribute("list", list);
		
		return request.getContextPath()+"/movie/moviedetail";
	}
}
