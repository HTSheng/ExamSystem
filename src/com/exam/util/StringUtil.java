package com.exam.util;

import java.io.UnsupportedEncodingException;

/**
 * 字符串相关操作工具类
 */
public class StringUtil {

	/**
	 * 编码格式转换
	 * @param str 待转换的字符串
	 * @return
	 */
	public static String convert(String str) {
		try {
			return (str == null) ? "" : new String(str.getBytes("ISO8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.err.println("UnsupportedEncodingException:" + e.getMessage());
			return "";
		}
	}
}
