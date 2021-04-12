package com.mySpring.springEx.partner.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerService {

	public List listPartner();
	
	public List listNumPartner() throws DataAccessException;

	public void addPartner(PartnerVO partner) throws DataAccessException;
	
	public void modPartner(PartnerVO partner) throws DataAccessException;
	
	public PartnerVO partnerDetailInfo(String partnerLicenseNum) throws DataAccessException;

	public String removePartner(String partnerLicenseNum) throws DataAccessException;


}
