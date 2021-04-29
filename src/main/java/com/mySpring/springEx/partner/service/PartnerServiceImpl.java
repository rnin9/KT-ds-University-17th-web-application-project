package com.mySpring.springEx.partner.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.mySpring.springEx.application.vo.ApplicationVO;
import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;
import com.mySpring.springEx.partner.dao.PartnerDAO;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;

@Service("partnerService")
public class PartnerServiceImpl implements PartnerService {
	
	
	@Autowired
	private PartnerDAO partnerDAO;

	@Autowired
	public PageMapper pageMapper;
	
	
	//�쉶�궗 由ъ뒪�듃 異쒕젰
	@Override
    public List<Map<String, Object>> SelectAllListPartner() throws Exception {
        // TODO Auto-generated method stub
        return pageMapper.SelectAllListPartner();
    }
 
    @Override
    public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception {
        // TODO Auto-generated method stub
        return pageMapper.SelectAllListPartner(pagination);
    }
 
    @Override
    public int testTableCountPartner() throws Exception {
        // TODO Auto-generated method stub
        return pageMapper.testTableCountPartner();
    }

	@Override
	public List<Map<String, Object>> selectPartnerApplyN() throws Exception {
		return partnerDAO.selectPartnerApplyN();
	}

	@Override
	public List<Map<String, Object>> selectJobOpeningList() throws Exception {
		return partnerDAO.selectJobOpeningList();
	}

	
	//�쉶�궗 �긽�깭蹂� count 異쒕젰
	@Override
	public List listNumPartner() throws DataAccessException {
		List<Integer> listNumPartner = new ArrayList<Integer>();;
		listNumPartner.add(partnerDAO.selectCooperationPartner());  //�삊�젰�궗 count
		listNumPartner.add(partnerDAO.selectConventionPartner());   //�삊�빟�궗 count
		listNumPartner.add(partnerDAO.selectIngPartner());			//�삊�빟 吏꾪뻾以� count
		listNumPartner.add(partnerDAO.selectNotPartner());			//誘명삊�빟 count
		return listNumPartner;
	}
	
	//�쉶�궗 �젙蹂� �엯�젰
	@Override
	public void addPartner(PartnerVO partner) throws DataAccessException {
		partnerDAO.addPartner(partner);
	}
	
	
	//湲곗뾽 �닔�젙
	@Override
	public void modPartner(PartnerVO partner) throws DataAccessException {
		partnerDAO.updatePartner(partner);
	}
	
	
	//湲곗뾽 �젙蹂� �긽�꽭 �뤌 
	@Override
	public PartnerVO partnerDetailInfo(String partnerLicenseNum) throws DataAccessException {
		return partnerDAO.selectDetailPartner(partnerLicenseNum);
	}
	
	//湲곗뾽 �궘�젣 
	@Override
	public String removePartner(String partnerLicenseNum) throws DataAccessException{
		String partnerName = partnerDAO.partnerName(partnerLicenseNum);
		partnerDAO.deletePartner(partnerLicenseNum);
		return partnerName;
	}

	@Override
	public int postJobOpening(String partnerLicenseNum, String date) throws DataAccessException{
		return partnerDAO.postJobOpening(partnerLicenseNum, date);
	}

	@Override
	public int deleteJobOpening(String partnerLicenseNum) throws DataAccessException{
		return partnerDAO.deleteJobOpening(partnerLicenseNum);
	}

	/* =================================湲곗뾽 愿��젴 �떆�옉======================= */
	@Override						 
	public List<Map<String, Object>> SelectAllListCompanyEmployee(String partnerLicenseNum) throws Exception {
		// TODO Auto-generated method stub
		List list = partnerDAO.SelectAllListCompanyEmployee(partnerLicenseNum);
		return list;
	}

	//graph information ajax
	@Override
	public List<Map<String, Object>> infoGraph(String partnerLicenseNum) throws Exception {
	
		return partnerDAO.getInfoGraph(partnerLicenseNum);
	}

	@Override
	public List<Map<String, Object>> selectApplyList(String partnerLicenseNum) throws Exception {
		return partnerDAO.getApplyList(partnerLicenseNum);
	}

	@Override
	public List selectRecruitList(String partnerLicenseNum) throws Exception {
		return partnerDAO.getRecruitList(partnerLicenseNum);
	}

	@Override
	public ResumeVO getUserResume(String resumeID) throws Exception {
		// TODO Auto-generated method stub
		return partnerDAO.getUserResume(resumeID);
	}

	@Override
	public void manageUserApply(ApplicationVO application) throws Exception {
		partnerDAO.updateManageApply(application);
		return;
	}

	@Override
	public void insertSuggestion(SuggestionVO suggestion) throws Exception {
		partnerDAO.insertSuggestion(suggestion);
		return;
	}

	@Override
	public void deleteCompanySuggest(SuggestionVO suggestion) throws Exception {
		partnerDAO.deleteSuggestionFromCompany(suggestion);
		return;
		
	}
	
	

	/*
	 * @Override public PartnerVO getCompanyInfo(String partnerLicenseNum) throws
	 * DataAccessException { // TODO Auto-generated method stub return
	 * partnerDAO.getCompanyInformation(partnerLicenseNum); }
	 */
	
	
	/* =================================湲곗뾽 愿��젴 �걹======================= */
	
}
