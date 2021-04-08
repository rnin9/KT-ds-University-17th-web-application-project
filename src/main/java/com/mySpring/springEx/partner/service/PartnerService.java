package com.mySpring.springEx.partner.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerService {

	public List listPartner();
	
	public List listNumPartner() throws DataAccessException;

	public int addPartner(PartnerVO partner) throws DataAccessException;

}
