package com.servlet.question;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.question.Question;
import com.exam.question.QuestionService;
import com.exam.util.StringUtil;

/**
 * 添加试题
 */
@WebServlet("/exam/question/addQuestion")
public class QuestionAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		QuestionService service = new QuestionService();
		String code = StringUtil.convert(request.getParameter("code"));
		String type = StringUtil.convert(request.getParameter("type"));
		String difficulty = StringUtil.convert(request.getParameter("difficulty"));
		String content = StringUtil.convert(request.getParameter("content"));
		String answer = StringUtil.convert(request.getParameter("answer"));
		String point = StringUtil.convert(request.getParameter("point"));
		if (service.ifCodeExist(code)) {
			request.setAttribute("errMsg", "该试题编号已存在，请重新填写");
			request.setAttribute("result", "failure");
		} else {
			service.saveQuestion(new Question(code, type, difficulty, content, answer, Integer.parseInt(point)));
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
