package com.mySpring.springEx.survey.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("surveyVO")
public class SurveyVO {
	private String survey_Id;
	private String survey_Mem;
	private String survey_Title;
	private Date writeDate;

	public String getSurvey_Id() {
		return survey_Id;
	}

	public void setSurvey_Id(String survey_Id) {
		this.survey_Id = survey_Id;
	}

	public String getSurvey_Mem() {
		return survey_Mem;
	}

	public void setSurvey_Mem(String survey_Mem) {
		this.survey_Mem = survey_Mem;
	}

	public String getSurvey_Title() {
		return survey_Title;
	}

	public void setSurvey_Title(String survey_Title) {
		this.survey_Title = survey_Title;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

}
