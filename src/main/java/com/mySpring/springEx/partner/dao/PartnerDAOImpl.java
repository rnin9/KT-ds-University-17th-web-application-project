package com.mySpring.springEx.partner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.springEx.partner.vo.PartnerVO;

@Repository("partnerDAO")
public class PartnerDAOImpl implements PartnerDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllPartner() throws DataAccessException {
		List <PartnerVO> partnerList = null;
		partnerList = sqlSession.selectList("mapper.partner.selectAllPartnerList");
		return partnerList;
		
	}
	
	public int selectCooperationPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectCooperationPartner");
		
	}
	
	public int selectConventionPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectConventionPartner");
		
	}
	
	public int selectNotPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectNotPartner");
		
	}
	
	public int addPartner(PartnerVO partner) throws DataAccessException{
		int result = sqlSession.insert("mapper.partner.addPartner",partner);
		System.out.println("DAO애드파트너");
		return result;
	}
	
	
	
	

}
