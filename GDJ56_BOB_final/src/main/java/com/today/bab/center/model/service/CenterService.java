package com.today.bab.center.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.vo.Notice;

public interface CenterService {
	List<Notice> selectNoticeList(Map<String, Integer> page);
	int selectNoticeCount();
	List<Notice> selectNoticeListSearch(Map<String, Integer> page, Map<String, String> param);
	int selectNoticeCount(Map<String, String> param);
	
	List<ClientQNA> selectCqList(Map<String, Integer> page);
	int selectCqCount();
	List<ClientQNA> selectCqListSearch(Map<String, Integer> page, Map<String, String> param);
	int selectCqCount(Map<String, String> param);
	
	Notice selectNotice(int no);
	ClientQNA selectClientQna(int no);

	int answerEnroll(Map<String, Object> param);
	int answerUpdate(Map<String, Object> param);
	int answerDelete(int no);

	int noticeWriteEnd(Map<String, Object> param);
	int noticeUpdate(Map<String, Object> param);
	int noticeDelete(int no);
	int cqWriteEnd(Map<String, Object> param);
	int cqUpdate(Map<String, Object> param);
	int cqDelete(int no);
}
