package com.khd.jejulantis.client.coupon.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khd.jejulantis.model.Detail;

@Repository
public class DetailDAOImpl implements DetailDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String ns = "query.detail";
	
	@Override
	public List<Detail>list(String member_id){
		List<Detail>list = sqlSession.selectList(ns+".myCouponlist",member_id);
		return list;
	}
}
