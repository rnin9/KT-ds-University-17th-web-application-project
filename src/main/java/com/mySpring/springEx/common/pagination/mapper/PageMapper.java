package com.mySpring.springEx.common.pagination.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mySpring.springEx.common.pagination.Pagination;


public interface PageMapper {

	//�깮�꽦�옄
	public List<Map<String, Object>> SelectAllList() throws Exception;
	public List<Map<String, Object>> SelectAllList2() throws Exception;
	
	// Paging �쟾泥� �뜲�씠�꽣�뿉 ���븳 �럹�씠吏� 媛앹껜瑜� �꽔�뼱 �럹�씠吏� 泥섎━瑜� �븳 �썑 Map�삎�떇�쑝濡� 諛쏆븘�꽌 List�뿉 ���옣
		// 媛앹껜�솕瑜� �떆耳쒕몺�쑝濡� �씤�빐, �븵�쑝濡� �럹�씠吏� 泥섎━�뿉 愿��젴�맂 遺�遺꾩쓣 媛앹껜 �궫�엯留뚯쑝濡� 泥섎━媛� 媛��뒫�븯�룄濡� 援ъ꽦
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception;
	
	//�닔媛뺤떊泥��궡�뿭
	public List<Map<String, Object>> SelectAllCourseApplyList() throws Exception;
	public List<Map<String, Object>> selectAllCourseApplyList(Pagination pagination) throws Exception;
	public int testTableCountCT() throws Exception;
	
	// count �쟾泥� �뜲�씠�꽣 媛��닔瑜� �솗�씤�븯湲� �쐞�븳 遺�遺꾩쑝濡�, 媛��닔瑜� �솗�씤�븯湲� �븣臾몄뿉 int濡� 諛쏆쓬
	public int testTableCount() throws Exception;
	
	
	//怨듭��궗�빆 �럹�씠吏�
		public List<Map<String, Object>> NoticeAllList() throws Exception;
		public List<Map<String, Object>> NoticeAllList(Pagination pagination) throws Exception;
		public int testTableCountN() throws Exception;
	
	//�뙆�듃�꼫 �럹�씠吏�
	public List<Map<String, Object>> SelectAllListPartner() throws Exception;
	public List<Map<String, Object>> SelectAllListPartner(Pagination pagination) throws Exception;
	public int testTableCountPartner() throws Exception;

	

}
