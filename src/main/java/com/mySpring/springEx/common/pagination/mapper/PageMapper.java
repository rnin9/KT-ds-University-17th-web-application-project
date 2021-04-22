package com.mySpring.springEx.common.pagination.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mySpring.springEx.common.pagination.Pagination;

public interface PageMapper {

	// ���깆��
	public List<Map<String, Object>> SelectAllList() throws Exception;

	public List<Map<String, Object>> SelectAllList2() throws Exception;

	// Paging ��泥� �곗�댄�곗�� ���� ���댁� 媛�泥대�� �ｌ�� ���댁� 泥�由щ�� �� �� Map�����쇰�
	// 諛����� List�� ����
	// 媛�泥댄��瑜� ��耳����쇰� �명��, ���쇰� ���댁� 泥�由ъ�� 愿��⑤�� 遺�遺��� 媛�泥� �쎌��留��쇰�
	// 泥�由ш� 媛��ν����濡� 援ъ��
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;

	// count ��泥� �곗�댄�� 媛���瑜� ���명��湲� ���� 遺�遺��쇰�, 媛���瑜� ���명��湲� ��臾몄�� int濡�
	// 諛���
	public int testTableCount() throws Exception;

	// 怨듭��ы�� ���댁�
	public List<Map<String, Object>> NoticeAllList() throws Exception;
	public List<Map<String, Object>> NoticeAllList(Pagination pagination) throws Exception;
	public int testTableCountN() throws Exception;

	// partner
	public List<Map<String, Object>> SelectAllListPartner() throws Exception;
	public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;
	public int testTableCountPartner() throws Exception;

	/* 기업관련 시작 */
	public List<Map<String, Object>> SelectAllListCompanyEmployee(@Param("firstRecordIndex") int firstRecordIndex,
			@Param("lastRecordIndex") int lastRecordIndex, @Param("partnerLicenseNum") String partnerLicenseNum);

	public int companyEmployeeTableCount(String partnerLicenseNum);

	public int searchEmployeeTableCount(@Param("partnerLicenseNum") String partnerLicenseNum,
			@Param("userName") String userName, @Param("syllabusName") String syllabusName,
			@Param("courseStartDate") String courseStartDate, @Param("completionDate") String completionDate);

	public List<Map<String, Object>> SearchListCompanyEmployee(@Param("firstRecordIndex") int firstRecordIndex,
			@Param("lastRecordIndex") int lastRecordIndex, @Param("partnerLicenseNum") String partnerLicenseNum,
			@Param("userName") String userName, @Param("syllabusName") String syllabusName,
			@Param("courseStartDate") String courseStartDate, @Param("completionDate") String completionDate);
	/* 기업관련 끝 */

}
