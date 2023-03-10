package com.today.bab.market1.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.today.bab.market1.model.vo.MarketMemberLike;
import com.today.bab.market2.model.vo.ItemPic;
import com.today.bab.market2.model.vo.SellItem;

@Repository
public class Market1DaoImpl implements Market1Dao {
	@Override
	public List<SellItem> selectItemCtg(SqlSessionTemplate session, Map<String, Integer> param){
		return session.selectList("ma.selectItemCtg",null,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}
	
	@Override
	public SellItem marketdetail(SqlSessionTemplate session, int itemNo){
		return session.selectOne("ma.marketdetail",itemNo);
	}
	
	@Override
	public int insertItem(SqlSessionTemplate session,SellItem s) {
		return session.insert("ma.insertItem",s);
	}
	
	@Override
	public int insertItemPic(SqlSessionTemplate session,ItemPic pic) {
		return session.insert("ma.insertItemPic",pic);
	}
	
	@Override
	public int deleteItem(SqlSessionTemplate session,int itemNo) {
		return session.delete("ma.deleteItem",itemNo);
	}
	
	@Override
	public List<SellItem> selectItemMarket(SqlSessionTemplate session){
		return session.selectList("ma.selectItemMarket");
	}
	
	@Override
	public int updateMarketItem(SqlSessionTemplate session,SellItem s) {
		return session.update("ma.updateMarketItem",s);
	}
	
	@Override
	public 	int updateItemPic(SqlSessionTemplate session,ItemPic keys) {
		return session.update("ma.updateItemPic",keys);
	}
	
	@Override
	public int deleteItemPic(SqlSessionTemplate session,int itemNo) {
		return session.delete("ma.deleteItemPic",itemNo);
	}
	
//	@Override
//	public List<SellItem> selectCtgAjax(SqlSessionTemplate session,String itemCategory){
//		return session.selectList("ma.selectCtgAjax",itemCategory);
//	}
	
	@Override
	public int selectItemCount(SqlSessionTemplate session) {
		return session.selectOne("ma.selectItemCount");
	}
	
	@Override
	public MarketMemberLike memberLike(SqlSessionTemplate session,String memberId){
		return session.selectOne("ma.memberLike",memberId);
	}
	
	@Override
	public List<SellItem> selectMainLike(SqlSessionTemplate session,String like) {
		return session.selectList("ma.selectMainLike",like);
	}
	
	@Override
	public List<SellItem> searchItemSort(SqlSessionTemplate session,Map<String,Object> param){
		return session.selectList("ma.searchItemSort",param);
	}
	
	@Override
	public List<SellItem> soldoutsoon(SqlSessionTemplate session,Map<String, Integer> param){
		return session.selectList("ma.soldoutsoon",null,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}

	@Override
	public List<SellItem> recommendman(SqlSessionTemplate session,Map<String, Integer> param){
		return session.selectList("ma.recommendman",null,
				new RowBounds((param.get("cPage")-1)*param.get("numPerpage"),param.get("numPerpage")));
	}
	
	@Override
	public List<SellItem> searchNeed(SqlSessionTemplate session,String search){
		return session.selectList("ma.searchNeed",search);
	}
}
