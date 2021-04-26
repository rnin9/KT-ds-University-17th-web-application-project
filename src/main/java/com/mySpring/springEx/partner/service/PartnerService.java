package com.mySpring.springEx.partner.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.partner.vo.PartnerVO;

public interface PartnerService {

	public List<Map<String, Object>> SelectAllListPartner() throws Exception;

	public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;

	public int testTableCountPartner() throws Exception;

	public List listNumPartner() throws DataAccessException;

	public void addPartner(PartnerVO partner) throws DataAccessException;

	public void modPartner(PartnerVO partner) throws DataAccessException;

	public PartnerVO partnerDetailInfo(String partnerLicenseNum) throws DataAccessException;

	public String removePartner(String partnerLicenseNum) throws DataAccessException;

	/* 기업관련 */

	public List<Map<String, Object>> SelectAllListCompanyEmployee(String partnerLicenseNum)
			throws Exception;

	// 직원 수 계산

	public List<Map<String, Object>> infoGraph(String partnerLicenseNum) throws Exception;
	
	/* 기업관련 끝 */
}
