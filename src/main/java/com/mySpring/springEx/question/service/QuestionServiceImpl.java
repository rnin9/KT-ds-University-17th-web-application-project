package com.mySpring.springEx.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.question.dao.QuestionDAO;
import com.mySpring.springEx.question.vo.QuestionVO;


@Service("QuestionService")
@Transactional(propagation = Propagation.REQUIRED)
public class QuestionServiceImpl implements QuestionService{
	@Autowired
	private QuestionDAO questionDAO;
	
	@Override
	public List listQuestion() throws DataAccessException {
		List QuestionList = null;
		QuestionList = questionDAO.selectAllQuestionList();
		return QuestionList;
	}
	
	@Override
	public List userQuestionList(String userId) throws DataAccessException {
		List QuestionList = null;
		QuestionList = questionDAO.userQuestionList(userId);
		return QuestionList;
	}
	@Override
	public void insertQuestion(QuestionVO questionVO) throws DataAccessException {
		   
		questionDAO.insertQuestion(questionVO);
	}
	
	@Override
	public void addComment(QuestionVO questionVO) throws DataAccessException {
		questionDAO.addComment(questionVO);
	}
	@Override
	public QuestionVO readQuestion(int questionNum) throws DataAccessException{
		System.out.println("readQuestion");
		return questionDAO.readQuestion(questionNum);

	}
	
	@Override
	public void questionMod(QuestionVO questionVO) throws DataAccessException{
		System.out.println("modQuestion");
		questionDAO.modQuestion(questionVO);
	}
	
	@Override
	public void userDeleteQuestion(int questionNum) throws DataAccessException{
		System.out.println("userDeleteQuestion");
		questionDAO.userDeleteQuestion(questionNum);
	}
	
	@Override
	public void adminShowQuestion(int questionNum) throws DataAccessException{
		questionDAO.adminShowQuestion(questionNum);
	}
	@Override
	public void deleteQuestion(int questionNum) throws DataAccessException {
		 questionDAO.deleteQuestion(questionNum);
	}
}