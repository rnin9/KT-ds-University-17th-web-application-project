package com.mySpring.springEx.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.partner.vo.PartnerVO;

public interface MemberDAO {
	public List selectAllMemberList() throws DataAccessException;

	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public int deleteMember(String id) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public int check_id(String id) throws Exception;
	
	public int check_email(String email) throws Exception;

	public int join_member(MemberVO member) throws Exception;

	public int approval_member(MemberVO member) throws Exception;

	public List selectAllRecruitList() throws DataAccessException;

	public List selectAllApplicationList(String id) throws DataAccessException;

	public List selectAllSuggestionList(String id) throws DataAccessException;

	public int userApplyPartner(String partnerApplyUserID, String partnerApplyPartnerID) throws Exception;

	public int deleteApplication(String partnerApplyUserID, String partnerApplyPartnerID) throws Exception;

	public int deleteSuggestion(String partnerID, String userID) throws Exception;

	public int acceptSuggestion(String partnerID, String userID) throws Exception;

	public int rejectSuggestion(String partnerID, String userID) throws Exception;

	public MemberVO getMyInformation(String userID) throws Exception;
	
	//나의 수강신청내역
	public List selectAllMyCourseList(String userID) throws DataAccessException;
	
	public int modMyInfo(MemberVO member) throws Exception; 
	
	public PartnerVO partnerLogInById(MemberVO member) throws Exception;

	public List listPartners() throws DataAccessException;

	public int resetPW(String userID) throws Exception;

	public int positionModify(String newPotision, String userID) throws Exception;

	public int handleWithdrawal(String userID) throws Exception;

	public List userWithdrawalList() throws DataAccessException;

	public int deleteUser(String userID) throws DataAccessException;

}
