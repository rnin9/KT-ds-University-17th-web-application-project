package com.mySpring.springEx.common.pagination.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mySpring.springEx.common.pagination.Pagination;


public interface PageMapper {

	//생성자
	public List<Map<String, Object>> SelectAllList() throws Exception;

	// Paging 전체 데이터에 대한 페이징 객체를 넣어 페이징 처리를 한 후 Map형식으로 받아서 List에 저장
	// 객체화를 시켜둠으로 인해, 앞으로 페이징 처리에 관련된 부분을 객체 삽입만으로 처리가 가능하도록 구성
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;
	
	//수강신청내역
	public List<Map<String, Object>> SelectAllCourseApplyList() throws Exception;
	public List<Map<String, Object>> selectAllCourseApplyList(Pagination pagination) throws Exception;
	public int testTableCountCT() throws Exception;
	
	// count 전체 데이터 갯수를 확인하기 위한 부분으로, 갯수를 확인하기 때문에 int로 받음
	public int testTableCount() throws Exception;
	
	/*----------------------------------------------------------*/
	/*-------------------파트너-----------------------------------*/
	/*----------------------------------------------------------*/
	
	public List<Map<String, Object>> SelectAllListPartner() throws Exception;

	public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;
	
	public int testTableCountPartner() throws Exception;

	/*기업관련 시작*/
	public List<Map<String, Object>> SelectAllListCompanyEmployee(@Param("firstRecordIndex") int firstRecordIndex,@Param("lastRecordIndex") int lastRecordIndex, @Param("partnerLicenseNum")String partnerLicenseNum);

	public int companyEmployeeTableCount(String partnerLicenseNum);
	public int searchEmployeeTableCount(@Param("partnerLicenseNum") String partnerLicenseNum, @Param("userName") String userName,
			@Param("syllabusName")String syllabusName, @Param("courseStartDate")String courseStartDate, @Param("completionDate")String completionDate);
	
	public List<Map<String, Object>> SearchListCompanyEmployee(@Param("firstRecordIndex") int firstRecordIndex,@Param("lastRecordIndex") int lastRecordIndex, @Param("partnerLicenseNum")String partnerLicenseNum,
			@Param("userName") String userName, @Param("syllabusName")String syllabusName, @Param("courseStartDate")String courseStartDate, @Param("completionDate")String completionDate);
	/*기업관련 끝*/
	

}
