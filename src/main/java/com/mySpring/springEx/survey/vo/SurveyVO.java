package com.mySpring.springEx.survey.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Component("surveyVO")
public class SurveyVO {
	private String survey_Id;
	private int courseID;
	private String survey_Title;
	private Date writeDate;
	private CourseVO courseVO;
	private CourseTakeVO courseTakeVO;
	private SyllabusVO syllabusVO;
	

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

	public SurveyVO() {
	}
	
	public SurveyVO(String survey_Id, int courseID, String survey_Title, Date writeDate) {
		this.survey_Id = survey_Id;
		this.courseID = courseID;
		this.survey_Title = survey_Title;
		this.writeDate = writeDate;
	}

	public String getSurvey_Id() {
		return survey_Id;
	}

	public void setSurvey_Id(String survey_Id) {
		this.survey_Id = survey_Id;
	}
	
	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public String getSurvey_Title() {
		return survey_Title;
	}

	public void setSurvey_Title(String survey_Title) {
		this.survey_Title = survey_Title;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

}
