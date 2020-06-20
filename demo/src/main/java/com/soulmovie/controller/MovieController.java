package com.soulmovie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {
	@RequestMapping(value = "/moviedetail", method = RequestMethod.GET)
	public String moviedetail(HttpServletRequest request,
			@RequestParam(value="page", defaultValue="1",required= false) int page) {
		
		return request.getContextPath()+"/movie/moviedetail";
	}
}
