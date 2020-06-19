package com.soulmovie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soulmovie.mapper.UserMapper;
import com.soulmovie.vo.UserVo;



@Controller
@RequestMapping("/") 
public class SecurityController {
		@Autowired
		private UserMapper userMapper;
		
		@RequestMapping(value = "/home", method = RequestMethod.GET)
		public String home1(HttpServletRequest request) {
			
			return request.getContextPath()+"/home";
		}
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String join(HttpServletRequest request) {
			
			return request.getContextPath()+"/member/join";
		}
		@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String join(@ModelAttribute UserVo obj, HttpServletRequest request) {
			System.out.println(obj.toString());
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
			String str1 = passwordEncoder.encode(obj.getPassword());
			obj.setPassword(str1);
			userMapper.insertMember(obj);
			return "redirect:"+request.getContextPath()+"/member/home";
		}
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login(HttpServletRequest request) {
			return "/member/login";
		}
}
