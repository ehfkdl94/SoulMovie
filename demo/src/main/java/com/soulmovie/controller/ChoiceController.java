package com.soulmovie.controller;

//import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.mapper.ChoiceMapper;
import com.soulmovie.mapper.MovieMapper;
import com.soulmovie.vo.ChoiceVO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value = "/choice")
public class ChoiceController {
	
	@Autowired
	public MovieMapper mMapper;
	
	@Autowired
	public ChoiceMapper cMapper;
	
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String insert(Model model,  HttpServletRequest request,
			@RequestParam(value="text", required = false) String text,
			@RequestParam(value="chk", required = false) String chk) {
		
		if(text == null && chk== null) {
			return "redirect:"+request.getContextPath()+"/choice/insert?text=&chk=";
		}
		if (text == null) {
			List<MovieVO> list = null;
			model.addAttribute("list", list);			
		}else {
			List<MovieVO> list = mMapper.selectMovie(text);
			model.addAttribute("list", list);			
		}
		if(chk!=null) {
			model.addAttribute("choice_code", chk);
		}
	return request.getContextPath() + "/choice/insert";
	}
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertpost(HttpServletRequest request,@ModelAttribute String chk, @ModelAttribute ChoiceVO obj) {
		System.out.println(chk);			
		System.out.println(obj.toString());
		cMapper.insertChoice(obj);
		return "redirect:" + request.getContextPath() + "/choice/insert";
	}	
}
