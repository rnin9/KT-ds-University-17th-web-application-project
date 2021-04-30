package com.mySpring.springEx.question.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.question.vo.QuestionVO;

public interface QuestionService {
	public List listQuestion() throws DataAccessException;
	public List userQuestionList(String userId) throws DataAccessException;
	public void insertQuestion(QuestionVO questionVO) throws DataAccessException;
	public void addComment(QuestionVO questionVO) throws DataAccessException;
	public QuestionVO readQuestion(int questionNum) throws DataAccessException;
	public void questionMod(QuestionVO questionVO) throws DataAccessException;
	public void userDeleteQuestion(int questionNum) throws DataAccessException;
	public void adminShowQuestion(int questionNum) throws DataAccessException;
	public void deleteQuestion(int questionNum) throws DataAccessException;
}
