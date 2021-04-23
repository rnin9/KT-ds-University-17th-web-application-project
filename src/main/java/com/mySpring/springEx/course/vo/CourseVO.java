package com.mySpring.springEx.course.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

import com.mySpring.springEx.syllabus.vo.SyllabusVO;

@Component("courseVO")
public class CourseVO {
	private int courseID;
	private int syllabusID;
	private Date courseStart;
	private Date courseEnd;
	private Date courseApplyStart;
	private Date courseApplyEnd;
	private String courseTime;
	private String courseFee;
	private int courseRoomNumber;
	private int coursePeopleMax;
	private int coursePeopleApplied;
	private String courseState;
	private char courseShow;
	private SyllabusVO syllabusVO;
	private String dday;

	public String getDday() {
		return dday;
	}

	public void setDday(String dday) {
		this.dday = dday;
	}

	public CourseVO() {
	}

	public CourseVO(int courseID, int syllabusID, Date courseStart, Date courseEnd, Date courseApplyStart,
			Date courseApplyEnd, String courseTime, String courseFee, int courseRoomNumber, int coursePeopleMax,
			int coursePeopleApplied, String courseState, char courseShow, SyllabusVO syllabusVO) {
		this.courseID = courseID;
		this.syllabusID = syllabusID;
		this.courseStart = courseStart;
		this.courseEnd = courseEnd;
		this.courseApplyStart = courseApplyStart;
		this.courseApplyEnd = courseApplyEnd;
		this.courseTime = courseTime;
		this.courseFee = courseFee;
		this.courseRoomNumber = courseRoomNumber;
		this.coursePeopleMax = coursePeopleMax;
		this.coursePeopleApplied = coursePeopleApplied;
		this.courseState = courseState;
		this.courseShow = courseShow;
		this.syllabusVO = syllabusVO;
	}

	public SyllabusVO getSyllabusVO() {
		return syllabusVO;
	}

	public void setSyllabusVO(SyllabusVO syllabusVO) {
		this.syllabusVO = syllabusVO;
	}

	public int getCourseID() {
		return courseID;
	}

	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}

	public int getSyllabusID() {
		return syllabusID;
	}

	public void setSyllabusID(int syllabusID) {
		this.syllabusID = syllabusID;
	}

	public Date getCourseStart() {
		return courseStart;
	}

	public void setCourseStart(Date courseStart) {
		this.courseStart = courseStart;
	}

	public Date getCourseEnd() {
		return courseEnd;
	}

	public void setCourseEnd(Date courseEnd) {
		this.courseEnd = courseEnd;
	}

	public Date getCourseApplyStart() {
		return courseApplyStart;
	}

	public void setCourseApplyStart(Date courseApplyStart) {
		this.courseApplyStart = courseApplyStart;
	}

	public Date getCourseApplyEnd() {
		return courseApplyEnd;
	}

	public void setCourseApplyEnd(Date courseApplyEnd) {
		this.courseApplyEnd = courseApplyEnd;
	}

	public String getCourseTime() {
		return courseTime;
	}

	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}

	public String getCourseFee() {
		return courseFee;
	}

	public void setCourseFee(String courseFee) {
		this.courseFee = courseFee;
	}

	public int getCourseRoomNumber() {
		return courseRoomNumber;
	}

	public void setCourseRoomNumber(int courseRoomNumber) {
		this.courseRoomNumber = courseRoomNumber;
	}

	public int getCoursePeopleMax() {
		return coursePeopleMax;
	}

	public void setCoursePeopleMax(int coursePeopleMax) {
		this.coursePeopleMax = coursePeopleMax;
	}

	public int getCoursePeopleApplied() {
		return coursePeopleApplied;
	}

	public void setCoursePeopleApplied(int coursePeopleApplied) {
		this.coursePeopleApplied = coursePeopleApplied;
	}

	public String getCourseState() {
		return courseState;
	}

	public void setCourseState(String courseState) {
		this.courseState = courseState;
	}

	public char getCourseShow() {
		return courseShow;
	}

	public void setCourseShow(char courseShow) {
		this.courseShow = courseShow;
	}

}