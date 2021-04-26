package com.mySpring.springEx.common.pagination.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mySpring.springEx.common.pagination.Pagination;

public interface PageMapper {

	public List<Map<String, Object>> SelectAllList() throws Exception;

	public List<Map<String, Object>> SelectAllList2() throws Exception;

  public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;
	
	public List<Map<String, Object>> SelectAllCourseApplyList() throws Exception;
	public List<Map<String, Object>> selectAllCourseApplyList(Pagination pagination) throws Exception;
	public int testTableCountCT() throws Exception;
	
	public int testTableCount() throws Exception;
	
	
		public List<Map<String, Object>> NoticeAllList() throws Exception;
		public List<Map<String, Object>> NoticeAllList(Pagination pagination) throws Exception;
		public int testTableCountN() throws Exception;
	
	
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;

	public int testTableCount() throws Exception;

	public List<Map<String, Object>> NoticeAllList() throws Exception;
	public List<Map<String, Object>> NoticeAllList(Pagination pagination) throws Exception;
	public int testTableCountN() throws Exception;


	public List<Map<String, Object>> SelectAllListPartner() throws Exception;
	public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;
	public int testTableCountPartner() throws Exception;
}
