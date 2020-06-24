package com.soulmovie.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soulmovie.dao.HomeDAO;
import com.soulmovie.mapper.HomeMapper;
import com.soulmovie.vo.MovieVO;

@Controller

//public class HomeController extends Controller {
public class HomeController {
	@Autowired
	HomeMapper mMapper;
	
	@Autowired
	HomeDAO hDAO = null;
	
	
	@RequestMapping(value="/")
	public String home(HttpSession httpSession, Model model, HttpServletRequest request) {
		List<MovieVO> list = hDAO.selectBoard();
		int Moviecnt = hDAO.countMovie();
		int Membercnt = hDAO.countMember();
		int Boardcnt = hDAO.countBoard();
		int Choicecnt = hDAO.countChoice();
		
		model.addAttribute("moviecnt", Moviecnt);
		model.addAttribute("membercnt", Membercnt);
		model.addAttribute("boardcnt", Boardcnt);
		model.addAttribute("choicecnt", Choicecnt);
		model.addAttribute("list", list);
		return request.getContextPath()+"index3";
	}
	
	@RequestMapping(value="getimg")
	public ResponseEntity<byte[]> getimg(@RequestParam("no")int no, Model model){
		MovieVO obj = hDAO.selectBoardImg(no);
		try {
			if(obj.getMovie_img().length>0) { 
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(obj.getMovie_img(), header, HttpStatus.OK);
				return ret;
			}
			return null;
		}catch(Exception e) {
			return null;
		}
	}
}
