package com.exam.answer;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.exam.util.DBUtil;

public class AnswerService {

	/**
	 * 根据编号获取学生答题信息
	 * @param code 答题编号
	 * @return 答题实体
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
	 * 添加学生答题信息
	 * @param entity 答题实体
	 * @throws SQLException 
	 */
	public void saveAnswer(Answer entity) {
		String sql = "insert into answer(code, stuCode, quesCode, answer) values('" + entity.getCode() + "','" + entity.getStuCode() 
			+ "','" + entity.getQuesCode() + "','" + entity.getAnswer() + "')";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 修改学生答题信息
	 * @param code 答题编号
	 * @param answer 作答信息
	 * @throws SQLException 
	 */
	public void editAnswer(String code, String answer) {
		String sql = "update answer set answer = '" + answer + "' where code = '" + code + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 评分
	 * @param code 答题编号
	 * @param mark 得分
	 * @throws SQLException 
	 */
	public void editMark(String code, int mark) {
		String sql = "update answer set mark = " + mark + ", flag = 1 where code = '" + code + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 判断是否已存在该编号
	 * @param code 答题编号
	 * @return true已存在,false不存在
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
