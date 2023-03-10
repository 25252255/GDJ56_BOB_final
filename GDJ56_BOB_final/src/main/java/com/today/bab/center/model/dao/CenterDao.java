package com.today.bab.center.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.center.model.vo.Notice;

public interface CenterDao {
	List<Notice> selectNoticeList(SqlSessionTemplate session, Map<String, Integer> page);
	int selectNoticeCount(SqlSessionTemplate session);
	List<Notice> selectNoticeListSearch(SqlSessionTemplate session, Map<String, Integer> page, Map<String, String> param);
	int selectNoticeCount(SqlSessionTemplate session, Map<String, String> param);

	List<ClientQNA> selectCqList(SqlSessionTemplate session, Map<String, Integer> page);
	int selectCqCount(SqlSessionTemplate session);
	List<ClientQNA> selectCqListSearch(SqlSessionTemplate session, Map<String, Integer> page, Map<String, String> param);
	int selectCqCount(SqlSessionTemplate session, Map<String, String> param);

	Notice selectNotice(SqlSessionTemplate session, int no);
	ClientQNA selectClientQna(SqlSessionTemplate session, int no);

	int answerEnroll(SqlSessionTemplate session, Map<String, Object> param);
	int updateCheck(SqlSessionTemplate session, int no);
	int answerUpdate(SqlSessionTemplate session, Map<String, Object> param);
	int answerDelete(SqlSessionTemplate session, int no);
	int updateCheck2(SqlSessionTemplate session, int no);

	int noticeWriteEnd(SqlSessionTemplate session, Map<String, Object> param);
	int noticeUpdate(SqlSessionTemplate session, Map<String, Object> param);
	int noticeDelete(SqlSessionTemplate session, int no);
	int cqWriteEnd(SqlSessionTemplate session, Map<String, Object> param);
	int cqUpdate(SqlSessionTemplate session, Map<String, Object> param);
	int cqDelete(SqlSessionTemplate session, int no);
}
