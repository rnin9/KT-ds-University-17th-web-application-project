package com.mySpring.springEx.partner.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;


import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;
import com.mySpring.springEx.partner.dao.PartnerDAO;
import com.mySpring.springEx.partner.vo.PartnerVO;

@Service("partnerService")
public class PartnerServiceImpl implements PartnerService {
	
	
	@Autowired
	private PartnerDAO partnerDAO;

	@Autowired
	public PageMapper pageMapper;
	
	
	//회사 리스트 출력
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

	
	//회사 상태별 count 출력
	@Override
	public List listNumPartner() throws DataAccessException {
		List<Integer> listNumPartner = new ArrayList<Integer>();;
		listNumPartner.add(partnerDAO.selectCooperationPartner());  //협력사 count
		listNumPartner.add(partnerDAO.selectConventionPartner());   //협약사 count
		listNumPartner.add(partnerDAO.selectIngPartner());			//협약 진행중 count
		listNumPartner.add(partnerDAO.selectNotPartner());			//미협약 count
		return listNumPartner;
	}
	
	//회사 정보 입력
	@Override
	public void addPartner(PartnerVO partner) throws DataAccessException {
		partnerDAO.addPartner(partner);
	}
	
	
	//기업 수정
	@Override
	public void modPartner(PartnerVO partner) throws DataAccessException {
		partnerDAO.updatePartner(partner);
	}
	
	
	//기업 정보 상세 폼 
	@Override
	public PartnerVO partnerDetailInfo(String partnerLicenseNum) throws DataAccessException {
		return partnerDAO.selectDetailPartner(partnerLicenseNum);
	}
	
	//기업 삭제 
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

	@Override
	public PartnerVO getCompanyInfo(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}
}
