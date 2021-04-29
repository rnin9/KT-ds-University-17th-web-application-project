package com.mySpring.springEx.common.util;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.mySpring.springEx.notice.vo.NoticeVO;

@Repository("fileUtils")
public class FileUtils {
	
	  private static final String filePath ="C:\\Users\\user\\Desktop\\KT-ds-University-17th-web-application-project\\file";
	  // 파일이 저장될 위치

	 
	public List<Map<String, Object>> parseInsertFileInfo(NoticeVO noticeVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
//		final String filePath = mpRequest.getSession().getServletContext().getRealPath("webapp\\resources\\attachmentFile\\");
//		System.out.println(filePath);
		/*
			Iterator�� �뜲�씠�꽣�뱾�쓽 吏묓빀泥�? �뿉�꽌 而щ젆�뀡�쑝濡쒕��꽣 �젙蹂대�� �뼸�뼱�삱 �닔 �엳�뒗 �씤�꽣�럹�씠�뒪�엯�땲�떎.
			List�굹 諛곗뿴�� �닚李⑥쟻�쑝濡� �뜲�씠�꽣�쓽 �젒洹쇱씠 媛��뒫�븯吏�留�, Map�벑�쓽 �겢�옒�뒪�뱾�� �닚李⑥쟻�쑝濡� �젒洹쇳븷 �닔媛� �뾾�뒿�땲�떎.
			Iterator�쓣 �씠�슜�븯�뿬 Map�뿉 �엳�뒗 �뜲�씠�꽣�뱾�쓣 while臾몄쓣 �씠�슜�븯�뿬 �닚李⑥쟻�쑝濡� �젒洹쇳빀�땲�떎.
		*/
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String org_nt_file_name = null;
		String originalFileExtension = null;
		String str_nt_file_name = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int notice_no = noticeVO.getNotice_no();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				org_nt_file_name = multipartFile.getOriginalFilename();
				originalFileExtension = org_nt_file_name.substring(org_nt_file_name.lastIndexOf("."));
				str_nt_file_name = getRandomString() + originalFileExtension;
				
				file = new File(filePath + str_nt_file_name);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("NOTICE_NO", notice_no);
				listMap.put("ORG_NT_FILE_NAME", org_nt_file_name);
				listMap.put("STR_NT_FILE_NAME", str_nt_file_name);
				listMap.put("NT_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(NoticeVO noticeVO, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception{ 
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null; 
		String org_nt_file_name = null; 
		String originalFileExtension = null; 
		String str_nt_file_name = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		int notice_no = noticeVO.getNotice_no();
		while(iterator.hasNext()){ 
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){ 
				org_nt_file_name = multipartFile.getOriginalFilename(); 
				originalFileExtension = org_nt_file_name.substring(org_nt_file_name.lastIndexOf(".")); 
				str_nt_file_name = getRandomString() + originalFileExtension; 
				multipartFile.transferTo(new File(filePath + str_nt_file_name)); 
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("NOTICE_NO", notice_no); 
				listMap.put("ORG_NT_FILE_NAME", org_nt_file_name);
				listMap.put("STR_NT_FILE_NAME", str_nt_file_name); 
				listMap.put("NT_FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			} 
		}
		if(files != null && fileNames != null){ 
			for(int i = 0; i<fileNames.length; i++) {
					listMap = new HashMap<String,Object>();
                    listMap.put("IS_NEW", "N");
					listMap.put("NT_FILE_NO", files[i]); 
					list.add(listMap); 
			}
		}
		return list; 
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}