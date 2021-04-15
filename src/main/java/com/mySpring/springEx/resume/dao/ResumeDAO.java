package com.mySpring.springEx.resume.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

public interface ResumeDAO {
	public List selectAllResumeList() throws DataAccessException; 

}
