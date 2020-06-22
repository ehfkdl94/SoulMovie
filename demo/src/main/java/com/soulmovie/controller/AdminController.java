package com.soulmovie.controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.soulmovie.dao.BoardDAO;
import com.soulmovie.dao.MemberDAO;
import com.soulmovie.dao.MovieDAO;
import com.soulmovie.vo.BoardVO;
import com.soulmovie.vo.MemberVO;
import com.soulmovie.vo.MovieVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Autowired
	private MovieDAO mDAO = null;
	
	@Autowired
	private BoardDAO bDAO = null;
	
	@Autowired
	private MemberDAO memberDAO = null;
	
	@RequestMapping(value="/test")
	public String test(HttpServletRequest request) {
		return request.getContextPath() + "/admin/boardcontent2";
	}
	
	@RequestMapping(value="/home")
	public String home(HttpServletRequest request) {
		return request.getContextPath() + "/admin/home";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(HttpServletRequest request) {
		return request.getContextPath() + "/admin/login";
	}
	
//	@RequestMapping(value="/login", method=RequestMethod.POST)
//	public String login(HttpServletRequest request) {
//		
//		MemberVO obj1 = mDAO.selectMemberLogin(obj);
//		if (obj1 != null) { //濡쒓렇�씤 �꽦怨�
//			httpSession.setAttribute("SESSION_ID", obj.getUserid());
//			String backURL = (String) httpSession.getAttribute("CURRPAGE");
//			return "redirect:" + backURL;	
//		}
//		return "redirect:"+ request.getContextPath() +"/admin/main";
//	}
	
	
	@RequestMapping(value="/movie", method=RequestMethod.GET)
	public String movielist(Model model, HttpSession httpSession,
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0", required=false) int page,
			@RequestParam(value="text", defaultValue="", required=false) String text) {
		if(page==0) {
			return "redirect:"+request.getContextPath()+"/admin/movie?page=1";
		}

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page*7)-6);//�떆�옉�쐞移�
		map.put("end", page*7); //醫낅즺�쐞移�
		map.put("text", text); //寃��깋�뼱
		//紐⑸줉
		List<MovieVO> list = mDAO.selectMovie1(map);
		int cnt = mDAO.countMovie(text);
		model.addAttribute("list", list);
		model.addAttribute("cnt", (int)Math.ceil(cnt/7.0));
		return request.getContextPath() +"/admin/movielist";
	}
	
	@RequestMapping(value = "/moviecontent", method = RequestMethod.GET)
	public String moviecontent(Model model, HttpSession httpSession, 
			@RequestParam(value="no", defaultValue = "0", required = false) int no) {
		if( no == 0) {
			return "redirect:/admin/movie";
		}
		
		MovieVO obj = mDAO.selectMovieOne1(no);
		model.addAttribute("obj", obj);
		
	
		return "/admin/moviecontent";
	}
	
	@RequestMapping(value = "/moviedelete", method = RequestMethod.GET)
	public String moviedelete(HttpServletRequest request,
			@RequestParam(value="no", defaultValue = "0") int no) {
		MovieVO obj = new MovieVO();
		obj.setMovie_code(no);
		
		int ret = mDAO.deleteMovie(obj);  
		
		if(ret > 0) {  //성공하면 목록화면 으로
			return "redirect:" + request.getContextPath() + "/admin/movie";
		}
		//실패하면 이전화면 즉, 상세화면으로
		return "redirect:" + request.getContextPath() + "/admin/moviecontent?no=" + no;
	}
	
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public String boardlist(Model model, HttpSession httpSession,
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0", required=false) int page,
			@RequestParam(value="text", defaultValue="", required=false) String text) {
		if(page==0) {
			return "redirect:"+request.getContextPath()+"/admin/board?page=1";
		}

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page*7)-6);//�떆�옉�쐞移�
		map.put("end", page*7); //醫낅즺�쐞移�
		map.put("text", text); //寃��깋�뼱
		//紐⑸줉
		List<BoardVO> list = bDAO.selectBoard(map);
		int cnt = bDAO.countBoard(text);
		model.addAttribute("list", list);
		model.addAttribute("cnt", (int)Math.ceil(cnt/7.0));
		return request.getContextPath() +"/admin/boardlist";
	}
	
	@RequestMapping(value = "/boardcontent", method = RequestMethod.GET)
	public String boardcontent(Model model, HttpSession httpSession, 
			@RequestParam(value="no", defaultValue = "0", required = false) int no) {
		if( no == 0) {
			return "redirect:/admin/board";
		}
		
		BoardVO obj = bDAO.selectBoardOne(no);
		model.addAttribute("obj", obj);
		
	
		return "/admin/boardcontent";
	}
	
	@RequestMapping(value = "/boarddelete", method = RequestMethod.GET)
	public String boarddelete(HttpServletRequest request,
			@RequestParam(value="no", defaultValue = "0") int no) {
		BoardVO obj = new BoardVO();
		obj.setBrdno(no);
		
		int ret = bDAO.deleteBoard(obj);  
		
		if(ret > 0) {  //성공하면 목록화면 으로
			return "redirect:" + request.getContextPath() + "/admin/board";
		}
		//실패하면 이전화면 즉, 상세화면으로
		return "redirect:" + request.getContextPath() + "/admin/boardcontent?no=" + no;
	}
	
	@RequestMapping(value = "/boardinsert", method = RequestMethod.GET)
	public String boardinsert(HttpSession httpSession, Model model, HttpServletRequest request) {
		//세션에서 로그인한 사용자의 아이디값을 가져옴.
//		String userid = (String)httpSession.getAttribute("SESSION_ID");
//		if(userid == null) { //아이디값이 없다면 로그인되지 않은 상태
//			return request.getContextPath()+"redirect:/member/login"; //로그인 페이지로 이동
//		}
		//그렇지 않다면 게시판 글쓰기 화면 표시
//		model.addAttribute("userid", userid);
		return request.getContextPath()+"/admin/boardinsert";
	}
	
	@RequestMapping(value = "/boardinsert", method = RequestMethod.POST)
	public String boardinsertpost(@ModelAttribute BoardVO obj,
			HttpServletRequest request) throws IOException {
		int userid = bDAO.findId(obj.getUsername());
		obj.setBrdid(userid);
		//DAO로 obj값 전달하기
		bDAO.insertBoard(obj);
		
		return "redirect:"+request.getContextPath()+"/admin/board";
	}
	
	@RequestMapping(value="/boardupdate")
	public String boardupdate(Model model, HttpServletRequest request, @RequestParam(value="no")int no) {
		BoardVO obj = bDAO.selectBoardOne(no);
		model.addAttribute("obj", obj);
		return request.getContextPath() + "/admin/boardupdate";
	}
	
	@RequestMapping(value="/boardupdate", method=RequestMethod.POST)
	public String boardupdatepost(
			@ModelAttribute BoardVO obj,
			HttpServletRequest request){
		int userid = bDAO.findId(obj.getUsername());
		obj.setBrdid(userid);
	
		bDAO.updateBoard(obj);
		
		return "redirect:" + request.getContextPath() + "/admin/board";
		
	}
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public String memberlist(Model model, HttpSession httpSession,
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue="0", required=false) int page,
			@RequestParam(value="text", defaultValue="", required=false) String text) {
		if(page==0) {
			return "redirect:"+request.getContextPath()+"/admin/member?page=1";
		}

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", (page*7)-6);//�떆�옉�쐞移�
		map.put("end", page*7); //醫낅즺�쐞移�
		map.put("text", text); //寃��깋�뼱
		//紐⑸줉
		List<MemberVO> list = memberDAO.selectMember(map);
		int cnt = memberDAO.countMember(text);
		model.addAttribute("list", list);
		model.addAttribute("cnt", (int)Math.ceil(cnt/7.0));
		return request.getContextPath() +"/admin/memberlist";
	}
	
	@RequestMapping(value = "/membercontent", method = RequestMethod.GET)
	public String membercontent(Model model, HttpSession httpSession, HttpServletRequest request,
			@RequestParam(value="no", defaultValue = "0", required = false) int no) {
		if( no == 0) {
			return "redirect:"+request.getContextPath()+"/admin/member";
		}
		
		MemberVO obj = memberDAO.selectMemberOne(no);
		System.out.println(obj.toString());
		model.addAttribute("obj", obj);
		
	
		return request.getContextPath() + "/admin/membercontent";
	}
	
	@RequestMapping(value="/memberupdate")
	public String memberupdate(Model model, HttpServletRequest request, @RequestParam(value="no")int no) {
		MemberVO obj = memberDAO.selectMemberOne(no);
		model.addAttribute("obj", obj);
		return request.getContextPath() + "/admin/memberupdate";
	}
	
	@RequestMapping(value="/memberupdate", method=RequestMethod.POST)
	public String memberupdatepost(
			@ModelAttribute BoardVO obj,
			HttpServletRequest request){
		int userid = memberDAO.findId(obj.getUsername());
		obj.setBrdid(userid);
	
		bDAO.updateBoard(obj);
		
		return "redirect:" + request.getContextPath() + "/admin/board";
		
	}
}
