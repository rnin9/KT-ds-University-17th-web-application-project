package com.mySpring.springEx.partner.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerDAO {

	public List selectAllPartner() throws DataAccessException;
	
	public int selectCooperationPartner() throws DataAccessException;
	
	public int selectConventionPartner() throws DataAccessException;

	public int selectIngPartner() throws DataAccessException;
	
	public int selectNotPartner() throws DataAccessException;

	public int addPartner(PartnerVO partner) throws DataAccessException;
	
	public int updatePartner(PartnerVO partner) throws DataAccessException;
	
	public PartnerVO selectDetailPartner(String partnerLicenseNum) throws DataAccessException;
	
	public void deletePartner(String partnerLicenseNum) throws DataAccessException;
	
	public String partnerName(String partnerLicenseNum) throws DataAccessException;

	/*기업관련*/
	public PartnerVO getCompanyInformation(String partnerLicenseNum) throws DataAccessException;
	public int companyUserNumber(String partnerLicenseNum) throws DataAccessException;
	public int companyCourseUserNumber() throws DataAccessException;
	/*기업관련 끝*/
	

}
