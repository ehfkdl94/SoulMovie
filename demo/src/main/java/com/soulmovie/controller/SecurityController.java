package com.soulmovie.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soulmovie.mapper.UserMapper;
import com.soulmovie.vo.UserVo;



@Controller
@RequestMapping("/member") 
public class SecurityController {
	
		@Autowired
		private UserMapper userMapper;
		
		@RequestMapping(value = "/home", method = RequestMethod.GET) //테스트용
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
			System.out.println(obj.getUserrname());
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
			String str1 = passwordEncoder.encode(obj.getPassword());
			obj.setPassword(str1);
			
			userMapper.insertMember(obj);
					
			return "redirect:"+request.getContextPath()+"/member/home";
		}
		
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login(HttpServletRequest request) {
			String referer = request.getHeader("Referer");
			request.getSession().setAttribute("prevPage", referer);
		
			return request.getContextPath()+"/member/login";
		}
		
		
//		@RequestMapping(value="/login", method= RequestMethod.POST)
//		public String loginpost(@ModelAttribute UserVo obj, 
//				HttpSession httpSession, HttpServletRequest request) {
//			//mapper전달
//			UserVo obj1 = userMapper.selectMemberLogin(obj);
//			if (obj1 != null) { //로그인 성공
//				httpSession.setAttribute("SESSION_ID", obj.getUsername());
//				System.out.println(httpSession.getAttribute("SESSION_ID"));
//				String backURL = (String) httpSession.getAttribute("CURRPAGE");
//				return "redirect:" + backURL; //고정되면 안됨!! 마지막페이지로 가야 한다.
//				
//				
//			}
//			//로그인 실패/member/login GET방식으로 전송
//			return "redirect:" + request.getContextPath() + "/member/login"; 
//		}
//		
		
//		
//		@RequestMapping(value="/logout", method = RequestMethod.POST)
//		public String logout(HttpSession httpSession, HttpServletRequest request) {
//			return "redirect:" +request.getContextPath()+"/";
//		}
		

//		@GetMapping("/login")
//		public String loginForm(HttpServletRequest req, HttpSession httpSession) {
//			String referer = req.getHeader("Referer");
//			req.getSession().setAttribute("prevPage", referer);
//		
//			return"/login";
//		}

		
		
	/*	
		@RequestMapping(value = "/login2", method = RequestMethod.GET)
		public String loginpost(@ModelAttribute UserVo obj, 
				HttpSession httpSession, HttpServletRequest request) {
			System.out.println(obj.toString());
			UserVo obj1 = userMapper.selectMemberLogin(obj);
			
			if (obj1 != null) { //로그인 성공
				httpSession.setAttribute("SESSION_ID", obj.getUsername());
				String backURL = (String) httpSession.getAttribute("CURRPAGE");
				return "redirect:" + backURL; //고정되면 안됨!! 마지막페이지로 가야 한다.
				
			
			}
			//로그인 실패/member/login GET방식으로 전송
			return "redirect:" + request.getContextPath() + "/member/login"; 
		}
		
		
			*/

	
				
}
