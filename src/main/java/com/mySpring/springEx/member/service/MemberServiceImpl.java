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
   // https://m.blog.naver.com/monsterkn/221333152250 �꽕�씠踰� SMTP�꽕�젙�썑 �옄�떊�쓽 �븘�씠�뵒 鍮꾨�踰덊샇 湲곗엯

   // mailkey.properties hostSMTPpwd媛믪쓣 遺덈윭�샂
   @Value("${hostSMTPpwd}")
   public String hostSMTPPwd;

   // mailkey.properties portNum媛믪쓣 遺덈윭�샂
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

   // �뿬湲곕��꽣 �닔�젙�떆�옉
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
      if (memberDAO.check_id(member.getUserId()) == 1) {      // 以묐났�맂 �븘�씠�뵒
         out.println(
               "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
         out.println("<script language=JavaScript>");
         out.println("$(document).ready(function(){");
         out.println("swal('�븘�씠�뵒 以묐났','以묐났�씠 �븘�땶 �븘�씠�뵒瑜� �엯�젰�븯�꽭�슂!','error')");
         out.println(".then((result) => {");
         out.println("history.go(-1);");
         out.println("})");
         out.println("});");
         out.println("</script>");
         out.close();
         return 0;
      } else if (memberDAO.check_email(member.getUserEmail()) == 1) { // 以묐났�맂 �씠硫붿씪
         out.println(
               "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
         out.println("<script language=JavaScript>");
         out.println("$(document).ready(function(){");
         out.println("swal('�씠硫붿씪 以묐났',' 以묐났�씠 �븘�땶 �씠硫붿씪�쓣 �엯�젰�븯�꽭�슂!','error')");
         out.println(".then((result) => {");
         out.println("history.go(-1);");
         out.println("})");
         out.println("});");
         out.println("</script>");
         out.close();
         return 0;
      } else {

         // �씤利앺궎 set
         /* member.setApproval_key(create_key()); */
         memberDAO.join_member(member);
         // �씤利� 硫붿씪 諛쒖넚
         send_mail(member);
         out.println(
               "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
         
         out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@9'></script>");
         out.println("<script src='sweetalert2.min.js'></script>");
         
         out.println("<script language=JavaScript>");
         out.println("$(document).ready(function(){");
         
         out.println("Swal.fire({title:'�쉶�썝媛��엯�쓣 異뺥븯�뱶由쎈땲�떎!!',   text: '硫붿씪 �씤利앹쓣 �셿猷뚰븯�꽭�슂!', icon:'success', backdrop: 'rgba(0,0,123,0.4) url(\"/ktu/resources/image/nyan.gif\") left top no-repeat'})");
         //out.println("swal('硫붿씪�쓣 �씤利앹쓣 �셿猷뚰븯�꽭�슂','湲곗엯�븳 �씠硫붿씪濡� �쟾�넚�릺�뿀�뒿�땲�떎!','success')");
         
         out.println(".then((result) => {");
         out.println("location.href='http://localhost:"+portNum+"/ktu/main.do';");
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
      if (memberDAO.approval_member(member) == 0) { // �씠硫붿씪 �씤利앹뿉 �떎�뙣�븯���쓣 寃쎌슦
         out.println("<script>");
         out.println("alert('�옒紐삳맂 �젒洹쇱엯�땲�떎.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
      } else { // �씠硫붿씪 �씤利앹쓣 �꽦怨듯븯���쓣 寃쎌슦
         out.println(
               "<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
         out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
         out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
         out.println("<script language=JavaScript>");
         out.println("$(document).ready(function(){");
         out.println("swal('�씤利앹꽦怨�!!',' �씤利앹뿉 �꽦怨듯븯�뀲�뒿�땲�떎','success')");
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
      // Mail Server �꽕�젙
      String charSet = "utf-8";
      String hostSMTP = "smtp.naver.com";
      String hostSMTPid = hostSMTPId;
      String hostSMTPpwd = hostSMTPPwd;

      // 蹂대궡�뒗 �궗�엺 EMail, �젣紐�, �궡�슜
      String fromEmail = hostSMTPId;
      String fromName = "KTDS-Spring Homepage �씠硫붿씪 �씤利�";
      String subject = "�씤利�";
      String msg = "媛��엯�쓣 �솚�쁺�빀�땲�떎.";

      // �쉶�썝媛��엯 硫붿씪 �궡�슜
      subject = "KTDS Homepage �쉶�썝媛��엯 �씤利� 硫붿씪�엯�땲�떎.";
      msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
      msg += "<h3 style='color: blue;'>";
      msg += member.getUserId() + "�떂 �쉶�썝媛��엯�쓣 �솚�쁺�빀�땲�떎.</h3>";
      msg += "<div style='font-size: 130%'>";
      msg += "�븯�떒�쓽 �씤利� 踰꾪듉 �겢由� �떆 �젙�긽�쟻�쑝濡� �쉶�썝媛��엯�씠 �셿猷뚮맗�땲�떎.</div><br/>";
      msg += "<form method='post' action='http://localhost:" + portNum + "/ktu/member/approval_member.do'>"; // mailkey.properties
                                                                                       // �쓽
                                                                                       // portNum
      msg += "<input type='hidden' name='userEmail' value='" + member.getUserEmail() + "'>";
      msg += "<input type='submit' value='�씤利�'></form><br/></div>";
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
         System.out.println("硫붿씪諛쒖넚 �떎�뙣 : " + e);
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

   @Override
   public int handleWithdrawal(String userID) throws Exception {
      return memberDAO.handleWithdrawal(userID);
   }


}