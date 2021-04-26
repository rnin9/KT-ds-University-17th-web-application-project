package com.mySpring.springEx.survey.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.survey.vo.DetailVO;
import com.mySpring.springEx.survey.vo.SurveyVO;

@Repository("surveyDAO")
public class SurveyDAOImpl implements SurveyDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertSurvey(SurveyVO surveyVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.survey.insertSurvey", surveyVO);
		return result;
	}

	@Override
	public int deleteSurvey(String survey_Id) throws DataAccessException {
		int result = sqlSession.delete("mapper.survey.deleteSurvey", survey_Id);
		return result;
	}

	@Override
	public CourseTakeVO selectAllSurveylist(String userID, String courseID) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userID", userID);
		map.put("courseID", courseID);
		System.out.println("=================================================" + map);
		return sqlSession.selectOne("mapper.courseTake.get_SurveyItem", map);
	}

	@Override
	public void insertSurvey(DetailVO detailVO) {
		sqlSession.selectOne("mapper.survey.insertSurveyAnswer", detailVO);
	}

	@Override
	public CourseVO writeSurvey(String syllabusID) {
		return sqlSession.selectOne("mapper.course.wirteSurvey", syllabusID);
	}

	@Override
	public void surveyInsert(SurveyVO surveyVO) {
		sqlSession.selectOne("mapper.survey.insertSurveyQuestion", surveyVO);
	}

	@Override
	public SurveyVO getQuestion(String courseID) {
		return sqlSession.selectOne("mapper.survey.getQuestion", courseID);
	}
}
