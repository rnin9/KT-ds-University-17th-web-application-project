
package com.mySpring.springEx.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.survey.vo.DetailVO;
import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyService {
	/* public List listSurvey() throws DataAccessException; */

	public int addSurvey(SurveyVO survey) throws DataAccessException;

	public int removeSurvey(String survey_Id) throws DataAccessException;

	public List SelectAllList() throws Exception;

	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;

	public int testTableCount() throws Exception;

	public List<Map<String, Object>> SelectInsertList() throws Exception;

	public CourseTakeVO selectAllSurveylist(String userID, String syllabusID);

	public void insertSurvey(DetailVO detailVO);

	public CourseVO writeSurvey(String courseID) throws Exception;

	public void surveyInsert(SurveyVO surveyVO);

	public SurveyVO getQuestion(String courseID) throws Exception;

	public SurveyVO listSurveyInfo(String courseID);

	public int modifySurvey(@ModelAttribute("surveyVO")SurveyVO surveyVO);

	public List detailList(@RequestParam("courseID")String courseID) throws Exception;

	public SurveyVO surveyVO(String courseID);

	public DetailVO countParticipate(String courseID);

	public List<Map<String, Object>> infoGraph(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph2(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph3(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph4(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph5(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph6(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph7(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph8(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph9(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph10(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph11(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph12(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph13(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph14(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph15(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph16(String courseID) throws Exception;
	
	public List<Map<String, Object>> infoGraph17(String courseID) throws Exception;

	public List check_suerveyQuestion()throws DataAccessException; 
}
