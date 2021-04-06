package com.mySpring.springEx.member.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.member.dao.MemberDAO;
import com.mySpring.springEx.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
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

	// ajax 아이디체크를 위한 메소드
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_id(id));
		out.close();
	}
	
	// ajax 아이디체크를 위한 메소드
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
		if (memberDAO.check_id(member.getUserId()) == 1) { //AJAX로 비동기로 구현해서 필요없는데 그냥 냅둠
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else if (memberDAO.check_email(member.getUserEmail()) == 1) { //이것도
			out.println("<script>");
			out.println("alert('동일한 이메일이 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {

			//문제없을시 join_member실행과 동시에 send_mail 메소드 호출
			memberDAO.join_member(member);
			// 인증 메일 발송
			send_mail(member);
			out.println("<script>");
			out.println("alert('메일 인증을 완료하세요.');");
			/* out.println("location.href='https://naver.com/';"); */
			out.println("history.go(-3);"); 
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
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
	}

	/*
	 * @Override public String create_key() throws Exception { // TODO
	 * Auto-generated method stub String key = ""; Random rd = new Random();
	 * 
	 * for (int i = 0; i < 8; i++) { key += rd.nextInt(10); } return key; }
	 */

	@Override
	public void send_mail(MemberVO member) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "네이버id"; //https://m.blog.naver.com/monsterkn/221333152250 네이버 SMTP설정후 자신의 아이디 비밀번호 기입
		String hostSMTPpwd = "네이버비밀번호";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "mspak96@naver.com";
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
		msg += "<form method='post' action='http://localhost:8082/springEx/member/approval_member.do'>"; //자신의 서버포트번호로 변경
		msg += "<input type='hidden' name='userEmail' value='" + member.getUserEmail() + "'>";
		/*
		 * msg += "<input type='hidden' name='approval_key' value='" +
		 * member.getApproval_key() + "'>";
		 */
		msg += "<input type='submit' value='인증'></form><br/></div>";

		// 받는 사람 E-Mail 주소
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
	public String create_key() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
