package com.mySpring.springEx.partner.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.mySpring.springEx.partner.dao.PartnerDAO;
import com.mySpring.springEx.partner.vo.PartnerVO;

@Service("partnerService")
public class PartnerServiceImpl implements PartnerService {
	
	
	@Autowired
	private PartnerDAO partnerDAO;
	
	@Override
	public List listPartner() throws DataAccessException {
		List partnerList = null;
		partnerList = partnerDAO.selectAllPartner();
		return partnerList;
	}
	
	
	@Override
	public List listNumPartner() throws DataAccessException {
		List<Integer> listNumPartner = new ArrayList<Integer>();;
		listNumPartner.add(partnerDAO.selectCooperationPartner());
		System.out.println("asd"+listNumPartner.get(0));
		listNumPartner.add(partnerDAO.selectConventionPartner());
		listNumPartner.add(partnerDAO.selectNotPartner());
		
		return listNumPartner;
	}
	
	@Override
	public int addPartner(PartnerVO partner) throws DataAccessException {
		System.out.println("애드파트너 서비스");
		return partnerDAO.addPartner(partner);
	}
}
