package com.mySpring.springEx.question.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import com.mySpring.springEx.question.vo.QuestionVO;

@Repository("questionDAO")
public class QuestionDAOImpl implements QuestionDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllQuestionList() throws DataAccessException {
		List<QuestionVO> questionList = null;
		questionList = sqlSession.selectList("mapper.question.selectAllQuestionList");
		return questionList;
	}
	
	@Override
	public List userQuestionList(String userId) throws DataAccessException {
		List<QuestionVO> questionList = null;
		questionList = sqlSession.selectList("mapper.question.userListQuestion", userId);
		return questionList;
	}
	@Override
	public void insertQuestion(QuestionVO questionVO) throws DataAccessException {
		sqlSession.insert("mapper.question.insertQuestion", questionVO);
		
	}
	
	@Override
	public void addComment(QuestionVO questionVO) throws DataAccessException {
		sqlSession.update("mapper.question.addComment", questionVO);
	}
	@Override
	public QuestionVO readQuestion(int questionNum)throws DataAccessException {
		return sqlSession.selectOne("mapper.question.readQuestion" , questionNum);	
	}
	
	@Override
	public void modQuestion(QuestionVO questionVO) throws DataAccessException {
		 sqlSession.update("mapper.question.modQuestion", questionVO);
	}
	
	@Override
	public void userDeleteQuestion(int questionNum) throws DataAccessException {
		sqlSession.update("mapper.question.userDeleteQuestion", questionNum);
	}
	
	@Override
	public void adminShowQuestion(int questionNum) throws DataAccessException {
		sqlSession.update("mapper.question.adminShowQuestion", questionNum);
	}
	@Override
	public void deleteQuestion(int questionNum) throws DataAccessException {
		 sqlSession.delete("mapper.question.deleteQuestion", questionNum);
	}
}
