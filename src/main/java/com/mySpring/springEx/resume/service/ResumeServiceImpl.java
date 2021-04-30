package com.mySpring.springEx.resume.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.resume.dao.ResumeDAO;
import com.mySpring.springEx.resume.vo.ResumeVO;

@Service("resumeService")
@Transactional(propagation = Propagation.REQUIRED)
public class ResumeServiceImpl implements ResumeService {
	
	@Autowired
	private ResumeDAO resumeDAO;
	
	@Override
	public List<ResumeVO> resumeLists(String resumeUser) throws DataAccessException {
		return resumeDAO.selectResumeList(resumeUser);	
	}
	
	@Override
	public void resumeCheck(ResumeVO resumeVO) throws DataAccessException {
		resumeDAO.resumeCheck(resumeVO);
	} 
	
	@Override
	public List allResumeLists() throws DataAccessException {
		List allResumeList = null;
		allResumeList = resumeDAO.selectAllResumeList();
		return allResumeList;
	}
	
	@Override
	public ResumeVO resumeInfos(String resumeID) throws DataAccessException {
		ResumeVO resumeVO = resumeDAO.resumeInfo(resumeID);	
		return resumeVO; 
	}
	
	@Override
	public List resumeInfos_detail(String resumeUser) throws DataAccessException {
		List resumeInfos = new ArrayList();
		resumeInfos.add(resumeDAO.resumeInfo_career(resumeUser));
		resumeInfos.add(resumeDAO.resumeInfo_certificate(resumeUser));
		resumeInfos.add(resumeDAO.resumeInfo_foreign(resumeUser));
		resumeInfos.add(resumeDAO.resumeInfo_project(resumeUser));
		return resumeInfos;	
	}
	
	/*@Override
	public int insertResume(ResumeVO resume) throws DataAccessException {
		return resumeDAO.insertResume(resume);
	}*/
	
	@Override
	public void createResume(ResumeVO resume) throws DataAccessException {
		resumeDAO.createResume(resume);
	}
	
/*page1*/	
	//page1
	@Override
	public void addResume(ResumeVO resume) throws DataAccessException {
		 resumeDAO.addResume(resume);
	}
	
	@Override
	public void resumePic(ResumeVO resume) throws DataAccessException {
		 resumeDAO.resumePic(resume);
	}
	
	

/*page2*/
	//page2 select
	@Override
	public List<ResumeVO> selectCertificateList(ResumeVO resume) throws DataAccessException {
		return resumeDAO.selectCertificafeList(resume);	
	}
	//page2 select
	@Override
	public List<ResumeVO> selectForeignList(ResumeVO resume) throws DataAccessException {
		return resumeDAO.selectForeignList(resume);	
	}
	
	//page2 insert
	@Override
	public void insertCertificate(ResumeVO resume) throws DataAccessException {
		 resumeDAO.insertCertificate(resume);
	}
	
	//page2 delete
	public void deleteCertificate(int certificateSEQ) throws DataAccessException {
		resumeDAO.deleteCertificate(certificateSEQ);
	}
	
	//page2 insert
	@Override
	public void insertForeign(ResumeVO resume) throws DataAccessException {
		resumeDAO.insertForeign(resume);
	}
	
	//page2 delete
	@Override
	public void deleteForeign(int foreignSEQ) throws DataAccessException {
		resumeDAO.deleteForeign(foreignSEQ);
	}
	
	
	//page2 update
	@Override
	public void updatePage2Education(ResumeVO resume) throws DataAccessException {
		resumeDAO.updatePage2Education(resume);
	}
	
	//page2 update
	@Override
	public void updatePage2Certificate(ResumeVO resume) throws DataAccessException {
		resumeDAO.updatePage2Certificate(resume);
	}
		
	//page2 update
	@Override
	public void updatePage2Foreign(ResumeVO resume) throws DataAccessException {
		resumeDAO.updatePage2Foreign(resume);
	}
	
/*page2 END*/
	
/*page3*/
	
	
	@Override
	public void insertCareer(ResumeVO resume) throws DataAccessException {
		 resumeDAO.insertCareer(resume);
	}
	
	@Override
	public void insertEducation(ResumeVO resume) throws DataAccessException {
		 resumeDAO.insertEducation(resume);
	}
	
	@Override
	public void deleteCareer(int careerSEQ) throws DataAccessException {
		 resumeDAO.deleteCareer(careerSEQ);
	}
	
	
	
	@Override
	public List<ResumeVO> selectCareerList(ResumeVO resume) throws DataAccessException {
		return resumeDAO.selectCareerList(resume);
	}
	
	@Override
	public List<ResumeVO> selectEducationList(ResumeVO resume) throws DataAccessException {
		return resumeDAO.selectEducationList(resume);
	}
	
	@Override
	public void updatePage3Career(ResumeVO resume) throws DataAccessException {
		resumeDAO.updatePage3Career(resume);
	}
	
	
/*page3 END*/
	
/*page4*/
	@Override
	public void insertProject(ResumeVO resume) throws DataAccessException {
		 resumeDAO.insertProject(resume);
	}
	@Override
	public void deleteProject(int projectSEQ) throws DataAccessException {
		 resumeDAO.deleteProject(projectSEQ);
	}
	@Override
	public List<ResumeVO> selectProjectList(ResumeVO resume) throws DataAccessException {
		return resumeDAO.selectProjectList(resume);
	}
	@Override
	public void updatePage4Project(ResumeVO resume) throws DataAccessException {
		resumeDAO.updatePage4Project(resume);
	}

/*page4 END*/
/*page5*/
	@Override
	public void updatePage5Self(ResumeVO resume) throws DataAccessException {
		resumeDAO.updatePage5Self(resume);
	}
	
/*page5 END*/	
	@Override
	public String deleteResume(String resumeID) throws DataAccessException{
		String getResumeUser = resumeDAO.getResumeUser(resumeID);
		resumeDAO.deleteResume(resumeID);
		return getResumeUser;
	}
}
