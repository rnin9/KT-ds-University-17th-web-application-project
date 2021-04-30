package com.mySpring.springEx.resume.dao;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.resume.vo.ResumeVO;

@Repository("resumeDAO")
public class ResumeDAOImpl implements ResumeDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ResumeVO> selectResumeList(String resumeUser) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.selectResumeList", resumeUser);	
	}

	@Override
	public void resumeCheck(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.resumeAllCheck", resume);
		sqlSession.update("mapper.resume.resumeCheck", resume);
	}
	
	
	@Override
	public List selectAllResumeList() throws DataAccessException {
		List<ResumeVO> AllResumeLists = null;
		AllResumeLists = sqlSession.selectList("mapper.resume.selectAllResumeList");
		return AllResumeLists;
	}
	
	@Override
	public ResumeVO resumeInfo(String resumeID) throws DataAccessException {
		ResumeVO resumeVO = sqlSession.selectOne("mapper.resume.infoResume", resumeID);
		return resumeVO; 
	}
	 
	@Override
	public List<ResumeVO> resumeInfo_career(String resumeUser) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.infoResume_career", resumeUser);
	}
	
	@Override
	public List<ResumeVO> resumeInfo_certificate(String resumeUser) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.infoResume_certificate", resumeUser);
	}
	
	@Override
	public List<ResumeVO> resumeInfo_foreign(String resumeUser) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.infoResume_foreign", resumeUser);
	}
	
	@Override
	public List<ResumeVO> resumeInfo_project(String resumeUser) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.infoResume_project", resumeUser);
	}
	
	

	@Override
	public void addResume(ResumeVO resume) throws DataAccessException {
		sqlSession.insert("mapper.resume.resumePage1", resume);
		
	}
	
	
	@Override
	public void createResume(ResumeVO resume) throws DataAccessException {
		sqlSession.insert("mapper.resume.createResume",resume);
		
	}
	
	//page1 picture  update
	@Override
	public void resumePic(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.resumePic", resume);
	}
	
/*page2*/
	
	//page2 select
	@Override
	public List<ResumeVO> selectCertificafeList(ResumeVO resume) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.selectCertificafeList", resume);	
	}
	//page2 select
	@Override
	public List<ResumeVO> selectForeignList(ResumeVO resume) throws DataAccessException {
		return sqlSession.selectList("mapper.resume.selectForeignList", resume);	
	}
	
	
	//page2 insert
	@Override
	public void insertCertificate(ResumeVO resume) throws DataAccessException {
		sqlSession.insert("mapper.resume.insertCertificate",resume);
	}
	
	//page2  delete
	@Override
	public void deleteCertificate(int certificateSEQ) throws DataAccessException {
		sqlSession.delete("mapper.resume.deleteCertificate",certificateSEQ);
	}
	
	//page2 
	@Override
	public void insertForeign(ResumeVO resume) throws DataAccessException {
		sqlSession.insert("mapper.resume.insertForeign",resume);	
	}
	
	//page2 delete
	@Override
	public void deleteForeign(int foreignSEQ) throws DataAccessException {
		sqlSession.delete("mapper.resume.deleteForeign",foreignSEQ);
	}
	
	//page2 update
	@Override
	public void updatePage2Education(ResumeVO resume) throws DataAccessException{
		sqlSession.update("mapper.resume.updateEducation",resume);
	}
	
	//page2  update
	@Override
	public void updatePage2Certificate(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.updateCertificate", resume);
	}

	// page2update
	@Override
	public void updatePage2Foreign(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.updateForeign", resume);
	}
	
/*page2 END*/
	
/*page3*/
	
	@Override
	public void insertCareer(ResumeVO resume) throws DataAccessException{
		sqlSession.insert("mapper.resume.insertCareer",resume);
	}
	
	@Override
	public void insertEducation(ResumeVO resume) throws DataAccessException{
		sqlSession.insert("mapper.resume.insertEducation",resume);
	}
	
	@Override
	public void deleteCareer(int careerSEQ) throws DataAccessException {
		sqlSession.delete("mapper.resume.deleteCareer",careerSEQ);
	}
	
	@Override
	public List<ResumeVO> selectCareerList(ResumeVO resume) throws DataAccessException{
		return sqlSession.selectList("mapper.resume.selectCareerList",resume);
	}
	
	@Override
	public List<ResumeVO> selectEducationList(ResumeVO resume) throws DataAccessException{
		return sqlSession.selectList("mapper.resume.selectEducationList",resume);
	}
	
	@Override
	public void updatePage3Career(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.updateCareer", resume);
	}
	
/*page3 end*/
	
/*page4*/
	@Override
	public void insertProject(ResumeVO resume) throws DataAccessException{
		sqlSession.insert("mapper.resume.insertProject",resume);
	}
	
	@Override
	public void deleteProject(int projectSEQ) throws DataAccessException {
		sqlSession.delete("mapper.resume.deleteProject",projectSEQ);
	}

	@Override
	public List<ResumeVO> selectProjectList(ResumeVO resume) throws DataAccessException{
		return sqlSession.selectList("mapper.resume.selectProjectList", resume);
	}
	
	@Override
	public void updatePage4Project(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.updateProject", resume);
	}
/*page4 end*/
	
	
/*page5*/
	@Override
	public void updatePage5Self(ResumeVO resume) throws DataAccessException {
		sqlSession.update("mapper.resume.updateSelf", resume);
	}
/*page5 end*/	
	@Override
	public int deleteResume(String resumeID) throws DataAccessException{
		int result = sqlSession.delete("mapper.resume.deleteResume", resumeID);
		return result;
	}
	
	@Override
	public String getResumeUser(String resumeID) throws DataAccessException{
		return sqlSession.selectOne("mapper.resume.getResumeUser", resumeID);
		
	}
}