package com.today.bab.market1.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.today.bab.market1.model.dao.QnaDao;
import com.today.bab.market1.model.vo.IqAnswer;
import com.today.bab.market1.model.vo.ItemQna;

@Service
public class QnaServiceImpl implements QnaService {
	
	private QnaDao dao;
	private SqlSessionTemplate session;
	
	@Autowired
	public QnaServiceImpl(QnaDao dao, SqlSessionTemplate session) {
		super();
		this.dao = dao;
		this.session = session;
	}
	
	@Override
	public int insertQna(ItemQna q) {
		return dao.insertQna(session,q);
	}
	
	@Override
	public List<ItemQna> selectQnaList(int itemNo){
		return dao.selectQnaList(session, itemNo);
	}
	
	@Override 
	public int delectQna(int iqNo) {
		return dao.delectQna(session,iqNo);
	}
	
	@Override
	public int qnaAnswerAdmin(IqAnswer iq) {
		return dao.qnaAnswerAdmin(session,iq);
	}
	
	@Override 
	public List<IqAnswer> selectIqAnswer(int itemNo) {
		return dao.selectIqAnswer(session,itemNo);
	}

	@Override 
	public int deleteQnaAnswer(int iqaNo) {
		return dao.deleteQnaAnswer(session,iqaNo);
	}
	
	@Override
	public List<ItemQna> qnaCheckbox(Map<String,Object> param){
		return dao.qnaCheckbox(session,param);
	}
}
