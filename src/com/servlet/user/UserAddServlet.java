package com.servlet.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.user.User;
import com.exam.user.UserService;
import com.exam.util.EncryptUtil;
import com.exam.util.StringUtil;

/**
 * 添加用户
 */
@WebServlet("/exam/user/addUser")
public class UserAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		UserService service = new UserService();
		String code = StringUtil.convert(request.getParameter("code"));
		String userName = StringUtil.convert(request.getParameter("userName"));
		String password = StringUtil.convert(request.getParameter("password"));
		password = EncryptUtil.getResult(password);
		String realName = StringUtil.convert(request.getParameter("realName"));
		String gender = StringUtil.convert(request.getParameter("gender"));
		String identity = StringUtil.convert(request.getParameter("identity"));
		if (service.ifCodeExist(code)) {
			request.setAttribute("errMsg", "该学号/工号已存在，请重新填写");
			request.setAttribute("result", "failure");
		} else {
			service.saveUser(new User(code, userName, password, realName, gender, identity));
			request.setAttribute("result", "success");
		}
		request.getRequestDispatcher("add.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
