package com.mySpring.springEx.courseTake.vo;

import java.sql.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.partner.vo.PartnerVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Component("courseTakeVO")
public class CourseTakeVO {
<<<<<<< HEAD
   private String userID;
   private int courseID;
   private String courseTake_State;
   private Date courseTake_ApplyDate;
   private Date courseTake_CompleteDate;

   private int takeY; // Course Completion
   private int takeN; // Course inCompletion
   private String takeYear; // Employee's courseTake Year
   private String surveyYN;
   /*
    * private String userName; private String userPhoneNumber; private String
    * userEmail; private String userCompany;
    */
   private String applyDate;

   public String getApplyDate() {
      return applyDate;
   }

   public void setApplyDate(String applyDate) {
      this.applyDate = applyDate;
   }

   // courseTake join table
   @Autowired
   private MemberVO memberVO;
   @Autowired
   private CourseVO courseVO;
   @Autowired
   private CourseTakeVO courseTakeVO;
   @Autowired
   private SyllabusVO syllabusVO;
   @Autowired
   private PartnerVO partnerVO;

   public PartnerVO getPartnerVO() {
      return partnerVO;
   }

   public void setPartnerVO(PartnerVO partnerVO) {
      this.partnerVO = partnerVO;
   }

   public int getTakeY() {
      return takeY;
   }

   public void setTakeY(int takeY) {
      this.takeY = takeY;
   }

   public int getTakeN() {
      return takeN;
   }

   public void setTakeN(int takeN) {
      this.takeN = takeN;
   }

   public String getTakeYear() {
      return takeYear;
   }

   public void setTakeYear(String takeYear) {
      this.takeYear = takeYear;
   }

   public String getSurveyYN() {
      return surveyYN;
   }

   public void setSurveyYN(String surveyYN) {
      this.surveyYN = surveyYN;
   }

   public CourseTakeVO getCourseTakeVO() {
      return courseTakeVO;
   }

