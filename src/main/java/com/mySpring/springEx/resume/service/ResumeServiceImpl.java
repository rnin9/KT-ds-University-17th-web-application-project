package com.mySpring.springEx.resume.service;

import java.util.List;

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
	public List listResumes() throws DataAccessException {
		List resumesList = null;
		resumesList = resumeDAO.selectAllResumeList();
		return resumesList;
	}
}
