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
import com.soulmovie.mapper.UserMapper;
import com.soulmovie.vo.ChoiceVO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value = "/choice")
public class ChoiceController {
	
	@Autowired
	public MovieMapper mMapper;
	
	@Autowired
	public ChoiceMapper cMapper;
	
	@Autowired
	public UserMapper uMapper;
	
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String insert(Model model, HttpSession httpSession, HttpServletRequest request,
			@RequestParam(value="text", required = false) String text,
			@RequestParam(value="chk", required = false) String chk) {
		String username = (String) httpSession.getAttribute("SESSION_ID");
		if(username == null) {
			return "redirect:/member/login";
		}else {
		int userid = uMapper.findUserid(username);
		System.out.println(userid);
//		model.addAttribute("userid", userid);
		if(text == null && chk== null) {
			return "redirect:"+request.getContextPath()+"/choice/insert?text=&chk=";
		}
		if (text.equals("")) {
			String list = "@@@@초기값";
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
	}
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertpost(HttpServletRequest request, @ModelAttribute ChoiceVO obj) {
		System.out.println(obj.toString());
		cMapper.insertChoice(obj);
		return "redirect:" + request.getContextPath() + "/choice/insert";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String selectlist(HttpServletRequest request, Model model) {
//		String username = (String) httpSession.getAttribute("SESSION_ID");
//		int userid = uMapper.findUserid(username);
//		System.out.println(userid);
//		List<ChoiceVO> list = cMapper.selectChoiceList(userid);
//		model.addAttribute("list", list);
		return request.getContextPath() + "/choice/list";
	}
}
