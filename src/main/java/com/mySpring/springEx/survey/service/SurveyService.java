
package com.mySpring.springEx.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.survey.vo.SurveyVO;

public interface SurveyService {
	/* public List listSurvey() throws DataAccessException; */

	public int addSurvey(SurveyVO survey) throws DataAccessException;

	public int removeSurvey(String survey_Id) throws DataAccessException;

	public List<Map<String, Object>> SelectAllList() throws Exception;

	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;

	public int testTableCount() throws Exception;
}
