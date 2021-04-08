package com.mySpring.springEx.partner.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerDAO {

	public List selectAllPartner() throws DataAccessException;
	
	public int selectCooperationPartner() throws DataAccessException;
	
	public int selectConventionPartner() throws DataAccessException;
	
	public int selectNotPartner() throws DataAccessException;

	public int addPartner(PartnerVO partner) throws DataAccessException;

	

}
