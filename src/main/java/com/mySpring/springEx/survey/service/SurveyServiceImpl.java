package com.mySpring.springEx.survey.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.survey.dao.SurveyDAO;
import com.mySpring.springEx.survey.vo.SurveyVO;

@Service("surveyService")
@Transactional(propagation = Propagation.REQUIRED)
public class SurveyServiceImpl implements SurveyService{
	@Autowired
	private SurveyDAO surveyDAO;

	@Override
	public List listSurvey() throws DataAccessException {
		List surveyList = null;
		surveyList = surveyDAO.selectAllSurveyList();
		return surveyList;
	}
	
	@Override
	public int addSurvey(SurveyVO survey) throws DataAccessException {
		return surveyDAO.insertSurvey(survey);
	}
	
	//설문조사삭제
	@Override
	public int removeSurvey(String survey_Id) throws DataAccessException {
		return surveyDAO.deleteSurvey(survey_Id);
	}
}
