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
	
	  private static final String filePath ="C:\\Users\\mspak\\Downloads\\KTDS2 -\\file\\";


	  // 파일이 저장될 위치

	 //추가
	public List<Map<String, Object>> parseInsertFileInfo(NoticeVO noticeVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
	
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