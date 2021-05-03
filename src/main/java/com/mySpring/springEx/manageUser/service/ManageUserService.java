package com.mySpring.springEx.manageUser.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface ManageUserService {
	public List userList() throws DataAccessException;

	public int resetPW(String userID) throws Exception;

	public int positionModify(String newPosition, String userID) throws Exception;

	public List userWithdrawalListrList() throws DataAccessException;

	public int deleteUser(String userID) throws Exception;
}

