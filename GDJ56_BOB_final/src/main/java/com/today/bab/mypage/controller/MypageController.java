package com.today.bab.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private MypageService service;
	
	//@Autowired
	public MypageController(MypageService service) {
		this.service=service;
	}
	
//	@RequestMapping("/orderlist.do")
//	public ModelAndView selectItemOrderList(ModelAndView mv) {
//		//���������� �ֹ�����
//		
//		return mv;
//	}
//	
//	@RequestMapping("/myinfo.do")
//	public ModelAndView selectMyIfo(ModelAndView mv) {
//		//���������� ������
//		
//		return mv;
//	}
}
