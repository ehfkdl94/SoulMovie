package com.soulmovie.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.soulmovie.mapper.UserMapper;


@RestController
@CrossOrigin("*")
public class RestMemberController {

	@Autowired
	private UserMapper mDAO = null;
	
	//127.0.0.1:8080/rest/memberidcheck.json?id=
	@RequestMapping(value = "/member/rest/memberidcheck.json", 
			method = { RequestMethod.GET, RequestMethod.POST }, 
			produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String, Object> UserList(
			@RequestParam("username") String username){
		int ret = mDAO.selectMemberId(username);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ret", 0);
		if (ret > 0) {
			map.put("ret", 1);

		}
		return map;
	}
	
	
	@RequestMapping(value = "/member/rest/membernickcheck.json", 
			method = { RequestMethod.GET, RequestMethod.POST }, 
			produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String, Object> UserNickList(
			@RequestParam("usernick") String usernick){

		int ret = mDAO.selectMemberNick(usernick);
		HashMap<String, Object> map1 = new HashMap<String, Object>();
		map1.put("ret", 0);
		if (ret > 0) {
			map1.put("ret", 1);

		}
		return map1;
	}
	
	
	
}
