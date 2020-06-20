package com.soulmovie.controller;

//import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.mapper.MovieMapper;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value = "/choice")
public class ChoiceController {
	
	@Autowired
	public MovieMapper mMapper;
	
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String insert(Model model, @RequestParam(value="text", defaultValue="", required = false) String text) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("text", text);
		if (text == "") {
		List<MovieVO> list = null;
		model.addAttribute("list", list);
			return "/choice/insert";		
		}else {
		List<MovieVO> list = mMapper.selectMovie(text);
		model.addAttribute("list", list);
		return "/choice/insert"; }
	}
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertpost(HttpServletRequest request) {
		return "redirect:" + request.getContextPath() + "/choice/insert";
	}
}
