package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.user.User;
import com.exam.user.UserService;
import com.exam.util.EncryptUtil;

/**
 * ÓÃ»§µÇÂ¼
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		password = EncryptUtil.getResult(password);
		UserService service = new UserService();
		boolean ifValid = service.ifValid(userName, password);
		if (ifValid) {
			User user = service.getUserByUserName(userName);
			session.setAttribute("user", user);
			session.setAttribute("login", "success");
			response.sendRedirect("exam/home.jsp");
		} else {
			session.setAttribute("login", "failure");
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
