package com.mySpring.springEx.question.vo;


import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("questionVO")
public class QuestionVO {
	private int questionNum;
	private String userId;
	private String questionType;
	private String questionTitle;
	private String questionContent;
	private Date questionRegDate;
	private String question_del_YN;
	private String questionFileName;
	private String questionCommentTitle;
	private String questionCommentContent;
	private Date questionCommentRegDate;
	
	public QuestionVO() {
		
	}
	public QuestionVO(int questionNum, String userId, String questionType, String questionTitle, String questionContent,
			Date questionRegDate, String question_del_YN, String questionFileName, String questionCommentTitle, String questionCommentContent, Date questionCommentRegDate) {
		this.questionNum = questionNum;
		this.userId = userId;
		this.questionType = questionType;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionRegDate = questionRegDate;
		this.questionFileName = questionFileName;
		this.questionCommentTitle = questionCommentTitle;
		this.questionCommentContent = questionCommentContent;
		this.questionCommentRegDate = questionCommentRegDate;
	}
	
	public int getQuestionNum() {
		return questionNum;
	}
	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public Date getQuestionRegDate() {
		return questionRegDate;
	}
	public void setQuestionRegDate(Date questionRegDate) {
		this.questionRegDate = questionRegDate;
	}
	public String getQuestion_del_YN() {
		return question_del_YN;
	}
	public void setQuestion_del_YN(String question_del_YN) {
		this.question_del_YN = question_del_YN;
	}
	public String getQuestionFileName() {
		return questionFileName;
	}
	public void setQuestionFileName(String questionFileName) {
		this.questionFileName = questionFileName;
	}
	public String getQuestionCommentTitle() {
		return questionCommentTitle;
	}
	public void setQuestionCommentTitle(String questionCommentTitle) {
		this.questionCommentTitle = questionCommentTitle;
	}
	public String getQuestionCommentContent() {
		return questionCommentContent;
	}
	public void setQuestionCommentContent(String questionCommentContent) {
		this.questionCommentContent = questionCommentContent;
	}
	public Date getQuestionCommentRegDate() {
		return questionCommentRegDate;
	}
	public void setQuestionCommentRegDate(Date questionCommentRegDate) {
		this.questionCommentRegDate = questionCommentRegDate;
	}
}	
