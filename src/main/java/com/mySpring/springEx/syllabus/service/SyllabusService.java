package com.mySpring.springEx.syllabus.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.syllabus.vo.SyllabusVO;

public interface SyllabusService {
	public List syllabusList() throws DataAccessException;
	
	public SyllabusVO selectSyllabus(int syllabusID) throws DataAccessException;
	
	public int insertSyllabus(SyllabusVO syllabusVO) throws DataAccessException;
	
	public int deleteSyllabus(int syllabusID) throws DataAccessException;
	
	public int modifySyllabus(SyllabusVO syllabusVO) throws DataAccessException;
}
