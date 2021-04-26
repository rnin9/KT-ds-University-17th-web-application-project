package com.mySpring.springEx.survey.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.survey.vo.DetailVO;
import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyDAO {


	public int insertSurvey(SurveyVO surveyVO) throws DataAccessException;

	public int deleteSurvey(String survey_Id) throws DataAccessException;

	public CourseTakeVO selectAllSurveylist(String userID, String syllabusID);

	public void insertSurvey(DetailVO detailVO);

	public CourseVO writeSurvey(String syllabusID);

	public void surveyInsert(SurveyVO surveyVO);

	public SurveyVO getQuestion(String courseID);



}
