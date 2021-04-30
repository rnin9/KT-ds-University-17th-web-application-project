package com.mySpring.springEx.syllabus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.syllabus.dao.SyllabusDAO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

import org.springframework.transaction.annotation.Propagation;

@Service("syllabusService")
@Transactional(propagation = Propagation.REQUIRED)
public class SyllabusServiceImpl implements SyllabusService{
	@Autowired
	private SyllabusDAO syllabusDAO;
	
	@Override
	public List syllabusList() throws DataAccessException{
		List syllabusList = null;
		syllabusList = syllabusDAO.selectSyllabusList();
		return syllabusList;
	}
	@Override
	public SyllabusVO selectSyllabus(int syllabusID) throws DataAccessException {
		return syllabusDAO.selectSyllabus(syllabusID);
	}
	
	@Override
	public int insertSyllabus(SyllabusVO syllabusVO) throws DataAccessException {
		return syllabusDAO.insertSyllabus(syllabusVO);
	}
	
	@Override
	public int deleteSyllabus(int syllabusID) throws DataAccessException{
		return syllabusDAO.deleteSyllabus(syllabusID);
	}
	
	@Override
	public int modifySyllabus(SyllabusVO syllabusVO) throws DataAccessException{
		return syllabusDAO.modifySyllabus(syllabusVO);
	}

	
}
