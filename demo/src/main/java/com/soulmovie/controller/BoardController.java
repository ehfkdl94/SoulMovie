package com.soulmovie.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.soulmovie.dao.BoardDAO;
import com.soulmovie.vo.BoardVO;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardDAO bDAO =null;
	
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertBoard(HttpSession httpSession, Model model, HttpServletRequest request) {
		//세션에서 로그인한 사용자의 아이디값을 가져옴.
//		String userid = (String)httpSession.getAttribute("SESSION_ID");
//		if(userid == null) { //아이디값이 없다면 로그인되지 않은 상태
//			return request.getContextPath()+"redirect:/member/login"; //로그인 페이지로 이동
//		}
//		그렇지 않다면 게시판 글쓰기 화면 표시
//		model.addAttribute("userid", userid);
		return request.getContextPath()+"/board/insert2";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertBoardPost(@ModelAttribute BoardVO obj, HttpServletRequest request) throws IOException {
		int userid=bDAO.selectuserid(obj.getUsername());
		//DAO로 obj값 전달하기
		obj.setBrdid(userid);
		bDAO.insertBoard(obj);
		
		
		return "redirect:"+request.getContextPath()+"/board/list";
	}
	
	@RequestMapping(value = "/content", method = RequestMethod.GET)
	public String content(Model model, HttpSession httpSession, HttpServletRequest request,
			@RequestParam(value="no", defaultValue = "0", required = false) int no,
			@RequestParam(value="bno")int bno) {
		if( no == 0) {
			return request.getContextPath()+"redirect:/board/list";
		}
				
		Integer chk = (Integer)httpSession.getAttribute("SESSION_BOARD_HIT_CHECK");
		if (chk != null) {
			if( chk == 1) {
				bDAO.updateHit(no);
			}
				httpSession.setAttribute("SESSION_BOARD_HIT_CHECK", 0);		
		}
		
		BoardVO obj = bDAO.selectBoardOne(no);
		obj.setBrdnumber(bno);
		model.addAttribute("obj", obj);
		
		int p = bDAO.selectBoardPrev(no);
		model.addAttribute("prev", p);
		
		int n = bDAO.selectBoardNext(no);
		model.addAttribute("next", n);
		
		return request.getContextPath()+"/board/content2";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, HttpSession httpSession, 
			HttpServletRequest request,
			@RequestParam(value="page", defaultValue = "0", required = false) int page,
			@RequestParam(value="text", defaultValue = "", required = false) String text) {
		
		if(page == 0) {
			return "redirect:" + request.getContextPath() + "/board/list?page=1"; 
		}
		
		httpSession.setAttribute("SESSION_BOARD_HIT_CHECK", 1);

		// 목록
		HashMap<String, Object> map = new HashMap<String, Object>();
		int cnt1 = bDAO.countBoard("");
		 
		map.put("start", page*10-9); 	//시작위치
		map.put("end", page*10);		//종료위치	
		map.put("text", text);			//검색어
		// 게시물 개수
				int cnt = bDAO.countBoard(text); //검색어를 넘겨줌.
				//System.out.println( (int) Math.ceil(n/10.0) );
		List<BoardVO> list = bDAO.selectBoard(map);
		List<BoardVO> list2 = bDAO.selectBoard(map); 
	      int j=0;
	       
	       for(int i =list.size()-1;i>=0;i--) {
	          list2.set(j, list.get(i));

	          j++;
	          
	       }
	         j=0;
	         System.out.println("test");
	       List<BoardVO> list3= new ArrayList<BoardVO>();
	       if( (int)Math.ceil(cnt/10.0) == page) {  //마지막페이지일경우에만
	             
	    	   if(cnt%10 ==0 )  {
	    		   
	    		   for(int i =page*10-10; i<page*10 ;i++) {
			    	   list3.add( list2.get(i));
			    	  j++;
			    	  
			       }
	    	   }
	    	   else {
	          for(int i =page*10-10; i<page*10-10+cnt%10 ;i++) {
		    	   list3.add( list2.get(i));
		    	  j++;
		    	  
		       }
	    	   }
	       }
	       else {
	       for(int i =page*10-10; i<page*10 ;i++) {
	    	   list3.add( list2.get(i));
	       }
	       }
		model.addAttribute("list", list3);
	
		
		
		
		model.addAttribute("cnt", (int)Math.ceil(cnt/10.0));
		return request.getContextPath()+"/board/list3";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request,
			Model model,
			@RequestParam(value="no", defaultValue = "0") int no,
			@RequestParam(value="bno", defaultValue = "0") int bno) {
		BoardVO obj = bDAO.selectBoardOne(no);
		model.addAttribute("obj", obj);
		model.addAttribute("bno", bno);
		return request.getContextPath()+"/board/update2";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(HttpServletRequest request,
			@ModelAttribute BoardVO obj) throws IOException {  //변수명 == <input name="img"
		//이미지는 수동으로 obj에 추가함.
		
		
		bDAO.updateBoard(obj);
		return "redirect:" + request.getContextPath() + "/board/list";
	}
	

	@RequestMapping(value="/getimg")
	public ResponseEntity<byte[]> getimg(
			@RequestParam("no") int no,
			HttpServletRequest request){
		BoardVO obj = bDAO.selectBoardImg(no);
		try {
			if (obj.getBrdimg().length > 0) { //이미지가 있음
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(
							obj.getBrdimg(), header, HttpStatus.OK);
				return ret;
			}
			return null;
		}
		catch(Exception e) {
			try {
				//request.getServletContext().getResourceAsStream() ==	//src/main/webapp
				InputStream in 
					= request.getServletContext().getResourceAsStream("/resources/img/default.jpg");
				HttpHeaders header = new HttpHeaders();
				header.setContentType(MediaType.IMAGE_JPEG);
				ResponseEntity<byte[]> ret = new ResponseEntity<byte[]>(
							IOUtils.toByteArray(in), header, HttpStatus.OK);
				return ret;
			}
			catch(Exception e1) {
				return null;
			}
		}
	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(HttpSession httpSession, HttpServletRequest request,
			@RequestParam(value="no", defaultValue = "0") int no) {
		BoardVO obj = new BoardVO();
		obj.setBrdno(no);
		
		int ret = bDAO.deleteBoard(obj);  
		

		if(ret > 0) {  //성공하면 목록화면 으로
			return "redirect:" + request.getContextPath() + "/board/list";
		}
		//실패하면 이전화면 즉, 상세화면으로
		return "redirect:" + request.getContextPath() + "/board/content?no=" + no;
	}
	
	
}
