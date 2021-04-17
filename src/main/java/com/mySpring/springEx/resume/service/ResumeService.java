package com.mySpring.springEx.resume.service;

import java.util.List;
import org.springframework.dao.DataAccessException;

public interface ResumeService {
	public List listResumes() throws DataAccessException;

}