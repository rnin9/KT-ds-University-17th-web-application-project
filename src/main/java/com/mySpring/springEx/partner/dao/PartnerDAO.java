package com.mySpring.springEx.partner.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.application.vo.ApplicationVO;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;

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

	/*partner-company method Start */
	public List SelectAllListCompanyEmployee(String partnerLicenseNum) throws DataAccessException;
	public PartnerVO getCompanyInformation(String partnerLicenseNum) throws DataAccessException;
	public List getInfoGraph(String partnerLicenseNum) throws DataAccessException;
	public List getApplyList(String partnerLicenseNum) throws DataAccessException;
	public List getRecruitList(String partnerLicenseNum) throws DataAccessException;
	public ResumeVO getUserResume(String resumeID) throws DataAccessException;
	public void updateManageApply(ApplicationVO application) throws DataAccessException;
	public void insertSuggestion(SuggestionVO suggestion) throws DataAccessException;
	public void deleteSuggestionFromCompany(SuggestionVO suggestion) throws DataAccessException;
	/*partner-company method end */
	public int postJobOpening(String partnerLicenseNum, String date) throws DataAccessException;

	public int deleteJobOpening(String partnerLicenseNum) throws DataAccessException;

	public List<Map<String, Object>> selectPartnerApplyN() throws DataAccessException;

	public List<Map<String, Object>> selectJobOpeningList() throws DataAccessException;

}
