package com.mySpring.springEx.survey.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyDAO {


	public int insertSurvey(SurveyVO surveyVO) throws DataAccessException;

	public int deleteSurvey(String survey_Id) throws DataAccessException;



}
