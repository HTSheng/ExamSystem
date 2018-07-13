package com.servlet.answer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.answer.Answer;
import com.exam.answer.AnswerService;
import com.exam.util.StringUtil;

/**
 * Ñ§Éú×÷´ð
 */
@WebServlet("/exam/answer/answer")
public class AnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		AnswerService service = new AnswerService();
		String code = StringUtil.convert(request.getParameter("code"));
		String stuCode = StringUtil.convert(request.getParameter("stuCode"));
		String quesCode = StringUtil.convert(request.getParameter("quesCode"));
		String answer = StringUtil.convert(request.getParameter("answer"));
		if (service.ifCodeExist(code))
			service.editAnswer(code, answer);
		else
			service.saveAnswer(new Answer(code, stuCode, quesCode, answer));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
