package com.today.bab.member.model.service;

import com.today.bab.member.model.vo.Member;

public interface MemberService {
	
	int login(String id, String password);
	Member selectMemberById(Member m);
}