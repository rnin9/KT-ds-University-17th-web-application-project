package com.mySpring.springEx.manageUser.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface ManageUserService {
	public List userList() throws DataAccessException;
}
