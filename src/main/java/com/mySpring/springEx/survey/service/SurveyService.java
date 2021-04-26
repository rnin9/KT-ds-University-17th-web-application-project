
package com.mySpring.springEx.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.survey.vo.DetailVO;
import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyService {
	/* public List listSurvey() throws DataAccessException; */

	public int addSurvey(SurveyVO survey) throws DataAccessException;

	public int removeSurvey(String survey_Id) throws DataAccessException;

	public List<Map<String, Object>> SelectAllList() throws Exception;

	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;

	public int testTableCount() throws Exception;

	public List<Map<String, Object>> SelectInsertList() throws Exception;

	public CourseTakeVO selectAllSurveylist(String userID, String syllabusID);

	public void insertSurvey(DetailVO detailVO);

	public CourseVO writeSurvey(String syllabusID) throws Exception;

	public void surveyInsert(SurveyVO surveyVO);

	public SurveyVO getQuestion(String courseID) throws Exception;
}
