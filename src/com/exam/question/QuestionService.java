package com.exam.question;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.exam.util.DBUtil;

public class QuestionService {
	
	/**
	 * 获取试题列表
	 * @return 试题列表
	 * @throws SQLException 
	 */
	public List<Question> getQuestionList() {
		try{
			List<Question> resultList = new LinkedList<Question>();
			String sql = "select * from question";
			ResultSet rs = DBUtil.query(sql);
			while (rs.next()) {
				String code = rs.getString("code");
				String type = rs.getString("type");
				String difficulty = rs.getString("difficulty");
				String content = rs.getString("content");
				String answer = rs.getString("answer");
				int point = rs.getInt("point");
				Question entity = new Question(code, type, difficulty, content, answer, point);
				resultList.add(entity);
			}
			DBUtil.close();
			return resultList;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return null;
		}
	}
	
	/**
	 * 根据编号获取试题信息
	 * @param code 试题编号
	 * @return 试题实体
	 * @throws SQLException 
	 */
	public Question getQuestion(String code) {
		try{
			Question entity = null;
			String sql = "select * from question where code = '" + code + "'";
			ResultSet rs = DBUtil.query(sql);
			rs.next();
			String type = rs.getString("type");
			String difficulty = rs.getString("difficulty");
			String content = rs.getString("content");
			String answer = rs.getString("answer");
			int point = rs.getInt("point");
			entity = new Question(code, type, difficulty, content, answer, point);
			DBUtil.close();
			return entity;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return null;
		}
	}
	
	/**
	 * 添加试题信息
	 * @param entity 试题实体
	 * @throws SQLException 
	 */
	public void saveQuestion(Question entity) {
		String sql = "insert into question(code, type, difficulty, content, answer, point) values('" + entity.getCode() + "','" + entity.getType() 
			+ "','" + entity.getDifficulty() + "','" + entity.getContent() + "','" + entity.getAnswer() + "'," + entity.getPoint() + ")";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 修改试题信息
	 * @param entity 试题实体
	 * @throws SQLException 
	 */
	public void editQuestion(Question entity) {
		String sql = "update question set type = '" + entity.getType() + "',difficulty = '" + entity.getDifficulty()
			+ "',content = '" + entity.getContent() + "',answer = '" + entity.getAnswer() + "',point = " + entity.getPoint()
			+ " where code = '" + entity.getCode() + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 删除试题
	 * @param code 试题编号
	 * @throws SQLException 
	 */
	public void deleteQuestion(String code) {
		String sql = "delete from question where code = '" + code + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 判断是否已存在该编号
	 * @param code 试题编号
	 * @return true已存在，false不存在
	 * @throws SQLException
	 */
	public boolean ifCodeExist(String code) {
		try{
			boolean exist = false;
			String sql = "select * from question";
			ResultSet rs = DBUtil.query(sql);
			while (rs.next()) {
				if (code.equals(rs.getString("code"))) {
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
