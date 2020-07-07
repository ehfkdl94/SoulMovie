package com.soulmovie.rest_controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.soulmovie.mapper.ChoiceMapper;
import com.soulmovie.mapper.UserMapper;
import com.soulmovie.vo.JoinDateVO;
import com.soulmovie.vo.insertDateVO;


@CrossOrigin("*") //CROES 해제    서버에 json문서를 만들어줘도 다른 디바이스에선 접속이 안됨 크로스도메인
@RestController  //json 문서를 만들기 위해선 이게 필요하다....
public class RestTestController {
	@Autowired // @Bean으로 만들어진 객체를 받아옴.
	private UserMapper uMapper = null;
	
	@Autowired // @Bean으로 만들어진 객체를 받아옴.
	private ChoiceMapper cMapper = null;
	
	@RequestMapping(value = "/rest/itemorder.json", method = { RequestMethod.GET,
			RequestMethod.POST }, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody HashMap<String, Object> itemOrder(){
			List<JoinDateVO> list   =uMapper.JoindateMember();
			List<insertDateVO> list1 = cMapper.InsertDate();
			//String str = ['배',45],['사과',456],[귤',345]
	//리스트의 개수만큼 반복
//			for (OrderVO map :list) {
//			int no = (int) map.getItemno();
//			String name = map.getItemname();
//			int cnt = (int)map.getItemqty();
//				
//			//map의 key를 가져옴
////			Set<String> keys= map.keySet();
////			for( String key: keys) {  //키를 순차적으로 출력한다.(5개)
////				System.out.println(key);
////			}
////			System.out.println();
//		}
		//String str = "aaa";//String.format("['data1', %d, %d, %d, %d, %d, %d]",a,b,c,d,e,f);
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> x =new ArrayList<String>() ;
		ArrayList<Integer> choice =new ArrayList<Integer>() ;
		ArrayList<Integer> member =new ArrayList<Integer>() ;
		int choiceCnt=0;
		int memberCnt=0;
		boolean power = true;
		while(power) {	
				
				if(list.get(memberCnt).getJoindate().compareTo(list1.get(choiceCnt).getChoicedate())==0){
					 x.add(list.get(memberCnt).getJoindate());
					 member.add(list.get(memberCnt).getCount());
					 choice.add(list1.get(choiceCnt).getCount());
					 memberCnt++;
					 choiceCnt++;
					 
				}
				else if(list.get(memberCnt).getJoindate().compareTo(list1.get(choiceCnt).getChoicedate())==1){
					x.add(list1.get(choiceCnt).getChoicedate());
					member.add(0);
					choice.add(list1.get(choiceCnt).getCount());
					choiceCnt++;

					 
				}
				else  {
					x.add(list.get(memberCnt).getJoindate());
					member.add(list.get(memberCnt).getCount());
					choice.add(0);
					memberCnt++;
					
				}
				if(list.size() == memberCnt) {
					if(list1.size() >choiceCnt) {
						for(int a =choiceCnt ; a<list1.size();a++) {
							x.add(list1.get(a).getChoicedate());
							member.add(0);
							choice.add(list1.get(a).getCount());
							
						}
						
					}
					 
					power= false;
					break;
				}
				else if(list1.size() == choiceCnt) {
					if(list.size() >memberCnt) {
						for(int a =memberCnt ; a<list1.size();a++) {
							x.add(list.get(a).getJoindate());
							member.add(list.get(a).getCount());
							choice.add(0);
						}
						
					}
					 
					power= false;
					break;
				}
				
			}
		System.out.println(x.toString());
		System.out.println(choice.toString());
		System.out.println(member.toString());
		map.put("x", x);
		map.put("member", member);

		map.put("choice", choice);
	
	
		return map;
	}
	
	
//	@RequestMapping(value = "/rest/itemsearch.json", method = {RequestMethod.GET, RequestMethod.POST},
//			produces= MediaType.APPLICATION_JSON_VALUE)
//
//	public @ResponseBody HashMap<String,Object> itemSearch(
//			@RequestParam("txt") String txt,
//			@RequestParam("key") String key ){
//		
//		HashMap<String , Object> map = new HashMap<String,Object>();
//		if(key.equals("abc")) {
//			List<ItemVO> obj = iDAO.selectItemSearch(txt);
//			map.put("ret", 1);
//			map.put("data", obj);
//
//		}
//		else {
//			map.put("ret", 0);
//			map.put("error", "유효하지 않는 키입니다.");
//		}
				//return null;
//
//		
//	}
//	@RequestMapping(value = "/rest/itemone.json", method = {RequestMethod.GET, RequestMethod.POST},
//			produces= MediaType.APPLICATION_JSON_VALUE)
//
//	public @ResponseBody HashMap<String,Object> itemOne(
//			@RequestParam("no") int no,
//			@RequestParam("key") String key ){
//		
//		HashMap<String, Object> map = new HashMap<String,Object>();
//		
//		map.put("ret", 0); //{"ref":0} 실패시
//		//{"ref":1, data: "{ " } }
//		if (key.equals("abc")) {
//			ItemVO obj = iDAO.selectItemOnt(no);
//			map.put("ret", 1);
//			map.put("data", obj);
//		}
//		else { //{"ret" :0}
//			
//			
//		 map.put("ret", 0);
//		 map.put("error", "유효하지 않은 키입니다.");
//		}
//		ItemVO obj = iDAO.selectItemOnt(no);
//		return map;
//	}

}