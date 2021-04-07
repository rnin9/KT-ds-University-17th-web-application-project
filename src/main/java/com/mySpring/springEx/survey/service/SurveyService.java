
package com.mySpring.springEx.survey.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyService {
	public List listSurvey() throws DataAccessException;

	public int addSurvey(SurveyVO survey) throws DataAccessException;

	public int removeSurvey(String survey_Id) throws DataAccessException;
}
