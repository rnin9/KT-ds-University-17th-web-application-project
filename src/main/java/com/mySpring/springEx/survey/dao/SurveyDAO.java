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

	public CourseVO writeSurvey(String courseID);

	public void surveyInsert(SurveyVO surveyVO);

	public SurveyVO getQuestion(String courseID);

	public SurveyVO listSurveyInfo(String courseID);

	public int modifySurvey(SurveyVO surveyVO);

	public List detailList(String courseID) throws DataAccessException;

	public SurveyVO surveyVO(String courseID);

	public DetailVO countParticipate(String courseID);

	public List getInfoGraph(String partnerLicenseNum) throws DataAccessException;

	public List getInfoGraph2(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph3(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph4(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph5(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph6(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph7(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph8(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph9(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph10(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph11(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph12(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph13(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph14(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph15(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph16(String partnerLicenseNum) throws DataAccessException;
	
	public List getInfoGraph17(String partnerLicenseNum) throws DataAccessException;

	public List check_suerveyQuestion() throws DataAccessException;

	public List SelectAllList() throws DataAccessException;
	
}
