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

	
	//회사 리스트 출력
	@Override
	public List selectAllPartner() throws DataAccessException { 
		List <PartnerVO> partnerList = null;
		partnerList = sqlSession.selectList("mapper.partner.selectAllPartnerList"); //mapper.partner의 selectAllPartnerList를 호출하여 partner리스트에 저장
		return partnerList;
		
	}

	
	//협력사 count
	public int selectCooperationPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectCooperationPartner");  //mapper.partner의 selectCooperationPartner를 호출하여 값만 리턴
		
	}
	
	//협약사 count
	public int selectConventionPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectConventionPartner");   //mapper.partner의 selectConventionPartner를 호출하여 값만 리턴
		
	}
	
	//협약 진행중 count
	public int selectIngPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectIngPartner");      //mapper.partner의 selectIngPartner를 호출하여 값만 리턴
		
	}
	
	//미협약 count
	public int selectNotPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectNotPartner");      //mapper.partner의 selectNotPartner를 호출하여 값만 리턴
		
	}
	
	//회사 정보 입력
	public int addPartner(PartnerVO partner) throws DataAccessException{
		int result = sqlSession.insert("mapper.partner.addPartner",partner);    //mapper.partner의 addPartner에 partner 객체를 같이 넣어주어 객체 값 insert
		return result;
	}
	
	public int updatePartner(PartnerVO partner) throws DataAccessException{
		int result = sqlSession.update("mapper.partner.updatePartner",partner);   
		return result;
	}
	

	public PartnerVO selectDetailPartner(String partnerLicenseNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectDetailPartner",partnerLicenseNum);      
			
		}
	
	public void deletePartner(String partnerLicenseNum) throws DataAccessException{
		sqlSession.delete("mapper.partner.deletePartner",partnerLicenseNum);
	}
	
	public String partnerName(String partnerLicenseNum) throws DataAccessException{
		System.out.println("dao이름"+sqlSession.selectOne("mapper.partner.partnerName",partnerLicenseNum));
		return sqlSession.selectOne("mapper.partner.partnerName",partnerLicenseNum);
	}

	/* 기업관련 함수 */
	@Override
	public PartnerVO getCompanyInformation(String partnerLicenseNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.getCompanyInfo",partnerLicenseNum);
	}

	//회사 회원 수
	@Override
	public int companyUserNumber(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.partner.companyUserNumber",partnerLicenseNum);
	}

	//회사 수강 회원 수
	@Override
	public int companyCourseUserNumber() throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.partner.companyCourseUserNumber");
	}
	/* 기업관련 함수 끝*/

	//graph information ajax
	@Override
	public List getInfoGraph(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.partner.companyGraphInfo", partnerLicenseNum);
	}


	@Override
	public List SelectAllListCompanyEmployee(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.partner.companyEmployeeList",partnerLicenseNum);
	}
}
