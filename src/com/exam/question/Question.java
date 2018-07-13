package com.exam.question;

public class Question {
	
	private String code;//������
	private String type;//����
	private String content;//��������
	private String answer;//�ο���
	private String difficulty;//�Ѷ�
	private int point;//����
	
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getType() {
		return this.type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getAnswer() {
		return this.answer;
	}
	
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	public String getDifficulty() {
		return this.difficulty;
	}
	
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	
	public int getPoint() {
		return this.point;
	}
	
	public void setPoint(int point) {
		this.point = point;
	}
	
	public Question(String code, String type, String difficulty, String content, String answer, int point) {
		this.setCode(code);
		this.setType(type);
		this.setDifficulty(difficulty);
		this.setContent(content);
		this.setAnswer(answer);
		this.setPoint(point);
	}
}
