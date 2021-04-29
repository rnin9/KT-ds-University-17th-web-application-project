package com.mySpring.springEx.manageUser.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface ManageUserDAO {
	public List selectUserList() throws DataAccessException;
}
