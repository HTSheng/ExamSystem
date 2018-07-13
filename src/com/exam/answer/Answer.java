package com.exam.answer;

public class Answer {
	
	private String code;//������
	private String stuCode;//ѧ��
	private String quesCode;//���
	private String answer;//ѧ������
	private int mark;//�÷�
	private int flag;//��ʶ�Ƿ����������
	
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
