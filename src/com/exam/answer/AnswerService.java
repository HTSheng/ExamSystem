package com.exam.answer;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.exam.util.DBUtil;

public class AnswerService {

	/**
	 * ���ݱ�Ż�ȡѧ��������Ϣ
	 * @param code ������
	 * @return ����ʵ��
	 * @throws SQLException 
	 */
	public Answer getAnswer(String code) {
		try{
			Answer entity = null;
			String sql = "select * from answer where code = '" + code + "'";
			ResultSet rs = DBUtil.query(sql);
			if (rs.next()) {
				String stuCode = rs.getString("stuCode");
				String quesCode = rs.getString("quesCode");
				String answer = rs.getString("answer");
				int mark = rs.getInt("mark");
				int flag = rs.getInt("flag");
				entity = new Answer(code, stuCode, quesCode, answer, mark, flag);
			}
			DBUtil.close();
			return entity;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return null;
		}
	}
	
	/**
	 * ���ѧ��������Ϣ
	 * @param entity ����ʵ��
	 * @throws SQLException 
	 */
	public void saveAnswer(Answer entity) {
		String sql = "insert into answer(code, stuCode, quesCode, answer) values('" + entity.getCode() + "','" + entity.getStuCode() 
			+ "','" + entity.getQuesCode() + "','" + entity.getAnswer() + "')";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * �޸�ѧ��������Ϣ
	 * @param code ������
	 * @param answer ������Ϣ
	 * @throws SQLException 
	 */
	public void editAnswer(String code, String answer) {
		String sql = "update answer set answer = '" + answer + "' where code = '" + code + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * ����
	 * @param code ������
	 * @param mark �÷�
	 * @throws SQLException 
	 */
	public void editMark(String code, int mark) {
		String sql = "update answer set mark = " + mark + ", flag = 1 where code = '" + code + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * �ж��Ƿ��Ѵ��ڸñ��
	 * @param code ������
	 * @return true�Ѵ���,false������
	 * @throws SQLException
	 */
	public boolean ifCodeExist(String code) {
		try{
			boolean exist = false;
			String sql = "select * from answer";
			ResultSet rs = DBUtil.query(sql);
			while (rs.next()) {
				if (code.equalsIgnoreCase(rs.getString("code"))) {
					exist = true;
				}
			}
			DBUtil.close();
			return exist;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return false;
		}
	}
	
}
