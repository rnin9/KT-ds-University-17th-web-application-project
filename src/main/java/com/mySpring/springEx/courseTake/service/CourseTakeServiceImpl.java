package com.mySpring.springEx.courseTake.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.courseTake.dao.CourseTakeDAO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;


@Service("courseTakeService")
@Transactional(propagation = Propagation.REQUIRED)
public class CourseTakeServiceImpl implements CourseTakeService {
	@Autowired
	private CourseTakeDAO courseTakeDAO;
	
	@Autowired
	public PageMapper pageMapper;


	 @Override
	    public List<Map<String, Object>> SelectAllCourseApplyList() throws Exception {
	        // TODO Auto-generated method stub
	        return pageMapper.SelectAllCourseApplyList();
	    }
    @Override
    public List<Map<String, Object>> selectAllCourseApplyList(Pagination pagination) throws Exception {
        // TODO Auto-generated method stub
    	return pageMapper.selectAllCourseApplyList(pagination);
		}
    

    @Override
    public int testTableCountCT() throws Exception {
        // TODO Auto-generated method stub
        return pageMapper.testTableCountCT();
    }
    
    //테스트페이지
	public List courseCompleteList() throws DataAccessException {
		List completeList = null;
		completeList = courseTakeDAO.selectAllCompleteList();
		return completeList;
	}

	

}