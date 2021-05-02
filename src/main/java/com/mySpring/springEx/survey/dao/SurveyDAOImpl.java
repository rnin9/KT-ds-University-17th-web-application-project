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
import com.mySpring.springEx.survey.vo.SurveyQuestionVO;
import com.mySpring.springEx.survey.vo.SurveyVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

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
	public CourseVO writeSurvey(String courseID) {
		return sqlSession.selectOne("mapper.course.wirteSurvey", courseID);
	}
	@Override
	public List check_suerveyQuestion() {
		List<SurveyQuestionVO> questionList = null;
		questionList = sqlSession.selectList("mapper.survey.check_suerveyQuestion");
		return questionList;
	}

	@Override
	public void surveyInsert(SurveyVO surveyVO) {
		sqlSession.selectOne("mapper.survey.insertSurveyQuestion", surveyVO);
	}

	@Override
	public SurveyVO getQuestion(String courseID) {
		return sqlSession.selectOne("mapper.survey.getQuestion", courseID);
	}

	@Override
	public SurveyVO listSurveyInfo(String courseID) {
		return sqlSession.selectOne("mapper.survey.listSurveyInfo",courseID);
	}

	@Override
	public int modifySurvey(SurveyVO surveyVO) {
		int result = sqlSession.update("mapper.survey.surveyModify", surveyVO);
		return result;
	}

	@Override
	public List detailList(String courseID) throws DataAccessException {
		List<DetailVO>detailList = null;
		detailList = sqlSession.selectList("mapper.survey.detailList",courseID);
		return detailList;
	}

	//설문 지문 가져오기..
	@Override
	public SurveyVO surveyVO(String courseID) {
		return sqlSession.selectOne("mapper.survey.getSurveyVO",courseID);
	}

	@Override
	public DetailVO countParticipate(String courseID) {
		return sqlSession.selectOne("mapper.survey.countParticipate",courseID);
	}

	@Override
	public List getInfoGraph(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo", courseID);
	}

	@Override
	public List getInfoGraph2(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo2", courseID);
	}
	
	@Override
	public List getInfoGraph3(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo3", courseID);
	}
	
	@Override
	public List getInfoGraph4(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo4", courseID);
	}
	
	@Override
	public List getInfoGraph5(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo5", courseID);
	}
	
	@Override
	public List getInfoGraph6(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo6", courseID);
	}
	
	@Override
	public List getInfoGraph7(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo7", courseID);
	}
	
	@Override
	public List getInfoGraph8(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo8", courseID);
	}
	
	@Override
	public List getInfoGraph9(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo9", courseID);
	}
	
	@Override
	public List getInfoGraph10(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo10", courseID);
	}
	
	@Override
	public List getInfoGraph11(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo11", courseID);
	}
	
	@Override
	public List getInfoGraph12(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo12", courseID);
	}
	
	@Override
	public List getInfoGraph13(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo13", courseID);
	}
	
	@Override
	public List getInfoGraph14(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo14", courseID);
	}
	
	@Override
	public List getInfoGraph15(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo15", courseID);
	}
	
	@Override
	public List getInfoGraph16(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo16", courseID);
	}
	
	@Override
	public List getInfoGraph17(String courseID) throws DataAccessException {
		return sqlSession.selectList("mapper.survey.surveyGraphInfo17", courseID);
	}

	@Override
	public List SelectAllList() throws DataAccessException {
		List<SyllabusVO> surveyList = null;
		surveyList = sqlSession.selectList("mapper.syllabus.selectSurveyList");
		return surveyList;
	}

	@Override
	public CourseTakeVO Allperson(String courseID) {
		return sqlSession.selectOne("mapper.survey.Allperson",courseID);
	}

	@Override
	public List AllPersonId(String courseID) {
		List AllPersonId = null;
		AllPersonId = sqlSession.selectList("mapper.survey.AllPersonId",courseID);
		return AllPersonId;
	}

	@Override
	public CourseTakeVO dontParticipateAllPerson(String courseID) {
		return sqlSession.selectOne("mapper.survey.dontParticipateAllPerson",courseID);
	}

	@Override
	public List dontParticipateAllPersonId(String courseID) {
		List dontParticipateAllPersonId = null;
		dontParticipateAllPersonId = sqlSession.selectList("mapper.survey.dontParticipateAllPersonId",courseID);
		return dontParticipateAllPersonId;
	}



	
	
}
