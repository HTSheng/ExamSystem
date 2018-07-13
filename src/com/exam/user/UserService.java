package com.exam.user;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.exam.util.DBUtil;

public class UserService {
	
	/**
	 * 获取用户信息列表
	 * @return 用户列表
	 * @throws SQLException 
	 */
	public List<User> getUserList() {
		try{
			List<User> resultList = new LinkedList<User>();
			String sql = "select * from user";
			ResultSet rs = DBUtil.query(sql);
			while (rs.next()) {
				String code = rs.getString("code");
				String userName = rs.getString("username");
				String password = rs.getString("password");
				String realName = rs.getString("realname");
				String gender = rs.getString("gender");
				String identity = rs.getString("identity");
				User entity = new User(code, userName, password, realName, gender, identity);
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
	 * 根据编号获取用户信息
	 * @param code 用户编号
	 * @return 用户实体
	 * @throws SQLException 
	 */
	public User getUser(String code) {
		try{
			User entity = null;
			String sql = "select * from user where code = '" + code + "'";
			ResultSet rs = DBUtil.query(sql);
			rs.next();
			String userName = rs.getString("username");
			String password = rs.getString("password");
			String realName = rs.getString("realname");
			String gender = rs.getString("gender");
			String identity = rs.getString("identity");
			entity = new User(code, userName, password, realName, gender, identity);
			DBUtil.close();
			return entity;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return null;
		}
	}
	
	/**
	 * 根据用户名获取用户信息
	 * @param userName 用户名
	 * @return 用户实体
	 * @throws SQLException 
	 */
	public User getUserByUserName(String userName) {
		try{
			User entity = null;
			String sql = "select * from user where username = '" + userName + "'";
			ResultSet rs = DBUtil.query(sql);
			rs.next();
			String code = rs.getString("code");
			String password = rs.getString("password");
			String realName = rs.getString("realname");
			String gender = rs.getString("gender");
			String identity = rs.getString("identity");
			entity = new User(code, userName, password, realName, gender, identity);
			DBUtil.close();
			return entity;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return null;
		}
	}
	
	/**
	 * 添加用户信息
	 * @param entity 用户实体
	 * @throws SQLException 
	 */
	public void saveUser(User entity) {
		String sql = "insert into user(code, username, password, realname, gender, identity) values('" + entity.getCode() + "','" + entity.getUserName() 
			+ "','" + entity.getPassword() + "','" + entity.getRealName() + "','" + entity.getGender() + "','" + entity.getIdentity() + "')";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 修改用户信息
	 * @param entity 用户实体
	 * @throws SQLException 
	 */
	public void editUser(User entity) {
		String sql = "update user set username = '" + entity.getUserName() + "',realname = '" + entity.getRealName()
			+ "',password = '" + entity.getPassword() + "',gender = '" + entity.getGender() + "',identity = '" + entity.getIdentity()
			+ "' where code = '" + entity.getCode() + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 删除用户
	 * @param code 用户编号
	 * @throws SQLException 
	 */
	public void deleteUser(String code) {
		String sql = "delete from user where code = '" + code + "'";
		DBUtil.update(sql);
		DBUtil.close();
	}
	
	/**
	 * 判断是否已存在该编号
	 * @param code 用户编号
	 * @return true已存在，false不存在
	 * @throws SQLException
	 */
	public boolean ifCodeExist(String code) {
		try{
			boolean exist = false;
			String sql = "select * from user";
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
	
	/**
	 * 判断用户登录信息是否正确
	 * @param userName 用户名
	 * @param password 密码
	 * @return true正确,false不正确
	 * @throws SQLException 
	 */
	public boolean ifValid(String userName, String password) {
		try{
			boolean valid = false;
			String sql = "select * from user where username = '" + userName + "' and password = '" + password + "'";
			ResultSet rs = DBUtil.query(sql);
			if (rs.next()) {
				valid = true;
			}
			DBUtil.close();
			return valid;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return false;
		}
	}
}
