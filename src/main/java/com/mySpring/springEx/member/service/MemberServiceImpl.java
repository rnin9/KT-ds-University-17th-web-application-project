package com.mySpring.springEx.member.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.member.dao.MemberDAO;
import com.mySpring.springEx.member.vo.MemberVO;
import com.mySpring.springEx.partner.vo.PartnerVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
@PropertySource("classpath:mailkey.properties")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;


	@Value("${hostSMTPid}")
	public String hostSMTPId;
	// https://m.blog.naver.com/monsterkn/221333152250 네이버 SMTP설정후 자신의 아이디 비밀번호 기입

	// mailkey.properties hostSMTPpwd값을 불러옴
	@Value("${hostSMTPpwd}")
	public String hostSMTPPwd;

	// mailkey.properties portNum값을 불러옴
	@Value("${portNum}")
	public int portNum;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}
	
	@Override
	public List listPartners() throws DataAccessException {
		List partnersName = null;
		partnersName = memberDAO.listPartners();
		return partnersName;
	}

	@Override
	public List listRecruitments() throws DataAccessException {
		List recruitmentList = null;
		recruitmentList = memberDAO.selectAllRecruitList();
		return recruitmentList;
	}

	@Override
	public List listApplications(String id) throws DataAccessException {
		List<HashMap<String, String>> applicationList = memberDAO.selectAllApplicationList(id);
		return applicationList;
	}

	@Override
	public List listSuggestions(String id) throws DataAccessException {
		List<HashMap<String, String>> suggestionList = memberDAO.selectAllSuggestionList(id);
		return suggestionList;
	}

	@Override
	public int userApplyPartner(String partnerApplyUserID, String partnerApplyPartnerID) throws Exception {
		return memberDAO.userApplyPartner(partnerApplyUserID, partnerApplyPartnerID);
	}

	@Override
	public int deleteApplication(String partnerApplyUserID, String partnerApplyPartnerID) throws Exception {
		return memberDAO.deleteApplication(partnerApplyUserID, partnerApplyPartnerID);
	}

	@Override
	public int deleteSuggestion(String partnerID, String userID) throws Exception {
		return memberDAO.deleteSuggestion(partnerID, userID);
	}

	@Override
	public int acceptSuggestion(String partnerID, String userID) throws Exception {
		return memberDAO.acceptSuggestion(partnerID, userID);
	}

	@Override
	public int rejectSuggestion(String partnerID, String userID) throws Exception {
		return memberDAO.rejectSuggestion(partnerID, userID);
	}


	/*
	 * @Override public int addMember(MemberVO member) throws DataAccessException {
	 * return memberDAO.insertMember(member); }
	 */


	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.loginById(memberVO);
	}

	// 여기부터 수정시작
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_id(id));
		out.close();
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_email(email));
		System.out.println(out);
		out.close();
	}

	@Override
	public int join_member(MemberVO member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("2");
		if (memberDAO.check_id(member.getUserId()) == 1) {		// 중복된 아이디
			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			out.println("<script language=JavaScript>");
			out.println("$(document).ready(function(){");
			out.println("swal('아이디 중복','중복이 아닌 아이디를 입력하세요!','error')");
			out.println(".then((result) => {");
			out.println("history.go(-1);");
			out.println("})");
			out.println("});");
			out.println("</script>");
			out.close();
			return 0;
		} else if (memberDAO.check_email(member.getUserEmail()) == 1) { // 중복된 이메일
			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			out.println("<script language=JavaScript>");
			out.println("$(document).ready(function(){");
			out.println("swal('이메일 중복',' 중복이 아닌 이메일을 입력하세요!','error')");
			out.println(".then((result) => {");
			out.println("history.go(-1);");
			out.println("})");
			out.println("});");
			out.println("</script>");
			out.close();
			return 0;
		} else {

			// 인증키 set
			/* member.setApproval_key(create_key()); */
			memberDAO.join_member(member);
			// 인증 메일 발송
			send_mail(member);
			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			
			out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
			out.println("<script src='sweetalert2.min.js'></script>");
			
			out.println("<script language=JavaScript>");
			out.println("$(document).ready(function(){");
			
			out.println("Swal.fire({title:'회원가입을 축하드립니다!!',	text: '메일을 인증을 완료하세요!', icon:'success', backdrop: 'rgba(0,0,123,0.4) url(\"/springEx/resources/image/nyan.gif\") left top no-repeat'})");
			//out.println("swal('메일을 인증을 완료하세요','기입한 이메일로 전송되었습니다!','success')");
			
			out.println(".then((result) => {");
			out.println("location.href='http://localhost:" + portNum + "/springEx/main.do';");
			out.println("})");
			out.println("});");
			out.println("</script>");
			out.close();
			return 1;

		}
	}

	@Override
	public void approval_member(MemberVO member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (memberDAO.approval_member(member) == 0) { // 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println(
					"<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
			out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
			out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
			out.println("<script language=JavaScript>");
			out.println("$(document).ready(function(){");
			out.println("swal('인증성공!!',' 인증에 성공하셨습니다','success')");
			out.println(".then((result) => {");
			out.println("history.go(-2);");
			out.println("})");
			out.println("});");
			
			out.println("</script>");
			out.close();
		}
	}

	

	@Override
	public void send_mail(MemberVO member) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = hostSMTPId;
		String hostSMTPpwd = hostSMTPPwd;

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = hostSMTPId;
		String fromName = "KTDS-Spring Homepage 이메일 인증";
		String subject = "인증";
		String msg = "가입을 환영합니다.";

		// 회원가입 메일 내용
		subject = "KTDS Homepage 회원가입 인증 메일입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getUserId() + "님 회원가입을 환영합니다.</h3>";
		msg += "<div style='font-size: 130%'>";
		msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
		msg += "<form method='post' action='http://localhost:" + portNum + "/springEx/member/approval_member.do'>"; // mailkey.properties
																													// 의
																													// portNum
		msg += "<input type='hidden' name='userEmail' value='" + member.getUserEmail() + "'>";
		msg += "<input type='submit' value='인증'></form><br/></div>";
		System.out.println(msg);

	
		String mail = member.getUserEmail();
		System.out.println(mail);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public MemberVO getMyInfo(String userID) throws Exception {
		// TODO Auto-generated method stub
		
		return memberDAO.getMyInformation(userID);
	}
	
	@Override
	public int modMyInfo(MemberVO member) throws Exception{
		memberDAO.modMyInfo(member);
		return 0;
	}
	
	@Override
	public List listMyCourse(String userID) throws DataAccessException {
		List myCourseList = null;
		myCourseList = memberDAO.selectAllMyCourseList(userID);
		return myCourseList;
	}

	@Override
	public PartnerVO partnerLogin(MemberVO memberVO) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.partnerLogInById(memberVO);
	}




	
	

}
