package com.mySpring.springEx.member.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import com.mySpring.springEx.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;

	/* public int addMember(MemberVO memberVO) throws DataAccessException; */
	public int removeMember(String id) throws DataAccessException;

	public MemberVO login(MemberVO memberVO) throws Exception;

	
<<<<<<< HEAD
	//ï¿½ï¿½ï¿½ï¿½ ï¿½ß°ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½
=======
	//»õ·Î Ãß°¡µÈ ³ðµé
>>>>>>> 7c75f9b1e0875ff857485511dbf60cba487be911
	public void check_id(String id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberVO member, HttpServletResponse response) throws Exception;

	public void approval_member(MemberVO member, HttpServletResponse response) throws Exception;

	public String create_key() throws Exception;

	public void send_mail(MemberVO member) throws Exception;

<<<<<<< HEAD
}
=======
}
>>>>>>> 7c75f9b1e0875ff857485511dbf60cba487be911
