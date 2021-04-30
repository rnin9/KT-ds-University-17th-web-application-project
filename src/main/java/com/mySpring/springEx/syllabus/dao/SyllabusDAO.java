package com.mySpring.springEx.syllabus.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.syllabus.vo.SyllabusVO;

public interface SyllabusDAO {
	public List selectSyllabusList() throws DataAccessException;
	
	public SyllabusVO selectSyllabus(int syllabusID) throws DataAccessException;
	
	public int insertSyllabus(SyllabusVO syllabusVO) throws DataAccessException;
	
	public int deleteSyllabus(int syllabusID) throws DataAccessException;
	
	public int modifySyllabus(SyllabusVO syllabusVO) throws DataAccessException;

}
