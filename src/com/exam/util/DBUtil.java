package com.exam.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * ������������ز���������
 */
public class DBUtil {

	private static Connection conn;
	private static Statement stmt;
	private static ResultSet rs;
	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	
	static{
		try {
			//�������ļ���ȡ���ݿ�������Ϣ
			InputStream is = DBUtil.class.getClassLoader().getResourceAsStream("database.properties");
			Properties properties = new Properties();
			properties.load(is);
			driver = properties.getProperty("driver");
			url = properties.getProperty("url");
			username = properties.getProperty("username");
			password = properties.getProperty("password");
		} catch (IOException ex) {
			System.err.println("IOException:" + ex.getMessage());
		}
	}
	
	/**
	 * ��ȡ���ݿ�����
	 */
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException ex) {
			System.err.println("ClassNotFoundException:" + ex.getMessage());
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
		}
		return conn;
	}
	
	/**
	 * �����ݿ��в�ѯ����
	 * @param sql ��ѯ���
	 * @return �����
	 */
	public static ResultSet query(String sql) {
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
			return null;
		}
	}

	/**
	 * �����ݽ�����ӡ�ɾ�����޸ĵȲ���
	 * @param sql ���/ɾ��/�޸����
	 */
	public static void update(String sql) {
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			System.err.println("SQLException:" + ex.getMessage());
		} finally {
			close();
		}
	}
	
	/**
     * �ͷ���Դ
     */
    public static void close() {
        try {
            if (rs != null) {
                rs.close();
                rs = null;
            }
            if (stmt != null) {
                stmt.close();
                stmt = null;
            }
            if (conn != null) {
            	conn.close();
            	conn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
