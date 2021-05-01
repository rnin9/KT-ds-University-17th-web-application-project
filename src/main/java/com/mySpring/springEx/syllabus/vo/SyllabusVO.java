package com.mySpring.springEx.syllabus.vo;

import org.springframework.stereotype.Component;

import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;

@Component("syllabusVO")
public class SyllabusVO {
	private int syllabusID;
	private String syllabusCategory1;
	private String syllabusCategory2;
	private String syllabusName;
	private String syllabusReportName;
    private int syllabusTotalTime;
    private int syllabusTotalDays;
    private String syllabusOutline;
    private String syllabusPurpose;
    private String syllabusTarget;
    private String syllabusContent;
    private CourseVO courseVO;
    private CourseTakeVO courseTakeVO;



	public SyllabusVO() {
		
	}
	
	public SyllabusVO(int syllabusID, String syllabusCategory1, String syllabusCategory2, String syllabusName, String syllabusReportName, 
			                   int syllabusTotalTime, int syllabusTotalDays, String syllabusOutline, String syllabusPurpose, String syllabusTarget, 
			                   String syllabusContent,CourseVO courseVO,CourseTakeVO courseTakeVO) {
		      this.syllabusID = syllabusID;
		      this.syllabusCategory1 = syllabusCategory1;
		      this.syllabusCategory2 = syllabusCategory2;
		      this.syllabusName = syllabusName;
		      this.syllabusReportName = syllabusReportName;
		      this.syllabusTotalTime = syllabusTotalTime;
		      this.syllabusTotalDays = syllabusTotalDays;
		      this.syllabusOutline = syllabusOutline;
		      this.syllabusPurpose = syllabusPurpose;
		      this.syllabusTarget = syllabusTarget;
		      this.syllabusContent = syllabusContent;
		      this.courseVO = courseVO;
		      this.courseTakeVO = courseTakeVO;
		   }

	public int getSyllabusID() {
		return syllabusID;
	}

	public void setSyllabusID(int syllabusID) {
		this.syllabusID = syllabusID;
	}

	public String getSyllabusCategory1() {
		return syllabusCategory1;
	}

	public void setSyllabusCategory1(String syllabusCategory1) {
		this.syllabusCategory1 = syllabusCategory1;
	}

	public String getSyllabusCategory2() {
		return syllabusCategory2;
	}

	public void setSyllabusCategory2(String syllabusCategory2) {
		this.syllabusCategory2 = syllabusCategory2;
	}

	public String getSyllabusName() {
		return syllabusName;
	}

	public void setSyllabusName(String syllabusName) {
		this.syllabusName = syllabusName;
	}

	public String getSyllabusReportName() {
		return syllabusReportName;
	}

	public void setSyllabusReportName(String syllabusReportName) {
		this.syllabusReportName = syllabusReportName;
	}

	public int getSyllabusTotalTime() {
		return syllabusTotalTime;
	}

	public void setSyllabusTotalTime(int syllabusTotalTime) {
		this.syllabusTotalTime = syllabusTotalTime;
	}

	public int getSyllabusTotalDays() {
		return syllabusTotalDays;
	}

	public void setSyllabusTotalDays(int syllabusTotalDays) {
		this.syllabusTotalDays = syllabusTotalDays;
	}

	public String getSyllabusOutline() {
		return syllabusOutline;
	}

	public void setSyllabusOutline(String syllabusOutline) {
		this.syllabusOutline = syllabusOutline;
	}

	public String getSyllabusPurpose() {
		return syllabusPurpose;
	}

	public void setSyllabusPurpose(String syllabusPurpose) {
		this.syllabusPurpose = syllabusPurpose;
	}

	public String getSyllabusTarget() {
		return syllabusTarget;
	}

	public void setSyllabusTarget(String syllabusTarget) {
		this.syllabusTarget = syllabusTarget;
	}

	public String getSyllabusContent() {
		return syllabusContent;
	}

	public void setSyllabusContent(String syllabusContent) {
		this.syllabusContent = syllabusContent;
	}
	public CourseVO getCourseVO() {
		return courseVO;
	}

	public void setCourseVO(CourseVO courseVO) {
		this.courseVO = courseVO;
	}

	public CourseTakeVO getCourseTakeVO() {
		return courseTakeVO;
	}

	public void setCourseTakeVO(CourseTakeVO courseTakeVO) {
		this.courseTakeVO = courseTakeVO;
	}
	


}
