package com.today.bab.market1.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.today.bab.market1.model.service.ReviewItemService;
import com.today.bab.market1.model.vo.ItemReview;
import com.today.bab.market1.model.vo.ItemrePic;
import com.today.bab.member.model.vo.Member;

@Controller
@RequestMapping("/itemReview")
public class reviewItemController {
	private ReviewItemService service;
	
	@Autowired
	public reviewItemController(ReviewItemService service) {
		super();
		this.service = service;
	}
	
	@RequestMapping("/insertReviewGo.do")
	public String insertReviewGo(Model m,int itemNo,String itemName,String mainPic, int orderNo,HttpServletRequest request) {
	      
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
	    
		m.addAttribute("itemNo",itemNo);
		m.addAttribute("memberId",loginMember.getMemberId());
		m.addAttribute("itemName",itemName);
		m.addAttribute("mainPic",mainPic);
		m.addAttribute("orderNo",orderNo);
		
		return "market1/enrollreview";
	}
	
	//리뷰 작성
	@RequestMapping("/insertRe.do")
	public ModelAndView insertRe(ModelAndView mv,
			int itemNo, String memberId, String iqrContent,MultipartFile[] files,int iqrStar,int orderNo
			,HttpSession session) {
		//이미지 저장할 경로 설정
		String path=session.getServletContext().getRealPath("/resources/upload/market/review/");
		
		File dir=new File(path);
		if(!dir.exists()) dir.mkdir();
		
		List<ItemrePic> rePic=new ArrayList();
		
		ItemReview r=ItemReview.builder()
				.itemNo(itemNo)
				.memberId(memberId)
				.iqrContent(iqrContent)
				.iqrStar(iqrStar)
				.orderNo(orderNo)
				.build();
		
		for(MultipartFile f : files) {
			if(!f.isEmpty()) {
				String picName=f.getOriginalFilename();
				String ex=picName.substring(picName.lastIndexOf("."));
				
				SimpleDateFormat sim=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rnd=(int)(Math.random()*10000)+1;
				String renameFile=sim.format(System.currentTimeMillis())+"_"+rnd+ex;
				try {
					f.transferTo(new File(path+renameFile));
					rePic.add(ItemrePic.builder().picName(renameFile).build());
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
		r.setItemrepic(rePic);
		int result=service.insertRe(r);
		
		if(result>0) {
			mv.addObject("msg", "리뷰 작성 완료");
			mv.addObject("loc","/market1/marketdetail.do?itemNo="+itemNo);
		}else {
			mv.addObject("msg", "리뷰 작성 실패");
			mv.addObject("loc", "/market1/matketmain.do");
		}
		mv.setViewName("common/msg");
		return mv;
	}
	
	@RequestMapping("/choiceReviewList.do")
	public String choiceReviewList(String list,int itemNo,Model m,HttpServletRequest request) {
		HttpSession session = request.getSession();
	    Member  loginMember= (Member) session.getAttribute("loginMember");
		if(list.contains("high")) {
			m.addAttribute("reviews", service.choiceReviewList(Map.of("list",list,"itemNo",itemNo)));
		}else if(list.contains("low")){
			m.addAttribute("reviews", service.choiceReviewList(Map.of("list",list,"itemNo",itemNo)));
		}else if(list.contains("mem")) {
			if(loginMember!=null) {
				String memberId=loginMember.getMemberId();
				m.addAttribute("reviews", service.choiceReviewList(Map.of("list",list,"itemNo",itemNo,"memberId",memberId)));
			}
		}
		m.addAttribute("picpic",service.selectrReviewPic());
		return "market1/reviewChoice";
	    	
	}
}