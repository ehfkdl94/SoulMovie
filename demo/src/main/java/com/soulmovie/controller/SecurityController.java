package com.soulmovie.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		public String home1() {
			
			return "/home";
		}
		
		
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String join(HttpServletRequest request, Authentication auth) {
			if(auth != null) {
				return "redirect:/";
				}
		
			
			return "/member/join";
		}
		
		
	
		

		@RequestMapping(value = "/join", method = RequestMethod.POST)
		public String join(@ModelAttribute UserVo obj, HttpServletRequest request) {
			

			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String str1 = passwordEncoder.encode(obj.getPassword());
			obj.setPassword(str1);
			
			userMapper.insertMember(obj);
					
			return "redirect:/member/welcome";
			
		}
		
		

		
		
		@RequestMapping(value = "/welcome", method = RequestMethod.GET) //테스트용
		public String joinsuccess(HttpServletRequest request,  Authentication auth) {
			if(auth != null) {


				
				return "redirect:/";
				}
			
			return "/member/welcome";
		}
		
		
		
		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String login(HttpServletRequest request, Authentication auth) {
			if(auth != null) {
			return "redirect:/";
			}
		
			String referer = request.getHeader("Referer");
			System.err.println();
			System.out.println(referer);
			if (referer !=null) {
			if(!referer.substring(referer.length()-12, referer.length()).equals("/member/edit")    )
				request.getSession().setAttribute("prevPage", referer);
			}

			
			return "/member/login";
	
		}
		
		
	
		
		
		@RequestMapping(value = "/mypage", method = RequestMethod.GET) 
		public String mypage(HttpServletRequest request, Authentication auth,
				Model model
				 ) {
			if(auth != null) {
				User user = (User)auth.getPrincipal();
				if(user != null) {
				String username = user.getUsername();	
				int userid = userMapper.findUserid(username);
				String nickname = userMapper.findUserNick(username);				
				model.addAttribute("user_nick",nickname);
				UserVo obj = userMapper.findByUsername(username);
				model.addAttribute("obj", obj);
					}			
							
				}
					
			return "/member/mypage";
			}
		
		
		
		@RequestMapping(value = "/update", method = RequestMethod.GET)
		public String update(HttpServletRequest request, Authentication auth,
				Model model) {
			if(auth != null) {
				User user = (User)auth.getPrincipal();
				if(user != null) {
				String username = user.getUsername();		
				UserVo obj = userMapper.findByUsername(username);
				model.addAttribute("obj", obj);
					}			
							
				}

			return "/member/update";
		}
		
		

		@RequestMapping(value = "/update", method = RequestMethod.POST)
		public String update(@ModelAttribute UserVo obj, HttpServletRequest request)  { 
			System.out.println(obj.toString());
			System.out.println(obj.getUserrname());
			
			//BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
			//String str1 = passwordEncoder.encode(obj.getPassword());
			//obj.setPassword(str1);

			userMapper.updateMember(obj);
			
			return "redirect:/member/mypage";
		}
		
		
		@RequestMapping(value = "/edit", method = RequestMethod.GET)
		public String edit( Model model,HttpServletRequest request ){
		    //jsp로 값을 전달함.
		    model.addAttribute("msg", "로그인 실패"); 
		    model.addAttribute("url", "/member/login"); 
		    //jsp를 화면에 표시함.
		    return "alert"; 
		}
		
		
		@RequestMapping(value = "/p_update", method = RequestMethod.GET)
		public String pupdate(HttpServletRequest request, Authentication auth,
				Model model) {
			if(auth != null) {
				User user = (User)auth.getPrincipal();

				if(user != null) {
				String username = user.getUsername();		
				UserVo obj = userMapper.findByUsername(username);
				model.addAttribute("obj", obj);
					}			
							
				}

			return "/member/p_update";
		}
		
		

		@RequestMapping(value = "/p_update", method = RequestMethod.POST)
		public String pupdatepost(@ModelAttribute UserVo obj, HttpServletRequest request)  { 
			System.out.println(obj.toString());
			System.out.println(obj.getUserrname());
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
			String str1 = passwordEncoder.encode(obj.getPassword());
			obj.setPassword(str1);

			userMapper.updateUserPassword(obj);
			
			return "redirect:/member/mypage";
		}
			
				
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
//			return "redirect:" +request.getContextPath()+"/	";
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

	
				

