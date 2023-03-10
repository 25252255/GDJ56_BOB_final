package com.today.bab.member.model.service;

import java.sql.SQLException;

import com.today.bab.admin.model.vo.MemberLike;
import com.today.bab.member.model.vo.Member;

public interface MemberService {
	
	Member selectMemberById(Member m);
	Member idDuplicateCheck(String inputId);
	Member nicknameDuplicateCheck(String nickname);
	Member emailDuplicateCheck(String email);
	int enrollMemberEnd(Member m, MemberLike ml) throws RuntimeException;
	Member selectMemberByEmail(String email);
	int updatePwd(Member m);
}
