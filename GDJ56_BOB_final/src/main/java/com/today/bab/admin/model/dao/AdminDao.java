package com.today.bab.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.today.bab.admin.model.vo.AdminItemOrder;
import com.today.bab.admin.model.vo.AdminMaster;
import com.today.bab.admin.model.vo.AdminMember;
import com.today.bab.admin.model.vo.AdminQnaAll;
import com.today.bab.admin.model.vo.AdminSearch;
import com.today.bab.admin.model.vo.AdminSellItem;
import com.today.bab.admin.model.vo.AdminSubscription;
import com.today.bab.admin.model.vo.AdminTotalData;
import com.today.bab.admin.model.vo.AdminTotalProduct;
import com.today.bab.admin.model.vo.ClientQNA;
import com.today.bab.admin.model.vo.CqAnswer;
import com.today.bab.member.model.vo.Member;

public interface AdminDao {

	List<Member> adminMembers(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectMemberListCount(SqlSessionTemplate session);
	
	AdminMember adminmemberInfo(SqlSessionTemplate session, String id);
	
	List<AdminSubscription> adminSubscription(SqlSessionTemplate session, String id);
	
	int adminDeleteMember(SqlSessionTemplate session, String memberId);
	
	List<AdminMaster> adminMaster(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectMasterListCount(SqlSessionTemplate session);
	
	int selectMasterIngListCount(SqlSessionTemplate session);
	
	int selectMasterAllListCount(SqlSessionTemplate session);
	
	AdminMaster adminMasterInfo(SqlSessionTemplate session, String name);
	
	int masterDelete(SqlSessionTemplate session, AdminMaster m);
	
	int masterDelete2(SqlSessionTemplate session, String memberId);
	
	int masterTestEnd(SqlSessionTemplate session, AdminMaster m);
	
	int masterTestEnd2(SqlSessionTemplate session, AdminMaster m);
	
	List<ClientQNA> selectQnAList(SqlSessionTemplate session,Map<String,Integer> param);
	
	int selectQnACount(SqlSessionTemplate session);
	
	ClientQNA selectQna(SqlSessionTemplate session,int cqNo);
	
	int insertqnaAnswer(SqlSessionTemplate session,CqAnswer cq);
	
	int updateClientQNA(SqlSessionTemplate session,int cqNo);
	
	List<AdminQnaAll> adminQnAAll(SqlSessionTemplate session,Map<String,Integer> param);
	
	List<AdminQnaAll> adminQnAOneDay(SqlSessionTemplate session,Map<String,Integer> param);
	
	List<AdminQnaAll> adminQnAMarket(SqlSessionTemplate session,Map<String,Integer> param);
	
	int adminQnAAllCount(SqlSessionTemplate session);
	
	int qnAMarketCount(SqlSessionTemplate session);
	
	int qnAOnedayCount(SqlSessionTemplate session);
	
	List<AdminItemOrder> adminRefund(SqlSessionTemplate session,Map<String,Integer> param);
	
	int adminRefundCount(SqlSessionTemplate session);
	
	AdminItemOrder selectcancelOrder(SqlSessionTemplate session,String merchant_uid);
	
	int updateItemOrder(SqlSessionTemplate session,AdminItemOrder updateItemOrder);
	
	int insertPoint(SqlSessionTemplate session,AdminItemOrder updatePoint);
	
	List<AdminTotalData> adminTotalData(SqlSessionTemplate session);
	
	List<AdminTotalProduct> adminTotalProduct(SqlSessionTemplate session);
	
	List<AdminSellItem> adminProductList(SqlSessionTemplate session,Map<String,Integer> param);
	
	int adminProductCount(SqlSessionTemplate session);
	
	List<Member> memberSearchClass(SqlSessionTemplate session,AdminSearch as);
	
	int memberSearchClassCount(SqlSessionTemplate session,AdminSearch as);
	
	List<AdminMaster> masterSearchClass(SqlSessionTemplate session,AdminSearch as);
	
	int masterSearchClassCount(SqlSessionTemplate session,AdminSearch as);
	
	int masterSearchClassYesCount(SqlSessionTemplate session,AdminSearch as);
	 
	int masterSearchClassIngCount(SqlSessionTemplate session,AdminSearch as);
	
	List<AdminSellItem> productSearchClass(SqlSessionTemplate session,AdminSearch as);
	
	int productSearchClassCount(SqlSessionTemplate session,AdminSearch as);
	
}


