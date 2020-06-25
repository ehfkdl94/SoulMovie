package com.soulmovie.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.dao.MovieDAO;
import com.soulmovie.mapper.UserMapper;
import com.soulmovie.vo.ChoiceVO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {
	@Autowired
	MovieDAO mDAO = null;
	@Autowired
	UserMapper uMapper = null;
	@RequestMapping(value = "/moviedetail", method = RequestMethod.GET)
	public String moviedetail(HttpServletRequest request,
			@RequestParam(value="movie_code", defaultValue="1",required= false) int movie_code
			,Model model) {
		
		MovieVO list = mDAO.selectMovieOne(movie_code);
		List<MovieVO> list2 = mDAO.selectMovie();
		ChoiceVO freq = mDAO.countMovieFreq(list.getMovie_code());
		list.setMovie_freq(freq.getChoice_freq());
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		List<ChoiceVO> review = mDAO.selectMoiveReview(list.getMovie_code());
		System.out.println(review.size()+"리뷰사이즈");
//		for(int i =0; i<review.size(); i++) {
//			String reviewsplit =review.get(i).getChoice_reason();
//		    if(reviewsplit.length() >23) {
//			reviewsplit =reviewsplit.substring(0,23);
//			review.get(i).setChoice_reason(reviewsplit);
//		    }
//		}
		String nickname =null;
		if(review.size()>0) {
		for( int i =0; i <review.size();i++) {
			//
			System.out.println(review.get(0).toString());
			int username = review.get(i).getChoice_id();
			 nickname= uMapper.findtoUseridFromUsername(username);
			 review.get(i).setUser_nick(nickname);
		}
		}
		
		
		model.addAttribute("review", review);
		
		return request.getContextPath()+"/movie/moviedetail";
	}
	@RequestMapping(value = "/movielist", method = RequestMethod.GET)
	public String movielist(HttpServletRequest request, 
			@RequestParam(value="movie_code", defaultValue="1",required= false) int movie_code
			,@RequestParam(value = "page", defaultValue = "0", required = false) int page,
			@RequestParam(value = "text", defaultValue = "", required = false) String text,
			@RequestParam(value = "category", defaultValue = "", required = false) String category,
			HttpSession httpSession,
			Model model) {
		System.out.println(category);
		if(page == 0) {
			return "redirect:" + request.getContextPath() + "/movie/movielist?page=1"; 
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", page*16-15); 	//시작위치
		map.put("end", page*16);		//종료위치
		map.put("text", text);
		//List<MovieVO> list2 = mDAO.selectPageMovieText(map);
		List<MovieVO> list2 = mDAO.selectMovie1(map);
		
//		if(category.equals("title")) {
//		list2 = mDAO.selectPageMovieText(map);
//		}
//		else if(category.equals("genre")) {
//		list2 =mDAO.selectPageMovieGenre(map);
//		}
		

		model.addAttribute("list2", list2);
		int cnt = mDAO.countBoard(text); //검색어를 넘겨줌.
		int allpage=(cnt-1)/16+1;
		int movepage=page;
	    int start= 1;
	    int end =0;
	   
		if(movepage==1  || movepage==2) {
			start =1;
			if (allpage >5) {
				end = 5;
			}
			else {
				end = allpage;
			}
			movepage=3;
		}
		else if (movepage == allpage || movepage== allpage-1) {
			start = allpage-4;
			end = allpage;
	
		}
		else {
			start=page-2;
			end = page+2;
		}

		model.addAttribute("movepage",movepage );
		model.addAttribute("allpage",allpage );

	    
	   
	    	
	    
		System.out.println(start +"start"+end +"end");
	

		model.addAttribute("start",start );

		model.addAttribute("end",end );
		model.addAttribute("allpage",allpage);
		
		return request.getContextPath()+"/movie/movielist";
	}
	
	
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String movielist2() {
		
		
		return "/movie/test";
	}
	
}
