package com.mySpring.springEx.survey.vo;

import org.springframework.stereotype.Component;

import com.mySpring.springEx.course.vo.CourseVO;

@Component("questionVO")
public class QuestionVO {
	private int qNumber;
	private String questionName;
	private String question1;
	private String question2;
	private String question3;
	private String question4;
	private String question5;
	private String question6;
	private String question7;
	private String question8;
	private String question9;
	private String question10;
	private String question11;
	private String question12;
	private String question13;
	private String question14;
	private String question15;

	public QuestionVO() {

	}

	public QuestionVO(String question_Name, String question1, String question2, String question3, String question4,
			String question5, String question6, String question7, String question8, String question9, String question10,
			String question11, String question12, String question13, String question14, String question15,int qNumber) {
		this.questionName = question_Name;
		this.question1 = question1;
		this.question2 = question2;
		this.question3 = question3;
		this.question4 = question4;
		this.question5 = question5;
		this.question6 = question6;
		this.question7 = question7;
		this.question8 = question8;
		this.question9 = question9;
		this.question10 = question10;
		this.question11 = question11;
		this.question12 = question12;
		this.question13 = question13;
		this.question14 = question14;
		this.question15 = question15;
		this.qNumber = qNumber;
	}


	public int getqNumber() {
		return qNumber;
	}

	public void setqNumber(int qNumber) {
		this.qNumber = qNumber;
	}

	public String getQuestionName() {
		return questionName;
	}

	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}

	public String getQuestion1() {
		return question1;
	}

	public void setQuestion1(String question1) {
		this.question1 = question1;
	}

	public String getQuestion2() {
		return question2;
	}

	public void setQuestion2(String question2) {
		this.question2 = question2;
	}

	public String getQuestion3() {
		return question3;
	}

	public void setQuestion3(String question3) {
		this.question3 = question3;
	}

	public String getQuestion4() {
		return question4;
	}

	public void setQuestion4(String question4) {
		this.question4 = question4;
	}

	public String getQuestion5() {
		return question5;
	}

	public void setQuestion5(String question5) {
		this.question5 = question5;
	}

	public String getQuestion6() {
		return question6;
	}

	public void setQuestion6(String question6) {
		this.question6 = question6;
	}

	public String getQuestion7() {
		return question7;
	}

	public void setQuestion7(String question7) {
		this.question7 = question7;
	}

	public String getQuestion8() {
		return question8;
	}

	public void setQuestion8(String question8) {
		this.question8 = question8;
	}

	public String getQuestion9() {
		return question9;
	}

	public void setQuestion9(String question9) {
		this.question9 = question9;
	}

	public String getQuestion10() {
		return question10;
	}

	public void setQuestion10(String question10) {
		this.question10 = question10;
	}

	public String getQuestion11() {
		return question11;
	}

	public void setQuestion11(String question11) {
		this.question11 = question11;
	}

	public String getQuestion12() {
		return question12;
	}

	public void setQuestion12(String question12) {
		this.question12 = question12;
	}

	public String getQuestion13() {
		return question13;
	}

	public void setQuestion13(String question13) {
		this.question13 = question13;
	}

	public String getQuestion14() {
		return question14;
	}

	public void setQuestion14(String question14) {
		this.question14 = question14;
	}

	public String getQuestion15() {
		return question15;
	}

	public void setQuestion15(String question15) {
		this.question15 = question15;
	}

}
