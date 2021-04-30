package com.mySpring.springEx.partner.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerService {
	
	public List SelectAllListPartner() throws Exception;
	
	public List listNumPartner() throws DataAccessException;

	public void addPartner(PartnerVO partner) throws DataAccessException;
	
	public void modPartner(PartnerVO partner) throws DataAccessException;
	
	public PartnerVO partnerDetailInfo(String partnerLicenseNum) throws DataAccessException;

	public String removePartner(String partnerLicenseNum) throws DataAccessException;

	public PartnerVO getCompanyInfo (String partnerLicenseNum) throws DataAccessException;
}
