package com.kh.jsp.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.jsp.member.model.service.MemberService;
import com.kh.jsp.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8 ");*/
	
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		
		
		System.out.println("userId :" + userId);
		System.out.println("userPwd : " + userPwd);

		Member loginUser = new MemberService().loginCheck(userId, userPwd);
		
		System.out.println(loginUser);
		
		if(loginUser != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			response.sendRedirect("index.jsp");
		}else {
			request.setAttribute("msg", "로그인 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
