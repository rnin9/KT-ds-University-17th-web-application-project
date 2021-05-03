package com.mySpring.springEx.partner.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import com.mySpring.springEx.application.vo.ApplicationVO;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;

@Repository("partnerDAO")
public class PartnerDAOImpl implements PartnerDAO {

	@Autowired
	private SqlSession sqlSession;

	// partner List Select
	@Override
	public List selectAllPartner() throws DataAccessException {
		List<PartnerVO> partnerList = null;
		partnerList = sqlSession.selectList("mapper.partner.selectAllPartnerList"); // mapper.partner
																					// selectAllPartnerList
		return partnerList;

	}

	// Cooperation Count
	public int selectCooperationPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectCooperationPartner"); // mapper.partner
																				// selectCooperationPartner

	}

	// convention Count
	public int selectConventionPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectConventionPartner"); // mapper.partner selectConventionPartner

	}

	// Ing partner Count
	public int selectIngPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectIngPartner"); // mapper.partner selectIngPartner

	}

	// Not partner count
	public int selectNotPartner() throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectNotPartner"); // mapper.partner selectNotPartner

	}

	// partner Add
	public int addPartner(PartnerVO partner) throws DataAccessException {
		int result = sqlSession.insert("mapper.partner.addPartner", partner); // mapper.partner partner insert
		return result;
	}

	public int updatePartner(PartnerVO partner) throws DataAccessException {
		int result = sqlSession.update("mapper.partner.updatePartner", partner);
		return result;
	}

	public PartnerVO selectDetailPartner(String partnerLicenseNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.selectDetailPartner", partnerLicenseNum);

	}

	public void deletePartner(String partnerLicenseNum) throws DataAccessException {
		sqlSession.delete("mapper.partner.deletePartner", partnerLicenseNum);
	}

	public String partnerName(String partnerLicenseNum) throws DataAccessException {
		System.out.println("dao�씠由�" + sqlSession.selectOne("mapper.partner.partnerName", partnerLicenseNum));
		return sqlSession.selectOne("mapper.partner.partnerName", partnerLicenseNum);
	}

	// 아이디 중복 검사
	@Override
	public int check_licenseNum(String partnerLicenseNum) throws Exception {
		return sqlSession.selectOne("mapper.partner.check_licenseNum", partnerLicenseNum);
	}

	/* company-partner Method Start */
	@Override
	public PartnerVO getCompanyInformation(String partnerLicenseNum) throws DataAccessException {
		return sqlSession.selectOne("mapper.partner.getCompanyInfo", partnerLicenseNum);
	}

	// graph information ajax
	@Override
	public List getInfoGraph(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.partner.companyGraphInfo", partnerLicenseNum);
	}

	// select all Employee of Company
	@Override
	public List SelectAllListCompanyEmployee(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.partner.companyEmployeeList", partnerLicenseNum);
	}

	// post job opening
	public int postJobOpening(String partnerLicenseNum, String date) throws DataAccessException {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("partnerLicenseNum", partnerLicenseNum);
		map.put("date", date);
		int result = sqlSession.update("mapper.partner.postJobOpening", map);
		return result;
	}

	public int deleteJobOpening(String partnerLicenseNum) throws DataAccessException {
		int result = sqlSession.update("mapper.partner.deleteJobOpening", partnerLicenseNum);
		return result;
	}

	public List<Map<String, Object>> selectPartnerApplyN() throws DataAccessException {
//		List<HashMap<String, Object>> applicationList = sqlSession.selectList("mapper.member.selectAllApplicationList", id);
		return sqlSession.selectList("mapper.partner.selectPartnerApplyN");
	}

	public List<Map<String, Object>> selectJobOpeningList() throws DataAccessException {
		return sqlSession.selectList("mapper.partner.selectJobOpeningList");
	}

//	@Scheduled(cron="0 0/1 * * * *")
//	public void autoUpdate() {
//		System.out.println("123123");
//		sqlSession.update("mapper.course.autoUpdateCourse");
//	}

	@Override
	public List<Map<String, Object>> getApplyList(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.partner.companyApplyList", partnerLicenseNum);
	}

	@Override
	public List getRecruitList(String partnerLicenseNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.partner.companyRecruitment", partnerLicenseNum);
	}

	@Override
	public ResumeVO getUserResume(String resumeID) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.partner.getResume", resumeID);
	}

	@Override
	public void updateManageApply(ApplicationVO application) throws DataAccessException {
		sqlSession.update("mapper.partner.manageUserApply", application);
		return;
	}

	@Override
	public void insertSuggestion(SuggestionVO suggestion) throws DataAccessException {
		sqlSession.insert("mapper.partner.insertSuggestion", suggestion);
		return;
	}

	@Override
	public void deleteSuggestionFromCompany(SuggestionVO suggestion) throws DataAccessException {
		sqlSession.update("mapper.partner.deleteSuggestionFromCompany", suggestion);
		return;

	}

	@Override
	public List getUserCer(String resumeID, String userID) throws DataAccessException {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resumeID", resumeID);
		map.put("userID", userID);
		return sqlSession.selectList("mapper.partner.getCerResume", map);
	}

	@Override
	public List getUserPro(String resumeID, String userID) throws DataAccessException {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resumeID", resumeID);
		map.put("userID", userID);
		return sqlSession.selectList("mapper.partner.getProResume", map);
	}

	@Override
	public List getUserCarr(String resumeID, String userID) throws DataAccessException {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resumeID", resumeID);
		map.put("userID", userID);
		return sqlSession.selectList("mapper.partner.getCarrResume", map);
	}

	@Override
	public List getUserFor(@Param("resumeID") String resumeID, @Param("userID") String userID)
			throws DataAccessException {
		// TODO Auto-generated method stub
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resumeID", resumeID);
		map.put("userID", userID);
		return sqlSession.selectList("mapper.partner.getForResume", map);
	}

	/* partner company method End */

}