   public void setCourseTakeVO(CourseTakeVO courseTakeVO) {
      this.courseTakeVO = courseTakeVO;
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

   public MemberVO getMemberVO() {
      return memberVO;
   }

   public void setMemberVO(MemberVO memberVO) {
      this.memberVO = memberVO;
   }

   public CourseTakeVO() {

   }

   public CourseTakeVO(String userID, int courseID, String courseTake_State, Date courseTake_ApplyDate,
         Date courseTake_CompleteDate, MemberVO memberVO) {

      this.userID = userID;
      this.courseID = courseID;
      this.courseTake_State = courseTake_State;
      this.courseTake_ApplyDate = courseTake_ApplyDate;
      this.courseTake_CompleteDate = courseTake_CompleteDate;
      this.memberVO = memberVO;
   }

   public String getUserID() {
      return userID;
   }

   public void setUserID(String userID) {
      this.userID = userID;
   }

   public int getCourseID() {
      return courseID;
   }

   public void setCourseID(int courseID) {
      this.courseID = courseID;
   }

   public String getCourseTake_State() {
      return courseTake_State;
   }

   public void setCourseTake_State(String courseTake_State) {
      this.courseTake_State = courseTake_State;
   }

   public Date getCourseTake_ApplyDate() {
      return courseTake_ApplyDate;
   }

   public void setCourseTake_ApplyDate(Date courseTake_ApplyDate) {
      this.courseTake_ApplyDate = courseTake_ApplyDate;
   }

   public Date getCourseTake_CompleteDate() {
      return courseTake_CompleteDate;
   }

   public void setCourseTake_CompleteDate(Date courseTake_CompleteDate) {
      this.courseTake_CompleteDate = courseTake_CompleteDate;
   }

   private String courseApplyEndYear;
   private String courseApplyEndMonth;
   private String courseApplyEndDay;

   public String getCourseApplyEndYear() {
      return courseApplyEndYear;
   }

   public void setCourseApplyEndYear(String courseApplyEndYear) {
      this.courseApplyEndYear = courseApplyEndYear;
   }

   public String getCourseApplyEndMonth() {
      return courseApplyEndMonth;
   }

   public void setCourseApplyEndMonth(String courseApplyEndMonth) {
      this.courseApplyEndMonth = courseApplyEndMonth;
   }

   public String getCourseApplyEndDay() {
      return courseApplyEndDay;
   }

   public void setCourseApplyEndDay(String courseApplyEndDay) {
      this.courseApplyEndDay = courseApplyEndDay;
   }
=======
	private String userID;
	private int courseID;
	private String courseTake_State;
	private Date courseTake_ApplyDate;
	private Date courseTake_CompleteDate;

	private int takeY; // Course Completion
	private int takeN; // Course inCompletion
	private String takeYear; // Employee's courseTake Year
	private String surveyYN;
	/*
	 * private String userName; private String userPhoneNumber; private String
	 * userEmail; private String userCompany;
	 */
	private String applyDate;

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	// courseTake join table
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private CourseVO courseVO;
	@Autowired
	private CourseTakeVO courseTakeVO;
	@Autowired
	private SyllabusVO syllabusVO;
	@Autowired
	private PartnerVO partnerVO;

	public PartnerVO getPartnerVO() {
		return partnerVO;
	}

	public void setPartnerVO(PartnerVO partnerVO) {
		this.partnerVO = partnerVO;
	}

	public int getTakeY() {
		return takeY;
	}

	public void setTakeY(int takeY) {
		this.takeY = takeY;
	}

	public int getTakeN() {
		return takeN;
	}

	public void setTakeN(int takeN) {
		this.takeN = takeN;
	}

	public String getTakeYear() {
		return takeYear;
	}

	public void setTakeYear(String takeYear) {
		this.takeYear = takeYear;
	}

	public String getSurveyYN() {
		return surveyYN;
	}

	public void setSurveyYN(String surveyYN) {
		this.surveyYN = surveyYN;
	}

	public CourseTakeVO getCourseTakeVO() {
		return courseTakeVO;
	}

	public void setCourseTakeVO(CourseTakeVO courseTakeVO) {
		this.courseTakeVO = courseTakeVO;
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

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public CourseTakeVO() {

	}

	public CourseTakeVO(String userID, int courseID, String courseTake_State, Date courseTake_ApplyDate,
			Date courseTake_CompleteDate, MemberVO memberVO) {

		this.userID = userID;
		this.courseID = courseID;
		this.courseTake_State = courseTake_State;
		this.courseTake_ApplyDate = courseTake_ApplyDate;
		this.courseTake_CompleteDate = courseTake_CompleteDate;
		this.memberVO = memberVO;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public String getCourseTake_State() {
		return courseTake_State;
	}

	public void setCourseTake_State(String courseTake_State) {
		this.courseTake_State = courseTake_State;
	}

	public Date getCourseTake_ApplyDate() {
		return courseTake_ApplyDate;
	}

	public void setCourseTake_ApplyDate(Date courseTake_ApplyDate) {
		this.courseTake_ApplyDate = courseTake_ApplyDate;
	}

	public Date getCourseTake_CompleteDate() {
		return courseTake_CompleteDate;
	}

	public void setCourseTake_CompleteDate(Date courseTake_CompleteDate) {
		this.courseTake_CompleteDate = courseTake_CompleteDate;
	}

	private String courseApplyEndYear;
	private String courseApplyEndMonth;
	private String courseApplyEndDay;

	public String getCourseApplyEndYear() {
		return courseApplyEndYear;
	}

	public void setCourseApplyEndYear(String courseApplyEndYear) {
		this.courseApplyEndYear = courseApplyEndYear;
	}

	public String getCourseApplyEndMonth() {
		return courseApplyEndMonth;
	}

	public void setCourseApplyEndMonth(String courseApplyEndMonth) {
		this.courseApplyEndMonth = courseApplyEndMonth;
	}

	public String getCourseApplyEndDay() {
		return courseApplyEndDay;
	}

	public void setCourseApplyEndDay(String courseApplyEndDay) {
		this.courseApplyEndDay = courseApplyEndDay;
	}
>>>>>>> 308d16593488441a3b4781120904fdc549039ae6
}