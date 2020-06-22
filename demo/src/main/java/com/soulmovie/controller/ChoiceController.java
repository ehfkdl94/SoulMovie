package com.soulmovie.controller;

//import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
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
	public String insert(Model model, Authentication auth, HttpServletRequest request,
			@RequestParam(value="text", required = false) String text,
			@RequestParam(value="chk", required = false) String chk) {
		if(auth != null) {
			User user = (User)auth.getPrincipal();
			if(user != null) {
//				System.out.println(user.getUsername());
				String username = user.getUsername();
//				String userid = Integer.toString(uMapper.findUserid(username));				
				int userid = uMapper.findUserid(username);				
				model.addAttribute("choice_id", userid);			
			}
		}
		else {
			System.out.println("security auth null");
		}

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
	
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertpost(HttpServletRequest request, @ModelAttribute ChoiceVO obj) {		
		System.out.println(obj.toString());
		cMapper.insertChoice(obj);
		return "redirect:" + request.getContextPath() + "/choice/insert";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String selectlist(HttpServletRequest request, Authentication auth, Model model) {
		if(auth != null) {
			User user = (User)auth.getPrincipal();
			if(user != null) {
//				System.out.println(user.getUsername());
				String username = user.getUsername();
				int userid = uMapper.findUserid(username);
				List<ChoiceVO> list = cMapper.selectChoiceList(userid);
				model.addAttribute("list", list);								
			}
		}
		else {
			System.out.println("security auth null");
		}
		
		return request.getContextPath() + "/choice/list";
	}
}
