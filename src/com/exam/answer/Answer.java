package com.exam.answer;

public class Answer {
	
	private String code;//答题编号
	private String stuCode;//学号
	private String quesCode;//题号
	private String answer;//学生作答
	private int mark;//得分
	private int flag;//标识是否已完成评分
	
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getStuCode() {
		return this.stuCode;
	}
	
	public void setSutCode(String stuCode) {
		this.stuCode = stuCode;
	}
	
	public String getQuesCode() {
		return this.quesCode;
	}
	
	public void setQuesCode(String quesCode) {
		this.quesCode = quesCode;
	}
	
	public String getAnswer() {
		return this.answer;
	}
	
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public int getMark() {
		return this.mark;
	}
	
	public void setMark(int mark) {
		this.mark = mark;
	}
	
	public int getFlag() {
		return this.flag;
	}
	
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
	public Answer(String code, String stuCode, String quesCode, String answer) {
		this.setCode(code);
		this.setSutCode(stuCode);
		this.setQuesCode(quesCode);
		this.setAnswer(answer);
	}
	
	public Answer(String code, String stuCode, String quesCode, String answer, int mark, int flag) {
		this.setCode(code);
		this.setSutCode(stuCode);
		this.setQuesCode(quesCode);
		this.setAnswer(answer);
		this.setMark(mark);
		this.setFlag(flag);
	}
}
