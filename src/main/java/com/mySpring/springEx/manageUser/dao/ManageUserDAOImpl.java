package com.mySpring.springEx.manageUser.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.member.vo.MemberVO;

@Repository("manageUserDAO")
@Transactional(propagation=Propagation.REQUIRED)
public class ManageUserDAOImpl implements ManageUserDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectUserList() throws DataAccessException {
		List<MemberVO> userList = null;
		userList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return userList;
	}

}
