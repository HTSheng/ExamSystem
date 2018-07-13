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
 * 修改试题信息
 */
@WebServlet("/exam/question/editQuestion")
public class QuestionEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionEditServlet() {
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
		Question question = service.getQuestion(code);
		question.setType(type);
		question.setDifficulty(difficulty);
		question.setContent(content);
		question.setAnswer(answer);
		question.setPoint(Integer.parseInt(point));
		service.editQuestion(question);
		request.setAttribute("result", "success");
		request.getRequestDispatcher("edit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
