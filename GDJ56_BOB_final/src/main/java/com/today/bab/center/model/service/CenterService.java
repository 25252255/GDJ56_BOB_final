package com.today.bab.center.model.service;

import java.util.List;
import java.util.Map;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.vo.Notice;

public interface CenterService {
	List<Notice> selectNoticeList(Map<String, Integer> page);
	int selectNoticeCount();
	List<ClientQNA> selectCqList(Map<String, Integer> page);
	int selectCqCount();

}