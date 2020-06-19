package com.soulmovie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/choice")
public class ChoiceController {
	
	@RequestMapping(value = "/insert")
	public String insert() {
		return "/choice/insert";
	}
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertpost(HttpServletRequest request) {
		return "redirect:" + request.getContextPath() + "/choice/insert";
	}
}
