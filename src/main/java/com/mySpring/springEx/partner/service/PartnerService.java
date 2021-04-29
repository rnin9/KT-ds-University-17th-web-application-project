package com.mySpring.springEx.partner.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.application.vo.ApplicationVO;
import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;

public interface PartnerService {

	public List<Map<String, Object>> SelectAllListPartner() throws Exception;

	public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;

	public int testTableCountPartner() throws Exception;

	public List<Map<String, Object>> selectPartnerApplyN() throws Exception;

	public int postJobOpening(String partnerLicenseNum, String date) throws DataAccessException;

	public int deleteJobOpening(String partnerLicenseNum) throws DataAccessException;

	public List<Map<String, Object>> selectJobOpeningList() throws Exception;

	public List listNumPartner() throws DataAccessException;

	public void addPartner(PartnerVO partner) throws DataAccessException;

	public void modPartner(PartnerVO partner) throws DataAccessException;

	public PartnerVO partnerDetailInfo(String partnerLicenseNum) throws DataAccessException;

	public String removePartner(String partnerLicenseNum) throws DataAccessException;

	/* ==================================company method Start ========================== */

	public List<Map<String, Object>> SelectAllListCompanyEmployee(String partnerLicenseNum)
			throws Exception;

	// graph Info
	public List<Map<String, Object>> infoGraph(String partnerLicenseNum) throws Exception;
	
	//applyList Select
	public List<Map<String, Object>> selectApplyList(String partnerLicenseNum) throws Exception;
	
	//Select All recruitments
	public List<Map<String, Object>> selectRecruitList(String partnerLicenseNum) throws Exception;
	
	//get Resume with Representative Resume
	public ResumeVO getUserResume(String resumeID) throws Exception;
	
	//handle Application from user
	public void manageUserApply(ApplicationVO application) throws Exception;
	
	//insert suggestion from Company 
	public void insertSuggestion(SuggestionVO suggestion) throws Exception;
	
	//update Suggestion to delete
	public void deleteCompanySuggest(SuggestionVO suggestion) throws Exception;
	
	/* =================================company method End================================== */
}
