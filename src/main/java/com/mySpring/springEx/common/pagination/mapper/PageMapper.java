package com.mySpring.springEx.common.pagination.mapper;

import java.util.List;
import java.util.Map;

import com.mySpring.springEx.common.pagination.Pagination;


public interface PageMapper {

	//생성자
	public List<Map<String, Object>> SelectAllList() throws Exception;

	// Paging 전체 데이터에 대한 페이징 객체를 넣어 페이징 처리를 한 후 Map형식으로 받아서 List에 저장
	// 객체화를 시켜둠으로 인해, 앞으로 페이징 처리에 관련된 부분을 객체 삽입만으로 처리가 가능하도록 구성
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;

	// count 전체 데이터 갯수를 확인하기 위한 부분으로, 갯수를 확인하기 때문에 int로 받음
	public int testTableCount() throws Exception;
	
	//공지사항 페이징
	public List<Map<String, Object>> NoticeAllList() throws Exception;

	// Paging 전체 데이터에 대한 페이징 객체를 넣어 페이징 처리를 한 후 Map형식으로 받아서 List에 저장
	// 객체화를 시켜둠으로 인해, 앞으로 페이징 처리에 관련된 부분을 객체 삽입만으로 처리가 가능하도록 구성
	public List<Map<String, Object>> NoticeAllList(Pagination pagination) throws Exception;

	// count 전체 데이터 갯수를 확인하기 위한 부분으로, 갯수를 확인하기 때문에 int로 받음
	public int testTableCountN() throws Exception;

}