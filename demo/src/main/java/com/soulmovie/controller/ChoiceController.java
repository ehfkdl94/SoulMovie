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

import com.soulmovie.dao.HomeDAO;
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
	HomeDAO hDAO = null;
	
	@Autowired
	public UserMapper uMapper;
	
	@RequestMapping(value = "/insert", method=RequestMethod.GET)
	public String insert(Model model, Authentication auth, HttpServletRequest request,
			@RequestParam(value="text", required = false) String text,
			@RequestParam(value="chk", required = false) String chk) {
		User user = null;
		if(auth != null) {
			 user = (User)auth.getPrincipal();
			if(user != null) {
				String username = user.getUsername();		
				int userid = uMapper.findUserid(username);
				String nickname = uMapper.findUserNick(username);				
				model.addAttribute("user_nick",nickname);
				model.addAttribute("choice_id", userid);			
			}
		}
		else {
			System.out.println("security auth null");
		}

		if(text == null && chk== null ) {
			return "redirect:/choice/insert?text=&chk=";
		}
		if (text.equals("")) {
			String list = "@@@@초기값";
			model.addAttribute("list", list);			
		}else {
			
			System.out.println(user.getUsername());
			List<MovieVO> list = mMapper.selectMovie(text,user.getUsername());
			model.addAttribute("list", list);			
		}
		if(chk!=null) {
			model.addAttribute("choice_code", chk);
			String title = mMapper.findMovieTitle(chk);
			model.addAttribute("movie_title", title);
		}
		return "/choice/insert";
		}
	
	
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertpost(HttpServletRequest request, @ModelAttribute ChoiceVO obj) {		
		int id = obj.getChoice_id();
		int code = obj.getChoice_code();		
		int checkcode = cMapper.checkChoiceCode(id, code);
		if (checkcode == 1) {
			
		}else {
			int chk = cMapper.insertChoice(obj);
			if(chk == 1) {
				uMapper.updateUserCcnt(id);
				mMapper.addMovieCnt(code);
			}
		}
		return "redirect:/choice/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String selectlist(Authentication auth, Model model) {
		if(auth != null) {
			User user = (User)auth.getPrincipal();
			if(user != null) {
//				System.out.println(user.getUsername());
				String username = user.getUsername();
				int userid = uMapper.findUserid(username);
				String nickname = uMapper.findUserNick(username);	
				int userccnt = uMapper.findUserCcnt(username);
        
				model.addAttribute("userccnt",userccnt);
				model.addAttribute("user_nick",nickname);
//				System.out.println(userid);
				List<ChoiceVO> list = cMapper.selectChoiceList(userid);
				model.addAttribute("list", list);
				
			}
		}
		else {
			System.out.println("security auth null");
		}
		
		return "/choice/list";
	}
	
//	@RequestMapping(value="/getimg")
//	public ResponseEntity<byte[]> getimg(@RequestParam(value="no") int no, HttpServletRequest request) {
//		
//		MovieVO obj = hDAO.selectBoardImg(no);
//		try {
//			if (obj.getMovie_img().length > 0) {
//				HttpHeaders header = new HttpHeaders();
//				header.setContentType(MediaType.IMAGE_JPEG);
//				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(obj.getMovie_img(), header, HttpStatus.OK);
//				return ret;
//			}
//			return null;
//		}catch(Exception e){
//			try{//InputStream in = request.getServletContext().getResourceAsStream() -> /src/main/webapp
//			InputStream in = request.getServletContext().getResourceAsStream("/resources/img/default.jpg");
//			HttpHeaders header = new HttpHeaders();
//			header.setContentType(MediaType.IMAGE_JPEG);
//			ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), header, HttpStatus.OK);
//			return ret;
//			}catch(Exception e1) {
//				return null;
//			}
//		}
//	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String update(Model model, @RequestParam(value="no", defaultValue="0") int no) {		
//		System.out.println(no);
		ChoiceVO obj = cMapper.selectChoice(no);
		String str = cMapper.selectMovieTitle(obj.getChoice_code());
//		System.out.println(str);
		model.addAttribute("obj", obj);
		model.addAttribute("movie_title", str);
		
		return "choice/update";
		
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request, @ModelAttribute ChoiceVO obj){
//		System.out.println(obj);
		cMapper.updateChoice(obj);		
		return "redirect:/choice/list";
	}
	
	@RequestMapping(value = "/delete")
	public String choicedelete(HttpServletRequest request, @RequestParam(value = "no", defaultValue = "0") int no) {		
		int id = cMapper.findChoiceId(no);
		int code = cMapper.findChoiceCode(no);		
		int chk = cMapper.deleteChoice(no);
		if (chk == 1) {
			uMapper.deleteUserCcnt(id);	
			mMapper.deleteMovieCnt(code);
		}
		return "redirect:/choice/list";
	}
}
