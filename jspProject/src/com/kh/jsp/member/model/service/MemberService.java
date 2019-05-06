package com.kh.jsp.member.model.service;

import static com.kh.jsp.common.JDBCTemplet.*;

import java.sql.Connection;

import com.kh.jsp.member.model.dao.MemberDao;
import com.kh.jsp.member.model.vo.Member;

public class MemberService {


	public Member loginCheck(String userId, String password) {
		Connection con = getConnection();
		Member loginUser = new MemberDao().loginCheck(con,userId,password);
		
		close(con);
		
		
		return loginUser;
	}

}
