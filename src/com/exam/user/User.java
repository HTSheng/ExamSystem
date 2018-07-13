package com.exam.user;

public class User {

	private String code;//�û����
	private String userName;//�û���
	private String password;//����
	private String realName;//����
	private String gender;//�Ա�
	private String identity;//���
	
	public String getCode() {
		return this.code;
	}
	
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getUserName() {
		return this.userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRealName() {
		return this.realName;
	}
	
	public void setRealName(String realName) {
		this.realName = realName;
	}
	
	public String getGender() {
		return this.gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getIdentity() {
		return this.identity;
	}
	
	public void setIdentity(String identity) {
		this.identity = identity;
	}
	
	public User(String code, String userName, String password, String realName, String gender, String identity) {
		this.setCode(code);
		this.setUserName(userName);
		this.setPassword(password);
		this.setRealName(realName);
		this.setGender(gender);
		this.setIdentity(identity);
	}
}
