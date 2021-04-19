package com.mySpring.springEx.member.dao;

import java.util.HashMap;
import java.util.List;

import com.mySpring.springEx.application.vo.ApplicationVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.survey.vo.SurveyVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PartnerVO partnerVO;

	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	@Override
	public List listPartners() throws DataAccessException {
		List<SurveyVO> partnersName = null;
		partnersName = sqlSession.selectList("mapper.member.selectAllPartnerList");
		return partnersName;
	}

	@Override
	public List selectAllRecruitList() throws DataAccessException {
		List<PartnerVO> partnerList = null;
		partnerList = sqlSession.selectList("mapper.member.selectAllRecruitList");
		return partnerList;
	}

	@Override
	public List selectAllApplicationList(String id) throws DataAccessException {
		List<HashMap<String, String>> applicationList = sqlSession.selectList("mapper.member.selectAllApplicationList", id);
		return applicationList;
	}

	public int userApplyPartner(String partnerApplyUserID, String partnerApplyPartnerID) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("partnerApplyUserID", partnerApplyUserID);
		map.put("partnerApplyPartnerID", partnerApplyPartnerID);
		return sqlSession.insert("mapper.member.user_apply", map);
	}

	public int deleteApplication(String partnerApplyUserID, String partnerApplyPartnerID) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("partnerApplyUserID", partnerApplyUserID);
		map.put("partnerApplyPartnerID", partnerApplyPartnerID);
		return sqlSession.delete("mapper.member.deleteApplication", map);
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}

	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		vo.setResume((String) sqlSession.selectOne("mapper.member.check_resume", vo.getUserId()));
		return vo;
	}
	//test용
	// 아이디 중복 검사
	@Override
	public int check_id(String id) throws Exception {
		return sqlSession.selectOne("mapper.member.check_id", id);
	}

	// 이메일 중복 검사
	@Override
	public int check_email(String email) throws Exception {
		return sqlSession.selectOne("mapper.member.check_email", email);
	}

	// 회원가입
	@Transactional
	@Override
	public int join_member(MemberVO member) throws Exception {
		return sqlSession.insert("mapper.member.join_member", member);
	}

	// 이메일 인증
	@Transactional
	@Override
	public int approval_member(MemberVO member) throws Exception {
		return sqlSession.update("mapper.member.approval_member", member);
	}


	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 내정보페이지 정보들
	@Override
	public MemberVO getMyInformation(String userID) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.get_myInformation",userID);
	}
	
	@Override
	public int modMyInfo(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.member.mod_myInformation", member);
	}

	@Override
	public PartnerVO partnerLogInById(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.member.partnerLoginById",member);
	}




	
	

}
