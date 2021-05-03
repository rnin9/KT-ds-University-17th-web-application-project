package com.mySpring.springEx.member.vo;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.resume.vo.ResumeVO;
import com.mySpring.springEx.suggestion.vo.SuggestionVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;


@Component("memberVO")
//멤버 VO birth,phone,adderess,joinDate,approval_status, approval_key(삭제 예정) 추가
public class MemberVO {
	private String userId;
	private String userPassword;
	private String userName;
	private String userEmail;
	private String birth;
	private String userGender;
	private String userMajor;
	private String userPosition;
	private String userJob; 
	private String userCompany;
	private String userPhoneNumber;
	private String userAddress1;
	private String userAddress2;
	private Date userJoindate;
	private String approval_status;
	private String resume;
	private String toCharBirth;
	private String toCharBirthKOR;

	@Autowired
	private CourseVO courseVO;
	@Autowired
	private SyllabusVO syllabusVO;
	@Autowired
	private CourseTakeVO courseTakeVO;
	@Autowired
	private ResumeVO resumeVO;
	@Autowired
	private SuggestionVO suggestionVO;
	

	public MemberVO() {
	}
	
	public MemberVO(String userId, String userPassword, String userName, String userEmail) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userEmail = userEmail;
	}
	
	public String getToCharBirthKOR() {
		return toCharBirthKOR;
	}

	public void setToCharBirthKOR(String toCharBirthKOR) {
		this.toCharBirthKOR = toCharBirthKOR;
	}

	public String getToCharBirth() {
		return toCharBirth;
	}

	public void setToCharBirth(String toCharBirth) {
		this.toCharBirth = toCharBirth;
	}

	public SuggestionVO getSuggestionVO() {
		return suggestionVO;
	}

	public void setSuggestionVO(SuggestionVO suggestionVO) {
		this.suggestionVO = suggestionVO;
	}
	
	public ResumeVO getResumeVO() {
		return resumeVO;
	}

	public void setResumeVO(ResumeVO resumeVO) {
		this.resumeVO = resumeVO;
	}

	public CourseVO getCourseVO() {
		return courseVO;
	}

	public void setCourseVO(CourseVO courseVO) {
		this.courseVO = courseVO;
	}

	public SyllabusVO getSyllabusVO() {
		return syllabusVO;
	}

	public void setSyllabusVO(SyllabusVO syllabusVO) {
		this.syllabusVO = syllabusVO;
	}

	public CourseTakeVO getCourseTakeVO() {
		return courseTakeVO;
	}

	public void setCourseTakeVO(CourseTakeVO courseTakeVO) {
		this.courseTakeVO = courseTakeVO;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserMajor() {
		return userMajor;
	}

	public void setUserMajor(String userMajor) {
		this.userMajor = userMajor;
	}

	public String getUserPosition() {
		return userPosition;
	}

	public void setUserPosition(String userPosition) {
		this.userPosition = userPosition;
	}

	public String getUserCompany() {
		return userCompany;
	}

	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}

	public String getUserPhoneNumber() {
		return userPhoneNumber;
	}

	public void setUserPhoneNumber(String userPhoneNumber) {
		this.userPhoneNumber = userPhoneNumber;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public Date getUserJoindate() {
		return userJoindate;
	}

	public void setUserJoindate(Date userJoindate) {
		this.userJoindate = userJoindate;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public String getResume() {
		System.out.println("getresume " + resume);
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getUserJob() {
		return userJob;
	}

	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}

	

}
